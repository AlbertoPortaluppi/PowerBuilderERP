CREATE TABLE produtos (
  idproduto SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT,
  preco NUMERIC(10, 2) NOT NULL,
  quantidade INTEGER DEFAULT 0
);

-- Tabela de usuários
CREATE TABLE usuarios (
  idusuario SERIAL PRIMARY KEY,
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

INSERT INTO usuarios VALUES(1, 'Alberto', 'a@a', '1')