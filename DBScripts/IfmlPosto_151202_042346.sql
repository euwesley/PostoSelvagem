-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Funcionario [ent1]
create table `funcionario` (
   `pessoafisica_codpessoa`  integer  not null,
   `cargo`  varchar(255),
   `salario`  double precision,
   `dataadmi`  date,
   `adicional`  bit,
  primary key (`pessoafisica_codpessoa`)
);


-- Combustivel [ent10]
create table `combustivel` (
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- compra [ent11]
create table `compra` (
   `oid`  integer  not null,
   `valortotal`  double precision,
   `data`  date,
  primary key (`oid`)
);


-- itensCompra [ent12]
create table `itenscompra` (
   `oid`  integer  not null,
   `quantidade`  double precision,
  primary key (`oid`)
);


-- ContasAPagar [ent13]
create table `contasapagar` (
   `oid`  integer  not null,
   `desconto`  double precision,
   `juros`  double precision,
   `datavencimento`  date,
  primary key (`oid`)
);


-- ContasAReceber [ent14]
create table `contasareceber` (
   `oid`  integer  not null,
   `datapagamento`  date,
   `desconto`  double precision,
   `juros`  double precision,
   `datavencimento`  date,
  primary key (`oid`)
);


-- Boleto [ent15]
create table `boleto` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- NotaFiscal [ent16]
create table `notafiscal` (
   `oid`  integer  not null,
   `impostos`  double precision,
  primary key (`oid`)
);


-- Pessoa [ent2]
create table `pessoa` (
   `nome`  varchar(255),
   `telefone`  varchar(255),
   `endereco`  varchar(255),
   `codpessoa`  integer  not null,
  primary key (`codpessoa`)
);


-- PessoaFisica [ent3]
create table `pessoafisica` (
   `pessoa_codpessoa`  integer  not null,
   `rg`  integer,
   `datanasc`  date,
   `cpf`  integer,
  primary key (`pessoa_codpessoa`)
);


-- PessoaJuridica [ent4]
create table `pessoajuridica` (
   `pessoa_codpessoa`  integer  not null,
   `cnpj`  integer,
   `razaosocial`  varchar(255),
   `inscriest`  integer,
  primary key (`pessoa_codpessoa`)
);


-- Cliente [ent5]
create table `cliente` (
   `oid`  integer  not null,
   `dataultimovalelavag`  date,
  primary key (`oid`)
);


-- Fornecedor [ent6]
create table `fornecedor` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Tanque [ent7]
create table `tanque` (
   `oid`  integer  not null,
   `qtdnivel`  double precision,
   `qtdmaximo`  double precision,
  primary key (`oid`)
);


-- Venda [ent8]
create table `venda` (
   `oid`  integer  not null,
   `data`  date,
   `valortotal`  double precision,
   `placaveiculo`  varchar(255),
  primary key (`oid`)
);


-- itensVenda [ent9]
create table `itensvenda` (
   `oid`  integer  not null,
   `quantidade`  double precision,
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Funcionario [rel1]
alter table `funcionario`  add column  `user_oid`  integer;
alter table `funcionario`   add index fk_funcionario_user (`user_oid`), add constraint fk_funcionario_user foreign key (`user_oid`) references `user` (`oid`);


-- Venda_itensVenda [rel10]
alter table `itensvenda`  add column  `venda_oid`  integer;
alter table `itensvenda`   add index fk_itensvenda_venda (`venda_oid`), add constraint fk_itensvenda_venda foreign key (`venda_oid`) references `venda` (`oid`);


-- itensVenda_Combustivel [rel11]
alter table `itensvenda`  add column  `combustivel_oid`  integer;
alter table `itensvenda`   add index fk_itensvenda_combustivel (`combustivel_oid`), add constraint fk_itensvenda_combustivel foreign key (`combustivel_oid`) references `combustivel` (`oid`);


-- Combustivel_Tanque [rel12]
alter table `tanque`  add column  `combustivel_oid`  integer;
alter table `tanque`   add index fk_tanque_combustivel (`combustivel_oid`), add constraint fk_tanque_combustivel foreign key (`combustivel_oid`) references `combustivel` (`oid`);


-- Fornecedor_compra [rel13]
alter table `compra`  add column  `fornecedor_oid`  integer;
alter table `compra`   add index fk_compra_fornecedor (`fornecedor_oid`), add constraint fk_compra_fornecedor foreign key (`fornecedor_oid`) references `fornecedor` (`oid`);


-- Combustivel_itensCompra [rel14]
alter table `itenscompra`  add column  `combustivel_oid`  integer;
alter table `itenscompra`   add index fk_itenscompra_combustivel (`combustivel_oid`), add constraint fk_itenscompra_combustivel foreign key (`combustivel_oid`) references `combustivel` (`oid`);


-- compra_itensCompra [rel16]
alter table `itenscompra`  add column  `compra_oid`  integer;
alter table `itenscompra`   add index fk_itenscompra_compra (`compra_oid`), add constraint fk_itenscompra_compra foreign key (`compra_oid`) references `compra` (`oid`);


-- ContasAPagar_compra [rel17]
alter table `contasapagar`  add column  `compra_oid`  integer;
alter table `contasapagar`   add index fk_contasapagar_compra (`compra_oid`), add constraint fk_contasapagar_compra foreign key (`compra_oid`) references `compra` (`oid`);


-- Venda_ContasAReceber [rel18]
alter table `contasareceber`  add column  `venda_oid`  integer;
alter table `contasareceber`   add index fk_contasareceber_venda (`venda_oid`), add constraint fk_contasareceber_venda foreign key (`venda_oid`) references `venda` (`oid`);


-- ContasAReceber_Boleto [rel19]
alter table `boleto`  add column  `contasareceber_oid`  integer;
alter table `boleto`   add index fk_boleto_contasareceber (`contasareceber_oid`), add constraint fk_boleto_contasareceber foreign key (`contasareceber_oid`) references `contasareceber` (`oid`);


-- NotaFiscal_Venda [rel20]
alter table `notafiscal`  add column  `venda_oid`  integer;
alter table `notafiscal`   add index fk_notafiscal_venda (`venda_oid`), add constraint fk_notafiscal_venda foreign key (`venda_oid`) references `venda` (`oid`);


-- PessoaFisica_Cliente [rel21]
alter table `cliente`  add column  `pessoafisica_codpessoa`  integer;
alter table `cliente`   add index fk_cliente_pessoafisica (`pessoafisica_codpessoa`), add constraint fk_cliente_pessoafisica foreign key (`pessoafisica_codpessoa`) references `pessoafisica` (`pessoa_codpessoa`);


-- PessoaJuridica_Cliente [rel22]
alter table `cliente`  add column  `pessoajuridica_codpessoa`  integer;
alter table `cliente`   add index fk_cliente_pessoajuridica (`pessoajuridica_codpessoa`), add constraint fk_cliente_pessoajuridica foreign key (`pessoajuridica_codpessoa`) references `pessoajuridica` (`pessoa_codpessoa`);


-- PessoaJuridica_Fornecedor [rel4]
alter table `fornecedor`  add column  `pessoajuridica_codpessoa`  integer;
alter table `fornecedor`   add index fk_fornecedor_pessoajuridica (`pessoajuridica_codpessoa`), add constraint fk_fornecedor_pessoajuridica foreign key (`pessoajuridica_codpessoa`) references `pessoajuridica` (`pessoa_codpessoa`);


-- Funcionario_Venda [rel8]
alter table `venda`  add column  `funcionario_codpessoa`  integer;
alter table `venda`   add index fk_venda_funcionario (`funcionario_codpessoa`), add constraint fk_venda_funcionario foreign key (`funcionario_codpessoa`) references `funcionario` (`pessoafisica_codpessoa`);


-- Cliente_Venda [rel9]
alter table `venda`  add column  `cliente_oid`  integer;
alter table `venda`   add index fk_venda_cliente (`cliente_oid`), add constraint fk_venda_cliente foreign key (`cliente_oid`) references `cliente` (`oid`);


-- GEN FK: Funcionario --> PessoaFisica
alter table `funcionario`   add index fk_funcionario_pessoafisica (`pessoafisica_codpessoa`), add constraint fk_funcionario_pessoafisica foreign key (`pessoafisica_codpessoa`) references `pessoafisica` (`pessoa_codpessoa`);


-- GEN FK: PessoaFisica --> Pessoa
alter table `pessoafisica`   add index fk_pessoafisica_pessoa (`pessoa_codpessoa`), add constraint fk_pessoafisica_pessoa foreign key (`pessoa_codpessoa`) references `pessoa` (`codpessoa`);


-- GEN FK: PessoaJuridica --> Pessoa
alter table `pessoajuridica`   add index fk_pessoajuridica_pessoa (`pessoa_codpessoa`), add constraint fk_pessoajuridica_pessoa foreign key (`pessoa_codpessoa`) references `pessoa` (`codpessoa`);


