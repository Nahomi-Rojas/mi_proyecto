from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "¡Hola, Flask!"

if __name__ == "__main__":
    app.run(debug=True)


conn = get_db_connection()
cursor = conn.cursor()
cursor.execute('''
    CREATE TABLE IF NOT EXISTS reportes (
        id SERIAL PRIMARY KEY,
        paciente TEXT,
        fecha TEXT,
        sintomas TEXT,
        observaciones TEXT,
        diagnostico TEXT,
        medico TEXT
    )
''')
conn.commit()
conn.close()

