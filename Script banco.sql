CREATE TABLE produto (
  idproduto SERIAL PRIMARY KEY,
  flaginativo CHAR(1) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT,
  preco NUMERIC(10, 2) NOT NULL
);

CREATE TABLE empresa (
  idempresa SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cnpj VARCHAR(14) NOT NULL,
  endereco VARCHAR(100),
  telefone VARCHAR(20)
);

-- Tabela de usuários
CREATE TABLE usuario (
  idusuario SERIAL PRIMARY KEY,
  idempresa INTEGER REFERENCES empresa(idempresa),
  flaginativo CHAR(1) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(100) NOT NULL
);

-- Tabela de controle de estoque
CREATE TABLE controle_estoque (
  idcontrole SERIAL PRIMARY KEY,
  idproduto INTEGER REFERENCES produto(idproduto),
  idempresa INTEGER REFERENCES empresa(idempresa),
  data_movimento DATE NOT NULL,
  tipo_movimento VARCHAR(10) NOT NULL,
  quantidade INTEGER NOT NULL
);

-- Tabela de cliente_fornecedor
CREATE TABLE cliente_fornecedor (
  idclifor SERIAL PRIMARY KEY,
  tipoclifor CHAR(1) NOT NULL,
  flaginativo CHAR(1) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  cnpjcpf VARCHAR(14) NOT NULL,
  endereco VARCHAR(100),
  telefone VARCHAR(20)
);

-- Tabela de compras e vendas
CREATE TABLE compra_venda (
  idmovimento SERIAL PRIMARY KEY,
  idusuario INTEGER REFERENCES usuario(idusuario),
  idproduto INTEGER REFERENCES produto(idproduto),
  idclifor INTEGER REFERENCES cliente_fornecedor(idclifor),
  data_movimento DATE NOT NULL,
  quantidade INTEGER NOT NULL,
  tipomovimento VARCHAR(2) NOT NULL --C = COMPRA | V = VENDA | DC = DEV. COMPRA | DV = DEV. VENDA
);

-- Inserção de produto de supermercado
INSERT INTO produto (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Arroz', 'F', 'Arroz branco', 10.99, 50);

INSERT INTO produto (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Feijão', 'F', 'Feijão carioca', 6.99, 30);

INSERT INTO produto (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Macarrão', 'F', 'Macarrão espaguete', 4.99, 20);

INSERT INTO produto (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Leite', 'F', 'Leite integral', 3.49, 40);

INSERT INTO produto (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Pão de Forma', 'F', 'Pão de forma integral', 5.99, 25);

INSERT INTO produto (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Óleo de Soja', 'F', 'Óleo de soja refinado', 7.99, 15);

INSERT INTO produto (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Café', 'F', 'Café em pó', 8.99, 10);

INSERT INTO produto (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Açúcar', 'F', 'Açúcar refinado', 3.99, 20);

INSERT INTO produto (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Sal', 'F', 'Sal refinado', 2.49, 30);

INSERT INTO produto (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Farinha de Trigo', 'F', 'Farinha de trigo comum', 4.49, 15);

-- Inserção de empresas
INSERT INTO empresa (nome, cnpj, endereco, telefone)
VALUES ('Empresa A', '12345678901234', 'Endereço da Empresa A', '1234567890');

INSERT INTO empresa (nome, cnpj, endereco, telefone)
VALUES ('Empresa B', '98765432109876', 'Endereço da Empresa B', '9876543210');

INSERT INTO empresa (nome, cnpj, endereco, telefone)
VALUES ('Empresa C', '56789012345678', 'Endereço da Empresa C', '5678901234');


-- Inserção de usuários
INSERT INTO usuario (nome, flaginativo, idempresa, email, senha)
VALUES('Alberto', 'F', 1, 'a@a', '1');

INSERT INTO usuario (nome, flaginativo, idempresa, email, senha)
VALUES ('Maria Santos', 'F', 1, 'maria.santos@example.com', 'senha456');

INSERT INTO usuario (nome, flaginativo, idempresa, email, senha)
VALUES ('Pedro Almeida', 'F', 1, 'pedro.almeida@example.com', 'senha789');


-- Inserção de clientes_fornecedores
INSERT INTO cliente_fornecedor (nome, flaginativo, tipoclifor, cnpjcpf, endereco, telefone)
VALUES ('Renan Pinheiro', 'F', 'C', '12345677884', 'Rua A, 123', '551112345678');

INSERT INTO cliente_fornecedor (nome, flaginativo, tipoclifor, cnpjcpf, endereco, telefone)
VALUES ('Gabriel Mendes', 'F', 'C', '49512357881', 'Rua B, 456', '551198765432');

INSERT INTO cliente_fornecedor (nome, flaginativo, tipoclifor, cnpjcpf, endereco, telefone)
VALUES ('Elisa Celine', 'F', 'C', '02297843362', 'Rua C, 789', '551145678912');

INSERT INTO cliente_fornecedor (nome, flaginativo, tipoclifor, cnpjcpf, endereco, telefone)
VALUES ('Supermercado A', 'F', 'F', '32198765400001', 'Rua D, 012', '551132109876');

INSERT INTO cliente_fornecedor (nome, flaginativo, tipoclifor, cnpjcpf, endereco, telefone)
VALUES ('Supermercado B', 'F', 'F', '78945612300001', 'Rua E, 345', '551178945612');

INSERT INTO cliente_fornecedor (nome, flaginativo, tipoclifor, cnpjcpf, endereco, telefone)
VALUES ('Supermercado C', 'F', 'F', '65432198700001', 'Rua F, 678', '551165432198');
