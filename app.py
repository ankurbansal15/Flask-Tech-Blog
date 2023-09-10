import math
import os

from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from werkzeug.utils import secure_filename
import json
from _datetime import datetime

with open('config.json', 'r') as c:
    params = json.load(c)["params"]
locale_server = params['local_server']
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-username'],
    MAIL_PASSWORD=params['gmail-password']
)
mail = Mail(app)
if locale_server:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    mes = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    img_file = db.Column(db.String(12), nullable=True)
    date = db.Column(db.String(12), nullable=True)


@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_post']))
    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1
    page = int(page)
    no_of_post = int(params['no_of_post'])
    posts = posts[(page-1)*no_of_post:(page-1)*no_of_post+no_of_post]
    if page == 1:
        prev = "#"
        next1 = "/?page=" + str(page + 1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next1 = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next1 = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, prev=prev, next=next1)


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


@app.route('/about')
def about():  # put application's code here
    return render_template('about.html', params=params)


@app.route('/logout')
def logout():  # put application's code here
    session.pop('user')
    return redirect('/dashboard')


@app.route('/delete/<string:sno>',methods=["GET","POST"])
def delete(sno):  # put application's code here
    if 'user' in session and session['user'] == params['admin_username']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route('/uploader', methods=['GET', 'POST'])
def upload():  # put application's code here
    if 'user' in session and session['user'] == params['admin_username']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded Successfully"


@app.route('/dashboard', methods=['POST', 'GET'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_username']:
        posts = Posts.query.filter_by().all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if username == params['admin_username'] and userpass == params['admin_password']:
            session['user'] = username
            posts = Posts.query.filter_by().all()
            return render_template('dashboard.html', params=params, posts=posts)

    return render_template('login.html', params=params)


@app.route('/edit/<string:sno>', methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_username']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            tagline = request.form.get('tagline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()
            if sno == '0':
                post = Posts(title=box_title, slug=slug, content=content, tagline=tagline, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.tagline = tagline
                post.slug = slug
                post.content = content
                post.img_file = post.img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)
    post = Posts.query.filter_by(sno=sno).first()
    return render_template('edit.html', params=params, post=post)


@app.route('/contact', methods=['GET', 'POST'])
def contact():  # put application's code here
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num=phone, mes=message, date=datetime.now(), email=email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New Message From ' + name,
                          sender=email,
                          recipients=[params['gmail-username']],
                          body=message + "\n" + phone
                          )

    return render_template('contact.html', params=params)


if __name__ == '__main__':
    app.run()
