Create schema if not exists AuauFollow;

use Auaufollow;

create table if not exists Produtos(
	idProdutos int primary key auto_increment,
	nome varchar(50),
    descricao varchar(1000),
    preco decimal(10,2),
    srcImage varchar(2000)
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

