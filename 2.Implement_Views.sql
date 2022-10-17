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

