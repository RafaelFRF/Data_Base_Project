#CADASTRAR
#PROCEDURE 1 ADICIONAR CIDADE USANDO IF
Delimiter $$
create procedure procedure_adicionaEscola(in escola varchar(25), estado char(2), cidade varchar(25))
begin
	declare msg varchar(500);
    if length(escola) < 5 then
		set msg = 'Nome de escola muito curto';
    elseif length(escola) > 25 then
		set msg = 'Nome de escola muito Longo';
	elseif length(estado) <> 2 then
		set msg = 'Nome de estado deve ter 2 letras';
	elseif length(cidade) < 5 then
		set msg = 'Nome de cidade muito curto';
	elseif length(cidade) > 25 then
		set msg = 'Nome de cidade muito longo';
	else
		set msg = 'Escola adicionada com sucesso';
        insert into escolas(nomeEscola, siglaEstado, nomeCidade) values (escola, estado, cidade);
	end if;
    select msg;
end $$
Delimiter ;
drop procedure procedure_adicionaEscola;

call procedure_adicionaEscola('Bernoulli', 'MG', 'Belo Horizonte');

#PROCEDURE 2 ADICIONAR TURMA USANDO IF
Delimiter $$
create procedure procedure_adicionaTurma(in nome char(2), id int)
begin
	declare msg varchar(500);
    if length(nome) <> 2 then
		set msg = 'Nome da turma deve ter 2 letras';
	elseif id <= 0 then
		set msg = 'O idCidade deve ser um número maior que zero';
	else
		set msg = 'Turma adicionada com sucesso';
        insert into turmas(nomeTurma, idEscola) values (nome, id);
	end if;
    select msg;
end $$
Delimiter ;
drop procedure procedure_adicionaTurma;

call procedure_adicionaTurma('3A', 1);

#PROCEDURE 3 ADICIONAR ALUNO USANDO IF, NOT E OR
Delimiter $$
create procedure procedure_adicionaAluno(in id int, nome varchar(25), nascimento date, genero char(1))
begin
	declare msg varchar(500);
    if id <= 0 then
		set msg = 'O idTurma deve ser um número maior que zero';    
    elseif length(nome) < 5 then
		set msg = 'Nome de Aluna(o) muito curto';
    elseif length(nome) > 25 then
		set msg = 'Nome de Aluna(o) muito Longo';
	elseif length(nascimento) <> 10 then
		set msg = 'Use como o modelo "aaaa-mm-dd"';
	elseif length(genero) <> 1 then
		set msg = 'Use as letras M para masculino, F para feminino e N para não desejo declarar';
	elseif not(genero = 'M' or genero = 'F' or genero = 'N') then
		set msg = 'Use as letras M para masculino, F para feminino e N para não desejo declarar';
	else
		set msg = 'Aluna(o) adicionada(o) com sucesso';
        insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values (id, nome, nascimento, genero);
	end if;
    select msg;
end $$
Delimiter ;
drop procedure procedure_adicionaAluno;

call procedure_adicionaAluno(1, 'Felipe Fernandes', '2006-09-09', 'M');

#ALTERAR
#PROCEDURE 4 ALTERAR ALUNO USANDO 
Delimiter $$
create procedure procedure_alteraAluno(in id int, idT int, nome varchar(25), nascimento date, genero char(1))
begin
    declare cont int default 0;
	declare msg varchar(500);
            repita: loop
				set cont = cont + 1;
				if cont > (select max(idAluno) from alunos) then
					leave repita;
				end if;
                if cont = id then
					update alunos set alunos.idTurma = idT where alunos.idAluno = cont;
					update alunos set alunos.nomeAluno = nome where alunos.idAluno = cont;
					update alunos set alunos.nascimentoAluno = nascimento where alunos.idAluno = cont;
					update alunos set alunos.generoAluno = genero where alunos.idAluno = cont;
                    set msg = 'Aluno atualizado com sucesso!';
				end if;
			end loop;
SELECT msg;
end $$
Delimiter ;
drop procedure procedure_alteraAluno;

call procedure_alteraAluno(4, 1, 'Felipe Fernandes', '2006-09-09', 'M');

#PROCEDURE 5 ALTERAR TURMA USANDO 
Delimiter $$
create procedure procedure_alteraTurma(in id int, nome char(2), idE int)
begin
    declare cont int default 0;
	declare msg varchar(500);
            repita: loop
				set cont = cont + 1;
				if cont > (select max(idTurma) from turmas) then
					leave repita;
				end if;
                if cont = id then
					update turmas set turmas.nomeTurma = nome where turmas.idTurma = cont;
					update turmas set turmas.idEscola = idE where turmas.idTurma = cont;
					set msg = 'Turma atualizada com sucesso!';
				end if;
			end loop;
SELECT msg;
end $$
Delimiter ;
drop procedure procedure_alteraTurma;

call procedure_alteraTurma(4, '3C', 1);
select * from turmas;

#PROCEDURE 6 ALTERAR ESCOLA 
Delimiter $$
create procedure procedure_alteraEscola(in id int, escola varchar(25), estado char(2), cidade varchar(25))
begin
    declare cont int default 0;
	declare msg varchar(500);
            repita: loop
				set cont = cont + 1;
				if cont > (select max(idEscola) from escolas) then
					leave repita;
				end if;
                if cont = id then
					update escolas set escolas.nomeEscola = escola where escolas.idEscola = cont;
					update escolas set escolas.siglaEstado = estado where escolas.idEscola = cont;
					update escolas set escolas.nomeCidade = cidade where escolas.idEscola = cont;
					set msg = 'Escola atualizada com sucesso!';
				end if;
			end loop;
SELECT msg;
end $$
Delimiter ;
drop procedure procedure_alteraEscola;

call procedure_alteraEscola(1, 'Santo Antonio', 'MG', 'Belo Horizonte');
select * from escolas;