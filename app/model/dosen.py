from app import db
from datetime import datetime

class Dosens(db.Model):
    id_dosen     = db.Column(db.BigInteger,primary_key=True,autoincrement=False)
    nama_dosen  = db.Column(db.Integer,nullable=False)
