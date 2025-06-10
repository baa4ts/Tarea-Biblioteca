import mysql from 'mysql2/promise';

async function main() {
  // Crear la conexión
  const connection = await mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'appuser',
    password: 'apppass',
    database: 'Biblioteca',
  });

  try {
    // Ejemplo de consulta
    const [rows] = await connection.execute('SELECT NOW() AS now');
    console.log('Hora actual del servidor MySQL:', rows[0].now);
  } catch (error) {
    console.error('Error en la consulta:', error);
  } finally {
    await connection.end();
  }
}

main();
