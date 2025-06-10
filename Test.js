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
    // Ejecutar consulta para contar autores
    const [rows] = await connection.execute('SELECT COUNT(*) AS `Total Autores` FROM Autores');
    console.log('Total de autores:', rows[0]['Total Autores']);
  } catch (error) {
    console.error('Error en la consulta:', error);
  } finally {
    await connection.end();
  }
}

main();
