const mysql = require('mysql2');
require('dotenv').config(); //Reconhecer o .env

// Crie a conexão com o banco de dados
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',      
  password: process.env.SENHADB,      
  database: 'auaufollow'  
});

// Testando a conexão
connection.connect((err) => {
  if (err) {
    console.error('Erro ao conectar com o banco de dados:', err.stack);
    return;
  }
  console.log('Conectado ao banco de dados como id ' + connection.threadId);
});

module.exports = connection;  // Exportando a conexão para usar em outras partes do app
