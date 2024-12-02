from flask import Flask, render_template, request, redirect, url_for
import psycopg2
import os

app = Flask(__name__)

# Conexión a la base de datos PostgreSQL en Render
def get_db_connection():
    conn = psycopg2.connect(
        os.environ['DATABASE_URL'], sslmode='require'
    )
    return conn

# Página principal
@app.route('/')
def index():
    return render_template('index.html')



# Ruta para ver pacientes
@app.route('/pacientes')
def pacientes():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM pacientes;')
    pacientes = cursor.fetchall()
    conn.close()
    return render_template('pacientes.html', pacientes=pacientes)

# Ruta para ver imágenes
@app.route('/imagenes')
def imagenes():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM imagenes;')
    imagenes = cursor.fetchall()
    conn.close()
    return render_template('imagenes.html', imagenes=imagenes)

# Ruta para ver diagnósticos
@app.route('/diagnostico')
def diagnostico():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM diagnostico;')
    diagnosticos = cursor.fetchall()
    conn.close()
    return render_template('diagnostico.html', diagnosticos=diagnosticos)

if __name__ == '__main__':
    app.run(debug=True)

def inicializar_bd():
    conn = get_db_connection()
    cursor = conn.cursor()
    # Aquí agregas las sentencias SQL de creación de tablas.
    cursor.execute(''' 
        CREATE TABLE IF NOT EXISTS pacientes (
            id_paciente SERIAL PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            edad INT,
            genero VARCHAR(10),
            fecha_reporte DATE NOT NULL,
            historial_clinico TEXT
        );
    ''')
    # Crear el resto de las tablas
    conn.commit()
    conn.close()

if __name__ == '__main__':
    inicializar_bd()  # Crear tablas
    app.run(debug=True)
