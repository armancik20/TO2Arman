from app import db
from datetime import datetime


class SesiDosens(db.Model):
    id_dosen = db.Column(db.Integer, primary_key=True, autoincrement=False)
    sesi_hari = db.Column(db.Text, primary_key=True, nullable=False)
    sesi_waktu = db.Column(db.BigInteger, primary_key=True, nullable=False)



    # def __repr__(self):
    #     return '<kode_dosen {}>'.format(self.kode_dosen)