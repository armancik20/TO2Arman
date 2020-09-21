from app.model.regis import Konselings
from app.model.sesidosen import SesiDosens
# from app.model.dosen import Dosens
from app import response,db
from flask import request,jsonify
from app import db
from flask_jwt_extended import *
from pprint import pprint
import datetime
from app import mail

@jwt_required
def store():
    try:
        sesi_waktu = request.json['sesi_waktu']
        sesi_hari = request.json['sesi_hari']
        nim = request.json['nim']
        email_mhs = request.json['email_mhs']
        id_dosen = request.json['id_dosen']

        cek_regis = Konselings.query.filter_by(nim=nim,sesi_hari=sesi_hari,sesi_waktu=sesi_waktu).first()
        cek_sesi_dosen = SesiDosens.query.filter_by(id_dosen=id_dosen,sesi_hari=sesi_hari,sesi_waktu=sesi_waktu).first()
        # print(cek_sesi_dosen)
        if not cek_sesi_dosen:
            return jsonify({'code' : '408','message' : 'jadwal tidak ada'})

        if not cek_regis:
            reg = Konselings(sesi_waktu=sesi_waktu,sesi_hari=sesi_hari, nim=nim, id_dosen=id_dosen,email_mhs=email_mhs)
            db.session.add(reg)
            db.session.commit()
            return jsonify({'code' : '200','message' : 'pendaftaran berhasil'})
        else:
            return jsonify({'code' : '408','message' : 'Mahasiswa Dengan NIM '+ str(nim) + ' Sudah Terdaftar Di Hari '+ str(sesi_hari) +' Sesi '+ str(sesi_waktu)})
    except Exception as e:
        return jsonify({'code' : '500','message' : 'internal server error'})