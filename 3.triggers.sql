#TRIGGER PARA ATUALIZAR  professores_turmas
DELIMITER $$
create trigger tr_cria_escolas before INSERT On escolas
for each row
begin
  declare msg varchar(500);
  set msg = concat('Foi adicionada(o) ', new.nomeEscola,' no estado de sigla ', new.siglaEstado, ' na cidade de ', new.nomeCidade, 'com sucesso no banco de dados de escolas!');
  select msg;
end$$
DELIMITER ;
insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Bernoulli', 'MG', 'Belo Horizonte');

select * from escolas;
