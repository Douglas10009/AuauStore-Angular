const mysql = require('mysql2');

// Crie a conexão com o banco de dados
const connection = mysql.createConnection({
  host: 'localhost', // O servidor onde o MySQL está rodando
  user: 'root',      // Usuário do MySQL (o padrão é 'root')
  password: '1234',      // Senha do MySQL (deixe em branco se não houver senha)
  database: 'AuauStore'  // O nome do banco de dados que criamos
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
