-- PessoaJuridica_Fornecedor [rel4]
alter table `fornecedor`  drop column  `pessoajuridica_nome`;
-- PessoaJuridica_Cliente [rel22]
alter table `cliente`   drop foreign key `fk_cliente_pessoajuridica`;
alter table `cliente`  drop column  `pessoajuridica_codpessoa`;
-- PessoaFisica_Cliente [rel21]
alter table `cliente`   drop foreign key `fk_cliente_pessoafisica`;
alter table `cliente`  drop column  `pessoafisica_codpessoa`;
-- NotaFiscal_Venda [rel20]
alter table `notafiscal`   drop foreign key `fk_notafiscal_venda`;
alter table `notafiscal`  drop column  `venda_oid`;
-- ContasAReceber_Boleto [rel19]
alter table `boleto`   drop foreign key `fk_boleto_contasareceber`;
alter table `boleto`  drop column  `contasareceber_oid`;
-- Venda_ContasAReceber [rel18]
alter table `contasareceber`   drop foreign key `fk_contasareceber_venda`;
alter table `contasareceber`  drop column  `venda_oid`;
-- ContasAPagar_compra [rel17]
alter table `contasapagar`   drop foreign key `fk_contasapagar_compra`;
alter table `contasapagar`  drop column  `compra_oid`;
-- compra_itensCompra [rel16]
alter table `itenscompra`   drop foreign key `fk_itenscompra_compra`;
alter table `itenscompra`  drop column  `compra_oid`;
-- Combustivel_itensCompra [rel14]
alter table `itenscompra`   drop foreign key `fk_itenscompra_combustivel`;
alter table `itenscompra`  drop column  `combustivel_oid`;
-- Fornecedor_compra [rel13]
alter table `compra`   drop foreign key `fk_compra_fornecedor`;
alter table `compra`  drop column  `fornecedor_oid`;
-- Combustivel_Tanque [rel12]
alter table `tanque`   drop foreign key `fk_tanque_combustivel`;
alter table `tanque`  drop column  `combustivel_oid`;
-- itensVenda_Combustivel [rel11]
alter table `itensvenda`   drop foreign key `fk_itensvenda_combustivel`;
alter table `itensvenda`  drop column  `combustivel_oid`;
-- Venda_itensVenda [rel10]
alter table `itensvenda`   drop foreign key `fk_itensvenda_venda`;
alter table `itensvenda`  drop column  `venda_oid`;
-- User_Funcionario [rel1]
alter table `funcionario`   drop foreign key `fk_funcionario_user`;
alter table `funcionario`  drop column  `user_oid`;
-- User_Group [User2Group_Group2User]
alter table `user_group`   drop foreign key `fk_user_group_group`;
alter table `user_group`   drop foreign key `fk_user_group_user`;
drop table `user_group`;
-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`   drop foreign key `fk_user_group`;
alter table `user`  drop column  `group_oid`;
-- Group_Module [Group2Module_Module2Group]
alter table `group_module`   drop foreign key `fk_group_module_module`;
alter table `group_module`   drop foreign key `fk_group_module_group`;
drop table `group_module`;
-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`   drop foreign key `fk_group_module`;
alter table `group`  drop column  `module_oid`;
-- itensVenda [ent9]
drop table `itensvenda`;
-- Venda [ent8]
drop table `venda`;
-- Tanque [ent7]
drop table `tanque`;
-- Fornecedor [ent6]
drop table `fornecedor`;
-- Cliente [ent5]
drop table `cliente`;
-- PessoaJuridica [ent4]
drop table `pessoajuridica`;
-- PessoaFisica [ent3]
drop table `pessoafisica`;
-- Pessoa [ent2]
drop table `pessoa`;
-- NotaFiscal [ent16]
drop table `notafiscal`;
-- Boleto [ent15]
drop table `boleto`;
-- ContasAReceber [ent14]
drop table `contasareceber`;
-- ContasAPagar [ent13]
drop table `contasapagar`;
-- itensCompra [ent12]
drop table `itenscompra`;
-- compra [ent11]
drop table `compra`;
-- Combustivel [ent10]
drop table `combustivel`;
-- Funcionario [ent1]
drop table `funcionario`;
-- User [User]
drop table `user`;
-- Module [Module]
drop table `module`;
-- Group [Group]
drop table `group`;
