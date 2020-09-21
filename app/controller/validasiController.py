from app.model.regis import Konselings
from app.model.sesidosen import SesiDosens
from app.model.dosen import Dosens
from app import response,db
from flask import request,jsonify
from app import db
from flask_jwt_extended import *
from pprint import pprint
import datetime
from flask_mail import Message
from app import mail
from flask import render_template

@jwt_required
def validasi():
    try:
        sesi_waktu = request.json['sesi_waktu']
        sesi_hari = request.json['sesi_hari']
        nim = request.json['nim']
        id_dosen = request.json['id_dosen']
        # email = request.json['id_dosen']

        konsel = Konselings.query.filter_by(nim=nim,id_dosen=id_dosen).first()
        if not konsel:
            return jsonify({'code' : '409','message' : 'data tidak ditemukan'})
        else:
            konsel.status = 1
            db.session.commit()
            msg = Message(f"Hello, mahasiswa dengan NIM {nim}",
                        sender="armancamp2006@mail.com")
            msg.add_recipient(konsel.email_mhs)
            message_value = f"INFORMASI!!! Pendaftaran konseling skripsi dengan NIM: {nim} telah kami validasi, silahkan datang untuk konseling sesuai dengan sesi yang dipilih. Terima kasih."
            msg.html = render_template('index.html',message_key=message_value)
            mail.send(msg)
            return jsonify({'code' : '200','message' : 'update berhasil'})
    except Exception as e:
        return jsonify({'code' : '500','message' : 'internal server error'})