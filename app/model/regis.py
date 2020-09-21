from app import db
from datetime import datetime

class Konselings(db.Model):
    id          = db.Column(db.BigInteger,primary_key=True,autoincrement=True)
    sesi_waktu  = db.Column(db.Integer,nullable=False)
    sesi_hari   = db.Column(db.Integer,nullable=False)
    nim         = db.Column(db.String(50), nullable=False)
    id_dosen    = db.Column(db.String(10), nullable=False)
    email_mhs   = db.Column(db.String(10), nullable=False)
    status      = db.Column(db.String(2), nullable=False)
    created_at  = db.Column(db.DateTime,default=datetime.utcnow)
    updated_at  = db.Column(db.DateTime,default=datetime.utcnow)
