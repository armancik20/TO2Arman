from app import app
from app.controller import validasiController


@app.route('/validasi_konseling', methods=['POST'])
def validasi():
    return validasiController.validasi()
