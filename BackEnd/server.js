/*
TODO -- 

- Falta modularizar as querys do banco de dados 
- services 
- Criptografar as informações relevantes

*/

const express = require("express");
const { body, validationResult } = require('express-validator');
const connection = require("./db");
const path = require('path');
const cors = require("cors")

const app = express();

// Middlewares
app.use(express.json()); //  para o express entender o body
app.use(cors()); // Para consertar questões de headers


// Rotas
app.get("/", (req, res) => {
    const filePath = path.join(__dirname, 'public', 'index.html');  // Caminho para o arquivo HTML
    res.sendFile(filePath);  // Envia o arquivo HTML para o cliente
})

app.get("/babidi", (req, res) => {
    res.send("Babiididdiddiididid")
})


// -- Produtos

// Criar produtos
app.post("/produtos", [
    // Valida o campo nome
    body('nome')
        .notEmpty().withMessage("O nome não pode estar vazio")
        .isString().withMessage("O nome precisa ser uma string"),

    // Valida o campo preco
    body('preco')
        .notEmpty().withMessage("O preco não pode ser vazio")
        .isFloat({ min: 0 }).withMessage("O preço precisa ser maior que 0")
], async (req, res) => {

    //Verifica se tem algum erro
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
    }

    // Continua caso não tenha erros

    try {
        const [request] = await connection.promise().query("INSERT INTO produtos(nome, preco) VALUES(?,?)", [req.body.nome, req.body.preco]);

        if (request.affectedRows > 0) {
            res.status(201).json({ message: "Produto criado com sucesso" })
        } else {
            res.status(400).json({ message: "Não foi possível inserir o produto" })
        }
    } catch (error) {
        res.status(500).json({ message: "Erro ao adicionar o produto", error:error.message })
    }
})


// Listar produtos
app.get("/produtos", async (req, res) => {

    try {
        const [produtos] = await connection.promise().query("SELECT * FROM produtos");
        res.status(200).json(produtos);
    } catch (error) {
        res.status(500).json({
            message: "Erro ao buscar os produtos",
            error: error.message
        })
    }

})

// - Listando produtos individualmente
app.get("/produtos/:id", async (req, res) => {
    const { id } = req.params;

    try {
        const [produto] = await connection.promise().query("SELECT * FROM produtos WHERE id = ?", [id])

        if (produto.length > 0) {
            res.status(200).json({ produto: produto[0] })
        } else {
            res.status(404).json({ message: "Produto não encontrado" })
        }

    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar o produto", error: error.message })
    }
})

// Atualizando valores
app.put("/produtos/:id", [
    // Valida o campo nome
    body('nome')
        .notEmpty().withMessage("O nome não pode estar vazio")
        .isString().withMessage("O nome precisa ser uma string"),

    // Valida o campo preco
    body('preco')
        .notEmpty().withMessage("O preco não pode ser vazio")
        .isFloat({ min: 0 }).withMessage("O preço precisa ser maior que 0")
], async (req, res) => {
    //Verifica se tem algum erro
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
    }

    // Caso não tem, continua
    const { id } = req.params;
    const { nome, preco } = req.body;

    try {
        const [produto] = await connection.promise().query("SELECT * FROM produtos WHERE id=?", [id]);

        if (produto.length > 0) {
            const [resultado] = await connection.promise().query("UPDATE produtos SET nome=?, preco=? WHERE id=?",
                [nome, preco, id])

            if (resultado.affectedRows > 0) {
                const [produtoAtualizado] = await connection.promise().query("SELECT * FROM produtos WHERE id = ?", [id]);

                res.status(200).json({
                    message: "Produto atualizado com sucesso",
                    ColunasAlteradas: resultado.affectedRows,
                    produto: produtoAtualizado[0]
                })

            } else {
                res.status(500).json({ message: "Erro ao atualizar o produto" })
            }
        } else {
            res.status(404).json({ message: "Produto não encontrado" })
        }

    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar o produto", error: error.message })
    }
})

// Apagando valores
app.delete("/produtos/:id", async (req, res) => {
    const { id } = req.params;

    try {
        const [results] = await connection.promise().query("DELETE FROM produtos WHERE id=?", [id])

        if (results.affectedRows > 0) {
            res.status(204).send();
        } else {
            res.status(404).json({ message: "Produto não encontrado" })
        }
    } catch (error) {
        res.status(500).json({ message: 'Erro ao deletar produto', error: error.message });
    }
})


// -- Clientes

app.get("/clientes", async(req,res) => {
    try {
        const [results] = await connection.promise().query("select * from clientes c inner join login l on c.idCliente = l.fk_cliente;");

        res.json(results);
    } catch (error) {
        console.log("Erro ao pegar clientes", error);
        
    }
})


// Ouvir porta
app.listen(3000, () => {
    console.log("Servidor Rodando na porta: 3000")
});
