# VIEW 1 COM DOIS INNER JOINS CONTEMPLANDO DUAS TABELAS (escolas, turmas) OBS >> USO DE COUNT, GROUP BY, ORDER BY E SUBQUERIES
create view turma_por_estado as
	select siglaEstado, count(nomeTurma) from turmas inner join escolas on escolas.idEscola = turmas.idEscola group by siglaEstado order by siglaEstado;
select * from turma_por_estado;

# VIEW 2 COM DOIS INNER JOINS CONTEMPLANDO DUAS TABELAS (materias, professores) OBS >> USO DE LIKE, WHERE E SUBQUERIES
create view cidade_turma_de_minas as
	select nomeCidade, nomeTurma from turmas inner join escolas on escolas.idEscola = turmas.idEscola where siglaEstado like "%M%";
select * from cidade_turma_de_minas;

# VIEW 3 COM DOIS INNER JOINS CONTEMPLANDO TRÊS TABELAS (alunos_responsaveis, alunos, responsaveis) OBS >> USO DE WHERE E AND E SUBQUERIES
create view seleciona_alunosHomens_responsaveisMulheres as
	select nomeAluno from alunos_responsaveis inner join alunos on alunos.idAluno = alunos_responsaveis.idAluno inner join responsaveis on responsaveis.idResponsavel = alunos_responsaveis.idResponsavel where generoAluno = 'M' and generoResponsavel = 'F';
select * from seleciona_alunosHomens_responsaveisMulheres;

# VIEW 4 COM DOIS INNER JOINS CONTEMPLANDO TRÊS TABELAS (alunos_responsaveis, alunos, responsaveis) OBS >> USO DE WHERE E AND E SUBQUERIES
create view seleciona_alunosMulheres_responsaveisHomens as
	select nomeAluno from alunos_responsaveis inner join alunos on alunos.idAluno = alunos_responsaveis.idAluno inner join responsaveis on responsaveis.idResponsavel = alunos_responsaveis.idResponsavel where generoAluno = 'F' and generoResponsavel = 'M';
select * from seleciona_alunosMulheres_responsaveisHomens;

# VIEW 5 COM UM INNER JOINS CONTEMPLANDO TRÊS TABELAS () OBS >> USO DE WHERE E AND E SUBQUERIES
create view turma_aluno_materia_cidade_geral as
	select nomeTurma, nomeAluno, nomeMateria, nomeCidade from materias inner join alunos on alunos.idAluno = materias.idAluno inner join professores on professores.idProfessor = materias.idProfessor inner join turmas on turmas.idTurma = alunos.idTurma inner join escolas on escolas.idEscola = turmas.idEscola;
select * from turma_aluno_materia_cidade_geral;

# VIEW 6 COM LEFT JOIN
create view tudo_turma_considerando_idProfessor as
	select turmas.idTurma, idProfessor, nomeTurma, idEscola from professores_turmas left join turmas on turmas.idTurma = professores_turmas.idTurma;
select * from tudo_turma_considerando_idProfessor;

# VIEW 7 COM RIGHT JOIN OBS >> USANDO DATE_FORMAT E CURDATE
create view tudo_professor_considerando_idTurma as
	select idTurma, professores.idProfessor, nomeProfessor, truncate(datediff(curdate(), nascimentoProfessor)/365.25,0) as idadeProfessor, generoProfessor from professores_turmas right join professores on professores.idProfessor = professores_turmas.idProfessor;
select * from cidade_turma_de_minas;
