from app import app
from app.controller import regisController
from flask import request


@app.route('/regis_konseling', methods=['POST'])
def regis():
    return regisController.store()
