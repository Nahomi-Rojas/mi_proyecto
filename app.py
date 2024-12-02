from flask import Flask, render_template
import psycopg2
import os

app = Flask(__name__)

# Función para conectar a la base de datos PostgreSQL en Render
def get_db_connection():
    conn = psycopg2.connect(
        os.environ['postgresql://proyecto_pydy_user:uRNXj5lmOTpTrIML4X5irY7UDqHbnl70@dpg-ct6j0cqj1k6c73aehd70-a.oregon-postgres.render.com/proyecto_pydy'], sslmode='require'
    )
    return conn

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/reportes')
def reportes():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM reportes;')
    reportes = cursor.fetchall()
    conn.close()
    return render_template('reportes.html', reportes=reportes)

if __name__ == '__main__':
    app.run(debug=True)

# Crear tablas en la base de datos (ejecuta esto una sola vez)
def inicializar_bd():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS reportes (
            id SERIAL PRIMARY KEY,
            paciente TEXT NOT NULL,
            fecha TEXT NOT NULL,
            sintomas TEXT NOT NULL,
            observaciones TEXT,
            diagnostico TEXT NOT NULL
        )
    ''')
    conn.commit()
    conn.close()
    print("Tabla creada correctamente.")

# Ejecuta esto una sola vez en Render
if __name__ == '__main__':
    inicializar_bd()
