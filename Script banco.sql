CREATE TABLE produtos (
  idproduto SERIAL PRIMARY KEY,
  flaginativo CHAR(1) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT,
  preco NUMERIC(10, 2) NOT NULL,
  quantidade INTEGER DEFAULT 0
);

-- Tabela de usuários
CREATE TABLE usuarios (
  idusuario SERIAL PRIMARY KEY,
  flaginativo CHAR(1) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(100) NOT NULL
);

-- Tabela de controle de estoque
CREATE TABLE controle_estoque (
  idcontrole SERIAL PRIMARY KEY,
  idproduto INTEGER REFERENCES produtos(idproduto),
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

-- Tabela de compras
CREATE TABLE compras (
  idcompra SERIAL PRIMARY KEY,
  idusuario INTEGER REFERENCES usuarios(idusuario),
  idproduto INTEGER REFERENCES produtos(idproduto),
  idclifor INTEGER REFERENCES cliente_fornecedor(idclifor),
  data_compra DATE NOT NULL,
  quantidade INTEGER NOT NULL
);

-- Tabela de vendas
CREATE TABLE vendas (
  idvenda SERIAL PRIMARY KEY,
  idusuario INTEGER REFERENCES usuarios(idusuario),
  idproduto INTEGER REFERENCES produtos(idproduto),
  idclifor INTEGER REFERENCES cliente_fornecedor(idclifor),
  data_venda DATE NOT NULL,
  quantidade INTEGER NOT NULL
);

-- Inserção de produtos de supermercado
INSERT INTO produtos (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Arroz', 'F', 'Arroz branco', 10.99, 50);

INSERT INTO produtos (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Feijão', 'F', 'Feijão carioca', 6.99, 30);

INSERT INTO produtos (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Macarrão', 'F', 'Macarrão espaguete', 4.99, 20);

INSERT INTO produtos (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Leite', 'F', 'Leite integral', 3.49, 40);

INSERT INTO produtos (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Pão de Forma', 'F', 'Pão de forma integral', 5.99, 25);

INSERT INTO produtos (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Óleo de Soja', 'F', 'Óleo de soja refinado', 7.99, 15);

INSERT INTO produtos (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Café', 'F', 'Café em pó', 8.99, 10);

INSERT INTO produtos (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Açúcar', 'F', 'Açúcar refinado', 3.99, 20);

INSERT INTO produtos (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Sal', 'F', 'Sal refinado', 2.49, 30);

INSERT INTO produtos (nome, flaginativo, descricao, preco, quantidade)
VALUES ('Farinha de Trigo', 'F', 'Farinha de trigo comum', 4.49, 15);


-- Inserção de usuários
INSERT INTO usuarios (nome, flaginativo, email, senha)
VALUES('Alberto', 'F', 'a@a', '1');

INSERT INTO usuarios (nome, flaginativo, email, senha)
VALUES ('Maria Santos', 'F', 'maria.santos@example.com', 'senha456');

INSERT INTO usuarios (nome, flaginativo, email, senha)
VALUES ('Pedro Almeida', 'F', 'pedro.almeida@example.com', 'senha789');


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
