Create schema if not exists AuauFollow;

use Auaufollow;

create table if not exists Produtos(
	idProduto int primary key auto_increment,
	nome varchar(50),
    descricao varchar(1000),
    preco decimal(10,2),
    srcImage varchar(2000),
    altImage varchar(2000),
);

create table if not exists Clientes(
	idCliente int primary key auto_increment,
	nome varchar(50),
    idade integer
);

create table if not exists Cachorros(
	idCachorro int primary key auto_increment,
    nome varchar(50), 
    idade integer,
    raca varchar(100),
    genero varchar(10),
    fk_cliente int,
    foreign key(fk_cliente) references Clientes(idCliente)
);

create table if not exists Postagens(
	idPostagem int primary key auto_increment,
    srcImage varchar(2000),
    descricao varchar(2000),
    qntCurtidas int,
    fk_cliente int,
    
    foreign key (fk_cliente) references clientes(idCliente)
);

create table if not exists comentarios(
	idComentario int primary key auto_increment,
    mensagem varchar(900), 
    dataPostada datetime,
    fk_postagem int,
    fk_cliente int,
    
    foreign key (fk_cliente) references clientes(idCliente),
    foreign key (fk_postagem) references postagens(idPostagem)
);

create table if not exists carteirinha(
	nomeVeterinario varchar(200),
    vacinas varchar(400),
    fk_cachorro int,
    
    foreign key (fk_cachorro) references cachorros(idCachorro)
);

create table if not exists login(
	email varchar(100),
    senha varchar(100),
    fk_cliente int,
    
    foreign key (fk_cliente) references clientes(idCliente)
);

Aqui está a inserção em SQL para preencher as tabelas com 10 entradas cada:  


-- Inserindo na tabela Produtos
INSERT INTO Produtos (nome, descricao, preco, srcImage, altImage) VALUES
('Ração Premium', 'Ração para cães adultos.', 75.50, '/images/racao1.png', 'Ração em pacote.'),
('Brinquedo Bola', 'Bola resistente para cães.', 25.00, '/images/bola.png', 'Bola para cães.'),
('Shampoo Canino', 'Shampoo para pelos brilhantes.', 35.90, '/images/shampoo.png', 'Frasco de shampoo.'),
('Guia Retrátil', 'Guia de passeio com trava.', 50.00, '/images/guia.png', 'Guia retrátil para cães.'),
('Casinha de Plástico', 'Casinha para cães pequenos.', 150.00, '/images/casinha.png', 'Casinha confortável.'),
('Osso de Nylon', 'Brinquedo de mastigação durável.', 20.00, '/images/osso.png', 'Osso sintético para mastigar.'),
('Coleira Antipulgas', 'Coleira eficaz contra pulgas e carrapatos.', 45.00, '/images/coleira.png', 'Coleira antipulgas.'),
('Comedouro Inteligente', 'Comedouro com dispensador automático.', 120.00, '/images/comedouro.png', 'Comedouro automático.'),
('Tapete Higiênico', 'Tapete descartável para cães.', 30.00, '/images/tapete.png', 'Tapete absorvente.'),
('Cama Ortopédica', 'Cama confortável para cães idosos.', 200.00, '/images/cama.png', 'Cama macia para cães.');

-- Inserindo na tabela Clientes
INSERT INTO Clientes (nome, idade) VALUES
('João Silva', 30),
('Maria Oliveira', 25),
('Carlos Souza', 40),
('Ana Lima', 28),
('Fernanda Costa', 35),
('Ricardo Pereira', 50),
('Paula Santos', 22),
('Lucas Almeida', 29),
('Juliana Martins', 32),
('Tiago Mendes', 45);

-- Inserindo na tabela Cachorros
INSERT INTO Cachorros (nome, idade, raca, genero, fk_cliente) VALUES
('Rex', 4, 'Labrador', 'Macho', 1),
('Luna', 2, 'Poodle', 'Fêmea', 2),
('Thor', 3, 'Golden Retriever', 'Macho', 3),
('Bella', 5, 'Beagle', 'Fêmea', 4),
('Max', 1, 'Bulldog', 'Macho', 5),
('Sophie', 6, 'Shih Tzu', 'Fêmea', 6),
('Buddy', 7, 'Pastor Alemão', 'Macho', 7),
('Chloe', 2, 'Cocker Spaniel', 'Fêmea', 8),
('Duke', 3, 'Husky Siberiano', 'Macho', 9),
('Molly', 8, 'Buldogue Francês', 'Fêmea', 10);

-- Inserindo na tabela Postagens
INSERT INTO Postagens (srcImage, descricao, qntCurtidas, fk_cliente) VALUES
('/posts/post1.png', 'Dia de parque com o Rex!', 150, 1),
('/posts/post2.png', 'Luna curtindo a praia.', 200, 2),
('/posts/post3.png', 'Thor no seu primeiro passeio!', 180, 3),
('/posts/post4.png', 'Bella aprendeu um novo truque.', 220, 4),
('/posts/post5.png', 'Max brincando no quintal.', 90, 5),
('/posts/post6.png', 'Sophie no veterinário.', 60, 6),
('/posts/post7.png', 'Buddy correndo no parque.', 110, 7),
('/posts/post8.png', 'Chloe e sua nova coleira.', 140, 8),
('/posts/post9.png', 'Duke explorando a neve.', 300, 9),
('/posts/post10.png', 'Molly relaxando na cama nova.', 75, 10);

-- Inserindo na tabela Comentarios
INSERT INTO Comentarios (mensagem, dataPostada, fk_postagem, fk_cliente) VALUES
('Que lindo dia no parque!', '2024-12-01 10:00:00', 1, 2),
('Adorei a praia da Luna!', '2024-12-01 12:00:00', 2, 3),
('Thor está crescendo rápido!', '2024-12-02 08:30:00', 3, 4),
('Parabéns pelo novo truque, Bella!', '2024-12-02 15:45:00', 4, 5),
('Max está tão fofo!', '2024-12-03 09:20:00', 5, 6),
('Sophie parece muito saudável!', '2024-12-03 14:00:00', 6, 7),
('Buddy adora correr!', '2024-12-04 10:30:00', 7, 8),
('Chloe está linda com a nova coleira!', '2024-12-04 18:15:00', 8, 9),
('Duke parece estar amando a neve.', '2024-12-05 07:50:00', 9, 10),
('Molly está tão tranquila!', '2024-12-05 20:00:00', 10, 1);

-- Inserindo na tabela Carteirinha
INSERT INTO Carteirinha (nomeVeterinario, vacinas, fk_cachorro) VALUES
('Dr. José', 'Raiva, V8', 1),
('Dra. Marina', 'V10, Gripe', 2),
('Dr. Carlos', 'Raiva, V8', 3),
('Dra. Ana', 'V10, Giardia', 4),
('Dr. Paulo', 'Raiva, V8', 5),
('Dra. Fernanda', 'V10, Leishmaniose', 6),
('Dr. Ricardo', 'Raiva, V8', 7),
('Dra. Juliana', 'V10, Gripe', 8),
('Dr. Eduardo', 'Raiva, V8', 9),
('Dra. Camila', 'V10, Giardia', 10);

-- Inserindo na tabela Login
INSERT INTO Login (email, senha, fk_cliente) VALUES
('joao@example.com', 'senha123', 1),
('maria@example.com', 'senha123', 2),
('carlos@example.com', 'senha123', 3),
('ana@example.com', 'senha123', 4),
('fernanda@example.com', 'senha123', 5),
('ricardo@example.com', 'senha123', 6),
('paula@example.com', 'senha123', 7),
('lucas@example.com', 'senha123', 8),
('juliana@example.com', 'senha123', 9),
('tiago@example.com', 'senha123', 10);
