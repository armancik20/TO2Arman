from app.model.user import Users
from app import response, app
from flask import request, jsonify, make_response
from app import db
import jwt
from flask_jwt_extended import *
import datetime

from app import mail
from flask_mail import Message
from flask import render_template

app.config['SECRET_KEY'] = 'thisismyjwt'
def login():
    # try:
    auth = request.authorization
    if auth :
        email = auth.username
        password = auth.password
        user = Users.query.filter_by(email=email).first()
        password = Users.query.filter_by(password=password).first()
        if not user:
            return jsonify({'code' : '408','message' : 'invalid email'})
        if not password:
            return jsonify({'code' : '409','message' : 'invalid password'})
        else:
            # token = jwt.encode({'user' : auth.username, 'exp' : datetime.datetime.utcnow() + datetime.timedelta(minutes=30)},app.config['SECRET_KEY'])
            expires = datetime.timedelta(minutes=30)
            access_token = create_access_token(email, fresh=True, expires_delta=expires)
            return jsonify({'code' : '203','token' : access_token})
    return make_response({'code' : '499','message' : 'username & password required'},401,{'WWW-Authenticate':'Basic realm = "login-required"'})
    # except Exception as e:
    #     return jsonify({'code' : '500','message' : 'internal server error'})
    # except Exception as e:
    #     print(e)
