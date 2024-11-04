import pyodbc
import csv
import os
import configparser

config = configparser.ConfigParser()

config.read('config.ini')

try:
    db_config = {
        'driver': config['database']['driver'],
        'server': config['database']['server'],
        'database': config['database']['database'],
        'trusted_connection': config['database']['trusted_connection']
    }

    connection_string = (
        f"DRIVER={db_config['driver']};"
        f"SERVER={db_config['server']};"
        f"DATABASE={db_config['database']};"
        "Trusted_Connection=yes;"
    )
    print(f"Connection string: {connection_string}")

    conn = pyodbc.connect(connection_string)
    print('Conexión exitosa')

    cursor = conn.cursor()

    script_dir = os.path.dirname(__file__)
    csv_file_path = os.path.join(script_dir, 'datasets', 'ventas_actualizado.csv')

    cursor.execute('TRUNCATE TABLE Stg_Fact_Ventas')
    print('Tabla Stg_Fact_Ventas truncada')

    with open(csv_file_path, mode='r', encoding='utf-8') as file:
        csv_reader = csv.reader(file)
        header = next(csv_reader)

        for row in csv_reader:
            cursor.execute("""
                INSERT INTO Stg_Fact_Ventas (FechaVenta, CodigoProducto, Producto, Cantidad, PrecioVenta, CodigoCliente, Cliente, CodigoTienda, Tienda, CodigoEmpleado)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, row)

    conn.commit()
    print('Datos insertados correctamente')

except pyodbc.Error as db_err:
    print(f"Error de base de datos: {db_err}")
except Exception as e:
    print(f"Error general: {e}")
finally:
    if 'cursor' in locals():
        cursor.close()
    if 'conn' in locals():
        conn.close()