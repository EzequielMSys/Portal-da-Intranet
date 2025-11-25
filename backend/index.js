const express = require('express')
const cors = require('cors')
const mysql = require('mysql2/promise')
const porta = 3000
const app = express()

//importa o módulo de conexão com o DB
const conexao = require('./db.js')

// modulo crypto
const crypto = require('crypto')
app.use(cors())
// puxando do 
app.use(express.json())

console.log("Servidor rodando !")

app.listen(porta, ()=>{
})

//criando uma rota
app.get("/hash", async (req,res)=>{
    try {
        let {senha} = req.body

        //ma the us

        senha = senha.trim()
        senha = senha.replace(" ","")
        //matheus 

        if(senha==""){
            return res.send("Preencha uma senha")
        }else if(senha.length  <6){
            return res.send("A senha tem que conter no minimo 6 caracteres")
        }

        const hash  = crypto.createHash("sha256").update(senha).digest("hex")

       res.send(`Senha enviada ${hash}`) 

    } catch (error) {
        console.log(`O erro exibido foi ${error}`) 
    }
})

app.post("/cadastro", async (req,res)=>{
    try {
        
        const {nome,email,dt_nasc} = req.body
        let {senha} = req.body
        
        senha = senha.trim()
        if(senha ==""){
            return res.json({"resposta" : "Insira uma senha" })
        } else if(senha.length < 6) {
            return res.json({"resposta" : "Digite uma senha com pelo menos 6 caracteres" })
        } else if (email.length < 6){
            return res.json({"resposta" : "Preencha um e-mail" })
        } else if (nome.length < 6){
            return res.json({"resposta" : "Preencha um nome" })
        }

        //verificar e o e-mail já está cadastrado
        
        let sql = `select * from cadastro where email = ?`
        let [resultado] = await conexao.query(sql, [email])
        console.log(resultado.length)
        if(resultado.length != 0 ){
            return res.json({"resposta":"E-mail já cadastrado"})
        }
    
        const hash = crypto.createHash("sha256").update(senha).digest("hex")
        sql = `insert into cadastro (nome,email,senha,dt_nasc) values (?,?,?,?)`
        let [resultado2] = await conexao.query(sql,[nome,email,hash,dt_nasc])

        if(resultado2.affectedRows == 1){
           return res.json({"resposta":"Cadastro efetuado com sucesso!"})
        }else{
           return res.json({"resposta":"Erro ao fazer cadastro!"})
        }
        
    } catch (error) {
        console.log(error)
    }
})

app.post("/login", async (req,res)=>{
    try {
        const {email} = req.body
        let {senha} = req.body

        senha = senha.trim()
        senha = senha.replace("ㅤ","")

        if (senha =="") {
            return res.send("Preencha uma senha")
        } else if (senha.length < 6) {
            return res.send("A senha tem que conter no minimo 6 caracteres")
        }

        const sqlBusca = `SELECT senha FROM cadastro WHERE email=?`
        const [usuarios] = await conexao.query(sqlBusca, [email])

        if (usuarios.length === 0) {}
    
        const hashSalvo = usuarios[0].senha;
        const hashTentativa = crypto.createHash("sha256").update(senha).digest("hex")
    
        if(hashTentativa === hashSalvo){}
        else{}
        
    } catch (error) {
        console.log(error)
    }
})