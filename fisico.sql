create database Supermercadim;

show databases;

use supermercadim;

create table categoria_produto (
id_categoria_produto int primary key auto_increment,
nome_categoria varchar(50) not null
);
insert into categoria_produto (nome_categoria) 
values 
('Eletronicos'),
('Roupas'),
('Alimentos');

create table usuario_sistema (
id_usuario_sistema int primary key auto_increment,
nome_usuario varchar(200),
login varchar(100) unique not null,
senha varchar(100) unique not null,
tipo_usuario varchar(50)
);

insert into usuario_sistema (nome_usuario, login, senha, tipo_usuario) 
values
('Marcos', 'admin01', 'Madm001', 'administrador'),
('Lucas', 'caixa03', 'Lcx003', 'caixa');

insert into usuario_sistema (nome_usuario, login, senha, tipo_usuario)
values
('Carla', 'admin02', 'Cadmin002', 'administradorLid'),
('Marcelo', 'caixa01', 'Mcx001', 'caixa'),
('Rosana', 'caixa02', 'Rcx002', 'caixa');

update usuario_sistema
set tipo_usuario = 'administradorGer'
where id_usuario_sistema = 1;

create table endereco (
id_endereco int primary key auto_increment,
logradouro varchar (200),
numero varchar(20),
bairro varchar(200),
cep varchar(10),
cidade varchar(200),
estado varchar(2)
);

insert into endereco (logradouro, numero, bairro, cep, cidade, estado) 
values 
('Rua Angola', '12', 'Centro', '12345-678', 'São Paulo', 'SP'),
('Rua Benedito', '56', 'Vila Maria', '23456-789', 'Cotia', 'SP'),
('Rua Cravo', '89', 'Uniao', '34567-890', 'Taboao', 'SP'),
('Rua das Flores', '101', 'Jardim Primavera', '12345-678', 'Campinas', 'SP'),
('Avenida Paulista', '1500', 'Bela Vista', '01311-200', 'São Paulo', 'SP'),
('Rua do Comércio', '50', 'Centro', '11013-110', 'Santos', 'SP'),
('Rua Dom Pedro', '345', 'Jardim América', '13450-000', 'Piracicaba', 'SP'),
('Rua Amazonas', '678', 'Santa Luzia', '13010-456', 'Campinas', 'SP'),
('Rua 25 de Março', '250', 'Comércio', '01021-000', 'São Paulo', 'SP'),
('Avenida Brasil', '999', 'Centro', '13480-150', 'Limeira', 'SP'),
('Rua João Pessoa', '44', 'Boa Vista', '15015-110', 'São José do Rio Preto', 'SP'),
('Avenida Goiás', '567', 'Centro', '13560-120', 'Rio Claro', 'SP'),
('Rua Minas Gerais', '303', 'Industrial', '13400-400', 'Americana', 'SP');

create table promocao (
id_promocao int primary key auto_increment,
nome_promocao varchar(100),
valor_desconto varchar(100),
data_incio date,
data_termino date
);

insert into promocao (nome_promocao, valor_desconto, data_incio, data_termino) 
values 
('Dia das mães', '15%', '2024-05-10', '2024-05-11'),
('Black Friday', '30%', '2024-11-01', '2024-11-30'),
('Natal', '30%', '2024-12-15', '2024-12-25');

create table fornecedor (
id_fornecedor int primary key auto_increment,
razao_social varchar(200) not null,
cnpj varchar(20) unique not null,
telefone varchar(20), 
email varchar (300),
produto_fornecido varchar (100),
id_endereco int,
foreign key (id_endereco) references endereco(id_endereco)
);

insert into fornecedor (razao_social, cnpj, telefone, email, produto_fornecido, id_endereco) 
values 
('Jota', 'JotaAlimentos', '11987654321', 'Jotaalimentos@fornecedor.com', 'Alimentos', '13'),
('Anderson', 'AndModas', '21157054321', 'and_modas@fornecedor.com.br', 'Roupas', '10'),
('Amélia', 'HometecAm', '3349765438', 'contato.hometecAm@fornecedorb.com', 'Eletrônicos', '10');

update fornecedor
set id_endereco = '1'
where id_fornecedor= 3;


create table colaborador (
id_colaborador int primary key auto_increment,
nome varchar(100) not null,
cpf varchar(15) unique not null,
telefone varchar(20),
cargo varchar(100),
setor varchar(100),
data_admissao date,
id_endereco int,
foreign key (id_endereco) references endereco(id_endereco)
);

insert into colaborador (nome, cpf, telefone, cargo, setor, data_admissao, id_endereco) 
values
('Lucas', '2036678900', '11999900999', 'op.caixa', 'vendas', '2019-05-01', 2),
('Marcelo', '15145432100', '21988800888', 'op.caixa', 'vendas', '2019-05-15', 3),
('Rosana', '2034570080', '11989200999', 'op.caixa', 'vendas', '2021-06-01', 5),
('Carla', '2030000900', '11989908854', 'Lider', 'vendas', '2018-12-01', 9),
('Marcos', '1178678900', '119899001515', 'Gerente', 'Adiministrativo', '2018-03-01', 6); 

create table cliente (
id_cliente int primary key auto_increment,
nome varchar(100) not null,
cpf varchar(15) unique not null,
telefone varchar(20),
email varchar(300),
id_endereco int,
foreign key (id_endereco) references endereco(id_endereco)
);

insert into cliente (nome, cpf, telefone, email, id_endereco) 
values
('Carlos Souza', '12300078901', '11977777777', 'carlossp@gmail.com', 4),
('Ana Santos', '98744432101', '11966666666', 'ana00@hotmail.com', 7),
('João Almeida', '11667233344', '11988887777', 'joao.almeida@hotmail.com', 7),
('Maria Silva', '22233009455', '11977776666', 'maria.silva2023@outlook.com', 8),
('Fernanda Costa', '33377655566', '21966665555', 'fernanda.costa@outlook.com', 11),
('Rafael Oliveira', '44499866677', '11955554444', 'rafael.oliveira@outlook.com', 12);

create table produto (
id_produto int primary key auto_increment,
nome varchar(100),
codigo varchar(50),
preco_unidade decimal(10,2),
data_validade date,
id_categoria_produto int,
id_fornecedor int,
foreign key (id_categoria_produto) references categoria_produto(id_categoria_produto),
foreign key (id_fornecedor) references fornecedor(id_fornecedor)
);
insert into produto (nome, codigo, preco_unidade, data_validade, id_categoria_produto, id_fornecedor) 
values
('Notebook', 'ELE002', 2500.00, null, 1, 3),
('Televisão', 'ELE003', 2000.00, null, 1, 3),
('Tênis Esportivo', 'ROP002', 300.00, null, 2, 2),
('Calça Jeans', 'ROP003', 120.00, null, 2, 2),
('Chocolate', 'ALI001', 10.00, '2024-08-15', 3, 1),
('Leite em Pó', 'ALI002', 15.00, '2024-11-10', 3, 1),
('Fone de Ouvido', 'ELE004', 200.00, null, 1, 3),
('Camisa Social', 'ROP004', 90.00, null, 2, 2),
('Arroz Integral', 'ALI003', 20.00, '2024-07-01', 3, 1),
('Câmera Digital', 'ELE005', 3200.00, null, 1, 3),
('Leite Integral', 'ALI013', 4.50, '2024-06-01', 3, 1),
('Iogurte Natural', 'ALI014', 3.00, '2024-05-15', 3, 1),
('Queijo Mussarela', 'ALI016', 20.00, '2024-05-10', 3, 1),
('Frango Congelado', 'ALI017', 25.00, '2024-09-20', 3, 1),
('Peixe Tilápia', 'ALI018', 30.00, '2024-08-10', 3, 1),
('Arroz Branco', 'ALI019', 10.00, '2025-01-01', 3, 1),
('Achocolatado em Pó', 'ALI020', 7.50, '2025-03-15', 3, 1),
('Molho de Tomate', 'ALI021', 3.50, '2024-11-30', 3, 1),
('Vestido Longo', 'ROP006', 200.00, null, 2, 2);

create table estoque (
id_estoque int primary key auto_increment,
qnt_disponvel int,
data_ultima_reposicao date,
id_produto int,
foreign key(id_produto) references produto(id_produto)
);

insert into estoque (qnt_disponvel, data_ultima_reposicao, id_produto) 
values 
(10, '2024-05-01', 1),
(5, '2024-03-06', 2),
(15, '2024-12-01', 3),
(8, '2024-02-15', 4),
(50, '2024-11-11', 5),
(37, '2024-08-01', 6),
(2, '2024-03-08', 7),
(11, '2024-07-06', 8),
(60, '2024-12-21', 9),
(9, '2023-12-31', 10),
(80, '2024-12-11', 11),
(200, '2024-12-11', 12),
(60, '2024-12-11', 13),
(25, '2024-11-22', 14),
(20, '2024-11-05', 15),
(50, '2024-12-02', 16),
(40, '2024-09-09', 17),
(150, '2024-12-04', 18),
(3, '2024-02-15', 19);

create table produto_promocao (
id_produto_promocao int primary key auto_increment,
id_produto int,
id_promocao int,
foreign key(id_produto) references produto(id_produto),
foreign key(id_promocao) references promocao(id_promocao)
);

INSERT INTO produto_promocao (id_produto, id_promocao) 
VALUES 
(1, 3),
(2, 3),
(7, 3),
(10, 3),
(19, 3),
(3, 3),
(4, 3),
(5, 3);

create table venda (
id_venda int primary key auto_increment,
hora_venda date,
data_venda date,
valor_venda decimal,
id_cliente int,
id_colaborador int,
id_usuario_sistema int,
foreign key(id_cliente) references cliente(id_cliente),
foreign key(id_colaborador) references colaborador(id_colaborador),
foreign key(id_usuario_sistema) references usuario_sistema(id_usuario_sistema)
);

alter table venda
modify hora_venda datetime;

insert into venda (hora_venda, data_venda, valor_venda, id_cliente, id_colaborador, id_usuario_sistema) 
values
('2024-12-28 10:30:00', '2024-12-28', 2500.00, 1, 1, 2),
('2024-12-29 14:00:00', '2024-12-29', 300.00, 2, 2, 4),
('2024-12-30 09:15:00', '2024-12-30', 10.00, 2, 2, 4),
('2024-12-30 16:45:00', '2024-12-30', 90.00, 2, 2, 4),
('2024-12-31 11:00:00', '2024-12-31', 2000.00, 3, 3, 2),
('2024-12-31 18:30:00', '2024-12-31', 2000.00, 6, 1, 4);

create table item_venda (
id_item_venda int primary key auto_increment,
quantidade int,
preco_unitario decimal(10,2),
id_venda int,
id_produto int,
foreign key(id_venda) references venda(id_venda),
foreign key(id_produto) references produto(id_produto)
);

INSERT INTO item_venda (quantidade, preco_unitario, id_venda, id_produto) 
VALUES 
(1, 2500.00, 1, 1),
(1, 300.00, 2, 2),
(1, 10.00, 3, 1),
(1, 90.00, 4, 2),
(1, 2000.00, 5, 1),
(1, 2000.00, 6, 2);

create table pagamento (
id_pagamento int primary key auto_increment,
data_pagamento date,
valor_pagamento decimal (10,2),
forma_pagamento varchar(100),
id_venda int,
foreign key(id_venda) references venda(id_venda)
);

INSERT INTO pagamento (data_pagamento, valor_pagamento, forma_pagamento, id_venda) 
VALUES 
('2024-12-28', 2500.00, 'Cartão de Crédito', 1),
('2024-12-29', 300.00, 'Dinheiro', 2),
('2024-12-30', 10.00, 'Dinheiro', 3),
('2024-12-30', 90.00, 'Dinheiro', 4),
('2024-12-31', 2000.00, 'Cartão de Crédito', 5),
('2024-12-31', 2000.00, 'Cartão de Crédito', 6);







