const mysql = require('mysql2');

const db = mysql.createConnection({
  host: '192.168.10.1',
  user: 'sa',
  password: 'P@ssw0rd',
  database: 'WebCW'
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});

module.exports = db;
