# VIEW 1 COM DOIS INNER JOINS CONTEMPLANDO DUAS TABELAS (escolas, turmas) OBS >> USO DE COUNT, GROUP BY E ORDER BY
create view escolas_por_estado as
	select siglaEstado, count(*) from turmas inner join escolas on escolas.idEscola = turmas.idEscola group by siglaEstado order by siglaEstado;
select * from escolas_por_estado;

# VIEW 2 COM DOIS INNER JOINS CONTEMPLANDO DUAS TABELAS (materias, professores) OBS >> USO DE COUNT E GROUP BY
create view escolas_por_estado as
	select siglaEstado, count(*) from turmas inner join escolas on escolas.idEscola = turmas.idEscola group by siglaEstado;
select * from escolas_por_estado;

select siglaEstado, count(*) from turmas inner join escolas on escolas.idEscola = turmas.idEscola group by siglaEstado;

# VIEW 3 COM DOIS INNER JOINS CONTEMPLANDO TRÊS TABELAS (alunos_responsaveis, alunos, responsaveis) OBS >> USO DE WHERE E AND
create view seleciona_alunosHomens_responsaveisMulheres as
	select nomeAluno from alunos_responsaveis inner join alunos on alunos.idAluno = alunos_responsaveis.idAluno inner join responsaveis on responsaveis.idResponsavel = alunos_responsaveis.idResponsavel where generoAluno = 'M' and generoResponsavel = 'F';
    
select * from seleciona_alunosHomens_responsaveisMulheres;

# VIEW 4 COM DOIS INNER JOINS CONTEMPLANDO TRÊS TABELAS (alunos_responsaveis, alunos, responsaveis) OBS >> USO DE WHERE E AND
create view seleciona_alunosMulheres_responsaveisHomens as
	select nomeAluno from alunos_responsaveis inner join alunos on alunos.idAluno = alunos_responsaveis.idAluno inner join responsaveis on responsaveis.idResponsavel = alunos_responsaveis.idResponsavel where generoAluno = 'F' and generoResponsavel = 'M';
    
select * from seleciona_alunosMulheres_responsaveisHomens;