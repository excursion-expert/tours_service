const { Pool } = require('pg');
const pass = require('./dbpass.js')

const pool = new Pool({
  user: pass.user,
  host: pass.host,
  database: pass.database,
  password: process.env.postgrespw,
  port: 5432,
})

pool.connect()
  .then(success => {
    console.log('connected to db');
  })
  .catch (err => {
    console.log('could not connect to db err: ', err);
  })

module.exports = pool;