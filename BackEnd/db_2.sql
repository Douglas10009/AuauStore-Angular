





--  FALTA OS MENINOS CONSERTAREM OS INSERTS DAS TABELAS (menos produtos)







DROP schema auaufollow;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema auaufollow
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema auaufollow
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `auaufollow` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `auaufollow` ;

-- -----------------------------------------------------
-- Table `auaufollow`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`clientes` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NULL DEFAULT NULL,
  `idade` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`cachorrosadocao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`cachorrosadocao` (
  `idCachorroAdocao` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NULL DEFAULT NULL,
  `raca` VARCHAR(100) NULL DEFAULT NULL,
  `idade` INT(11) NULL DEFAULT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `adotado` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`idCachorroAdocao`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`adocoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`adocoes` (
  `idAdocao` INT(11) NOT NULL AUTO_INCREMENT,
  `idCliente` INT(11) NULL DEFAULT NULL,
  `idCachorroAdocao` INT(11) NULL DEFAULT NULL,
  `dataAdocao` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idAdocao`),
  INDEX `idCliente` (`idCliente` ASC) VISIBLE,
  INDEX `idCachorroAdocao` (`idCachorroAdocao` ASC) VISIBLE,
  CONSTRAINT `adocoes_ibfk_1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `auaufollow`.`clientes` (`idCliente`),
  CONSTRAINT `adocoes_ibfk_2`
    FOREIGN KEY (`idCachorroAdocao`)
    REFERENCES `auaufollow`.`cachorrosadocao` (`idCachorroAdocao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`amizades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`amizades` (
  `idAmizade` INT(11) NOT NULL AUTO_INCREMENT,
  `idCliente1` INT(11) NULL DEFAULT NULL,
  `idCliente2` INT(11) NULL DEFAULT NULL,
  `status` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idAmizade`),
  INDEX `idCliente1` (`idCliente1` ASC) VISIBLE,
  INDEX `idCliente2` (`idCliente2` ASC) VISIBLE,
  CONSTRAINT `amizades_ibfk_1`
    FOREIGN KEY (`idCliente1`)
    REFERENCES `auaufollow`.`clientes` (`idCliente`),
  CONSTRAINT `amizades_ibfk_2`
    FOREIGN KEY (`idCliente2`)
    REFERENCES `auaufollow`.`clientes` (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`racas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`racas` (
  `idRaca` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `origem` VARCHAR(100) NULL DEFAULT NULL,
  `tamanho` VARCHAR(50) NULL DEFAULT NULL,
  `expectativaVida` INT(11) NULL DEFAULT NULL,
  `nivelAtividade` VARCHAR(50) NULL DEFAULT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idRaca`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`cachorros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`cachorros` (
  `idCachorro` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NULL DEFAULT NULL,
  `idade` INT(11) NULL DEFAULT NULL,
  `fk_raca` INT(11) NULL DEFAULT NULL,
  `genero` VARCHAR(10) NULL DEFAULT NULL,
  `fk_cliente` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idCachorro`),
  INDEX `fk_cliente` (`fk_cliente` ASC) VISIBLE,
  INDEX `fk_raca` (`fk_raca` ASC) VISIBLE,
  CONSTRAINT `cachorros_ibfk_1`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `auaufollow`.`clientes` (`idCliente`),
  CONSTRAINT `cachorros_ibfk_2`
    FOREIGN KEY (`fk_raca`)
    REFERENCES `auaufollow`.`racas` (`idRaca`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`caracteristicassaude`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`caracteristicassaude` (
  `idCaracteristica` INT(11) NOT NULL AUTO_INCREMENT,
  `idRaca` INT(11) NULL DEFAULT NULL,
  `problemaSaude` VARCHAR(200) NULL DEFAULT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idCaracteristica`),
  INDEX `idRaca` (`idRaca` ASC) VISIBLE,
  CONSTRAINT `caracteristicassaude_ibfk_1`
    FOREIGN KEY (`idRaca`)
    REFERENCES `auaufollow`.`racas` (`idRaca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`carteirinha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`carteirinha` (
  `idCarteirinha` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeVeterinario` VARCHAR(200) NULL DEFAULT NULL,
  `vacinas` TEXT NULL DEFAULT NULL,
  `fk_cachorro` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idCarteirinha`),
  INDEX `fk_cachorro` (`fk_cachorro` ASC) VISIBLE,
  CONSTRAINT `carteirinha_ibfk_1`
    FOREIGN KEY (`fk_cachorro`)
    REFERENCES `auaufollow`.`cachorros` (`idCachorro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`categoriasprodutos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`categoriasprodutos` (
  `idCategoria` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`eventos` (
  `idEvento` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `dataInicio` DATETIME NULL DEFAULT NULL,
  `dataFim` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idEvento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`clienteseventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`clienteseventos` (
  `idCliente` INT(11) NOT NULL,
  `idEvento` INT(11) NOT NULL,
  PRIMARY KEY (`idCliente`, `idEvento`),
  INDEX `idEvento` (`idEvento` ASC) VISIBLE,
  CONSTRAINT `clienteseventos_ibfk_1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `auaufollow`.`clientes` (`idCliente`),
  CONSTRAINT `clienteseventos_ibfk_2`
    FOREIGN KEY (`idEvento`)
    REFERENCES `auaufollow`.`eventos` (`idEvento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`postagens` (
  `idPostagem` INT(11) NOT NULL AUTO_INCREMENT,
  `srcImage` VARCHAR(2000) NULL DEFAULT NULL,
  `descricao` VARCHAR(2000) NULL DEFAULT NULL,
  `qntCurtidas` INT(11) NULL DEFAULT NULL,
  `fk_cliente` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idPostagem`),
  INDEX `fk_cliente` (`fk_cliente` ASC) VISIBLE,
  CONSTRAINT `postagens_ibfk_1`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `auaufollow`.`clientes` (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`comentarios` (
  `idComentario` INT(11) NOT NULL AUTO_INCREMENT,
  `mensagem` VARCHAR(900) NULL DEFAULT NULL,
  `dataPostada` DATETIME NULL DEFAULT NULL,
  `fk_postagem` INT(11) NULL DEFAULT NULL,
  `fk_cliente` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_cliente` (`fk_cliente` ASC) VISIBLE,
  INDEX `fk_postagem` (`fk_postagem` ASC) VISIBLE,
  CONSTRAINT `comentarios_ibfk_1`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `auaufollow`.`clientes` (`idCliente`),
  CONSTRAINT `comentarios_ibfk_2`
    FOREIGN KEY (`fk_postagem`)
    REFERENCES `auaufollow`.`postagens` (`idPostagem`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`veterinarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`veterinarios` (
  `idVeterinario` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `contato` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idVeterinario`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`consultas` (
  `idConsulta` INT(11) NOT NULL AUTO_INCREMENT,
  `idVeterinario` INT(11) NULL DEFAULT NULL,
  `idCachorro` INT(11) NULL DEFAULT NULL,
  `dataConsulta` DATETIME NULL DEFAULT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idConsulta`),
  INDEX `idVeterinario` (`idVeterinario` ASC) VISIBLE,
  INDEX `idCachorro` (`idCachorro` ASC) VISIBLE,
  CONSTRAINT `consultas_ibfk_1`
    FOREIGN KEY (`idVeterinario`)
    REFERENCES `auaufollow`.`veterinarios` (`idVeterinario`),
  CONSTRAINT `consultas_ibfk_2`
    FOREIGN KEY (`idCachorro`)
    REFERENCES `auaufollow`.`cachorros` (`idCachorro`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`cuidadosespecificos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`cuidadosespecificos` (
  `idCuidado` INT(11) NOT NULL AUTO_INCREMENT,
  `idRaca` INT(11) NULL DEFAULT NULL,
  `tipoCuidado` VARCHAR(100) NULL DEFAULT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idCuidado`),
  INDEX `idRaca` (`idRaca` ASC) VISIBLE,
  CONSTRAINT `cuidadosespecificos_ibfk_1`
    FOREIGN KEY (`idRaca`)
    REFERENCES `auaufollow`.`racas` (`idRaca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`imagensracas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`imagensracas` (
  `idImagem` INT(11) NOT NULL AUTO_INCREMENT,
  `idRaca` INT(11) NULL DEFAULT NULL,
  `srcImage` VARCHAR(2000) NULL DEFAULT NULL,
  `descricao` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`idImagem`),
  INDEX `idRaca` (`idRaca` ASC) VISIBLE,
  CONSTRAINT `imagensracas_ibfk_1`
    FOREIGN KEY (`idRaca`)
    REFERENCES `auaufollow`.`racas` (`idRaca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`login` (
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(100) NULL DEFAULT NULL,
  `fk_cliente` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`email`),
  INDEX `fk_cliente` (`fk_cliente` ASC) VISIBLE,
  CONSTRAINT `login_ibfk_1`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `auaufollow`.`clientes` (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`mensagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`mensagens` (
  `idMensagem` INT(11) NOT NULL AUTO_INCREMENT,
  `idRemetente` INT(11) NOT NULL,
  `idDestinatario` INT(11) NOT NULL,
  `conteudo` TEXT NOT NULL,
  `dataEnvio` DATETIME NOT NULL,
  PRIMARY KEY (`idMensagem`),
  INDEX `idRemetente` (`idRemetente` ASC) VISIBLE,
  INDEX `idDestinatario` (`idDestinatario` ASC) VISIBLE,
  CONSTRAINT `mensagens_ibfk_1`
    FOREIGN KEY (`idRemetente`)
    REFERENCES `auaufollow`.`clientes` (`idCliente`),
  CONSTRAINT `mensagens_ibfk_2`
    FOREIGN KEY (`idDestinatario`)
    REFERENCES `auaufollow`.`clientes` (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`misturasracas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`misturasracas` (
  `idMistura` INT(11) NOT NULL AUTO_INCREMENT,
  `idCachorro` INT(11) NULL DEFAULT NULL,
  `descricao` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`idMistura`),
  INDEX `idCachorro` (`idCachorro` ASC) VISIBLE,
  CONSTRAINT `misturasracas_ibfk_1`
    FOREIGN KEY (`idCachorro`)
    REFERENCES `auaufollow`.`cachorros` (`idCachorro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`popularidaderacas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`popularidaderacas` (
  `idPopularidade` INT(11) NOT NULL AUTO_INCREMENT,
  `idRaca` INT(11) NULL DEFAULT NULL,
  `regiao` VARCHAR(100) NULL DEFAULT NULL,
  `popularidade` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idPopularidade`),
  INDEX `idRaca` (`idRaca` ASC) VISIBLE,
  CONSTRAINT `popularidaderacas_ibfk_1`
    FOREIGN KEY (`idRaca`)
    REFERENCES `auaufollow`.`racas` (`idRaca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`produtos` (
  `idProdutos` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NULL DEFAULT NULL,
  `descricao` VARCHAR(1000) NULL DEFAULT NULL,
  `preco` DECIMAL(10,2) NULL DEFAULT NULL,
  `srcImage` VARCHAR(2000) NULL DEFAULT NULL,
  `altImage` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`idProdutos`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auaufollow`.`produtoscategorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auaufollow`.`produtoscategorias` (
  `idProduto` INT(11) NOT NULL,
  `idCategoria` INT(11) NOT NULL,
  PRIMARY KEY (`idProduto`, `idCategoria`),
  INDEX `idCategoria` (`idCategoria` ASC) VISIBLE,
  CONSTRAINT `produtoscategorias_ibfk_1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `auaufollow`.`produtos` (`idProdutos`),
  CONSTRAINT `produtoscategorias_ibfk_2`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `auaufollow`.`categoriasprodutos` (`idCategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- INSERINDO DADOS


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
