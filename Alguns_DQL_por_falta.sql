select min(idAluno) from alunos;

select case
	when generoAluno = 'N' then nomeAluno
    when generoAluno = 'M' then idAluno
end from alunos;