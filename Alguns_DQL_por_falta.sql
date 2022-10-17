select min(idAluno) from alunos;

select case
	when generoAluno = 'N' then nomeAluno + "Aluno N"
    when generoAluno = 'M' then nomeAluno + "Aluno M"
end from alunos;