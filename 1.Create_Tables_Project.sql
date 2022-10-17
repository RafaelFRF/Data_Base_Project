#CRIANDO TABELAS

create table escolas(
	idEscola int primary key auto_increment,
    nomeEscola varchar(25) not null,
    siglaEstado char (2) not null,
    nomeCidade varchar(25) not null
);

create table turmas(
	idTurma int primary key auto_increment,
    nomeTurma char(2) not null,
    idEscola int not null,
    constraint fk_t_escolas foreign key(idEscola) references escolas(idEscola)
);

create table professores(
	idProfessor int primary key auto_increment,
    nomeProfessor varchar(25) not null,
    nascimentoProfessor date not null,
    generoProfessor char(1)
);

create table professores_turmas(
    idTurma int not null,
    constraint fk_pt_turmas foreign key(idTurma) references turmas(idTurma),
    idProfessor int not null,
    constraint fk_pt_professores foreign key(idProfessor) references professores(idProfessor)
    );
    
create table alunos(
	idAluno int primary key auto_increment, 
    idTurma int not null,
    constraint fk_a_turmas foreign key(idTurma) references turmas(idTurma),
    nomeAluno varchar(25) not null,
    nascimentoAluno date not null,
    generoAluno char(1)
);

create table materias(
	idMateria int primary key auto_increment, 
    idAluno int not null,
    constraint fk_m_alunos foreign key(idAluno) references alunos(idAluno),
    idProfessor int not null,
    constraint fk_m_professores foreign key(idProfessor) references professores(idProfessor),
    nomeMateria varchar (25) not null
);

create table responsaveis(
	idResponsavel int primary key auto_increment, 
    nomeResponsavel varchar(25) not null,
    nascimentoResponsavel date not null,
    generoResponsavel char(1)
);

create table alunos_responsaveis(
    idAluno int not null,
    constraint fk_ar_alunos foreign key(idAluno) references alunos(idAluno),
    idResponsavel int not null,
    constraint fk_ar_responsaveis foreign key(idResponsavel) references responsaveis(idResponsavel)
    );
    
drop table alunos_responsaveis, responsaveis, materias, alunos, professores_turmas, professores, turmas, escolas;
    
#INSERINDO DADOS

insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Colégio Batista Mineiro', 'MG', 'Belo Horizonte');
insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Colégio Santa Maria', 'MG', 'Belo Horizonte');
insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Chromos', 'MG', 'Contagem');
insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Escola Salesiano', 'RS', 'Novo Hamburgo');
insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Escola Barão', 'SC', 'Blumenau');
insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Colégio Sagrada Família', 'SC', 'Blumenau');
insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Colégio Positivo', 'SC', 'Joinville');
insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Pio XII', 'RS', 'Novo Hamburgo');
insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Magister', 'SP', 'São Paulo');
insert into escolas(nomeEscola, siglaEstado, nomeCidade) values('Escola São Paulo', 'SP', 'Holambra');

insert into turmas(nomeTurma, idEscola) values('1A', 1);
insert into turmas(nomeTurma, idEscola) values('2A', 2);
insert into turmas(nomeTurma, idEscola) values('3A', 3);
insert into turmas(nomeTurma, idEscola) values('1A', 4);
insert into turmas(nomeTurma, idEscola) values('2A', 5);
insert into turmas(nomeTurma, idEscola) values('3A', 6);
insert into turmas(nomeTurma, idEscola) values('1A', 7);
insert into turmas(nomeTurma, idEscola) values('2A', 8);
insert into turmas(nomeTurma, idEscola) values('3A', 9);
insert into turmas(nomeTurma, idEscola) values('1A', 10);

insert into professores(nomeProfessor, nascimentoProfessor, generoProfessor) values('Renato Rodrigues', '1992-02-02', 'M');
insert into professores(nomeProfessor, nascimentoProfessor, generoProfessor) values('Augusto Limas', '1988-04-02', 'M');
insert into professores(nomeProfessor, nascimentoProfessor, generoProfessor) values('Xirley Xumaquer', '1958-04-11', 'F');
insert into professores(nomeProfessor, nascimentoProfessor, generoProfessor) values('Jaqueline Pinto', '2000-01-01', 'F');
insert into professores(nomeProfessor, nascimentoProfessor, generoProfessor) values('Giuseppe Cardoso', '1969-04-20', 'M');
insert into professores(nomeProfessor, nascimentoProfessor, generoProfessor) values('Daniela Rabelo', '1978-06-20', 'F');
insert into professores(nomeProfessor, nascimentoProfessor, generoProfessor) values('Ullices Trovão', '1987-07-20', 'M');
insert into professores(nomeProfessor, nascimentoProfessor, generoProfessor) values('Jesus Davilla', '1993-12-14', 'M');
insert into professores(nomeProfessor, nascimentoProfessor, generoProfessor) values('Aline Trentini', '1990-12-11', 'F');
insert into professores(nomeProfessor, nascimentoProfessor, generoProfessor) values('Camila Cadura', '1999-07-18', 'F');

insert into professores_turmas(idTurma, idProfessor) values(1,1);
insert into professores_turmas(idTurma, idProfessor) values(2,1);
insert into professores_turmas(idTurma, idProfessor) values(3,1);
insert into professores_turmas(idTurma, idProfessor) values(4,4);
insert into professores_turmas(idTurma, idProfessor) values(5,5);
insert into professores_turmas(idTurma, idProfessor) values(6,5);
insert into professores_turmas(idTurma, idProfessor) values(7,5);
insert into professores_turmas(idTurma, idProfessor) values(8,4);
insert into professores_turmas(idTurma, idProfessor) values(9,9);
insert into professores_turmas(idTurma, idProfessor) values(10,10);/*
insert into professores_turmas(idTurma, idProfessor) values(8,5);
insert into professores_turmas(idTurma, idProfessor) values(16,5);
insert into professores_turmas(idTurma, idProfessor) values(13,6);
insert into professores_turmas(idTurma, idProfessor) values(14,6);
insert into professores_turmas(idTurma, idProfessor) values(20,7);
insert into professores_turmas(idTurma, idProfessor) values(19,7);
insert into professores_turmas(idTurma, idProfessor) values(20,8);
insert into professores_turmas(idTurma, idProfessor) values(19,8);
insert into professores_turmas(idTurma, idProfessor) values(11,9);
insert into professores_turmas(idTurma, idProfessor) values(17,10);*/

insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values(1, 'João Pedro', '2004-07-18', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values(2, 'Pedro Lamenha', '2005-08-18', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values(3, 'Elsa Lamenha', '2006-08-18', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values(4, 'Otávio Neto', '2004-08-18', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values(5, 'Otávio Junior', '2005-08-18', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values(6, 'Iago Silva', '2006-08-20', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values(7, 'Paula Amarga', '2004-12-18', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values(8, 'Diega Diego', '2005-10-19', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values(9, 'Izadora Yhlluf', '2006-01-19', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno, generoAluno) values(10, 'Janaina Yhlluf', '2004-05-01', 'F');/*
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(6, 'Antonio Hent', '2004-06-01', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(6, 'Augusta Lamella', '2004-01-01', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(7, 'Paula Rodrigues', '2005-01-01', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(8, 'Paula Lima', '2004-02-01', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(9, 'Paula Grazzi', '2005-03-01', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(10, 'Iago Grazzi', '2004-03-13', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(10, 'Ignácio Silva', '2004-13-13', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(11, 'Amoedo Rocha', '2005-07-07', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(13, 'Amoedo Silva', '2005-09-07', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(12, 'Pedro Silva', '2004-05-05', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(14, 'Pedro Daniel', '2004-04-02', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(15, 'Zayner Iameda', '2005-12-22', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(15, 'Donna Daisy', '2005-10-10', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(16, 'João Maria', '2004-10-10', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(16, 'Maria João', '2004-07-06', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(16, 'Ulices Santos', '2004-04-23', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(17, 'Douglas Pimentinha', '2005-04-23', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(17, 'Monica Daturma', '2005-03-22', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(18, 'Cebolinha Alcantara', '2004-02-27', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(18, 'Margarida Manganes', '2004-02-26', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(18, 'Livia Yada', '2004-06-30', 'F');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(19, 'Daniel Onirto', '2004-06-30', 'M');
insert into alunos(idTurma, nomeAluno, nascimentoAluno) values(20, 'Bethoven Betino', '2004-06-30', 'M');*/

insert into materias(idAluno, idProfessor, nomeMateria) values(1, 1, 'Inglês');
insert into materias(idAluno, idProfessor, nomeMateria) values(2, 1, 'Japonês');
insert into materias(idAluno, idProfessor, nomeMateria) values(3, 1, 'Inglês');
insert into materias(idAluno, idProfessor, nomeMateria) values(4, 2, 'Inglês');
insert into materias(idAluno, idProfessor, nomeMateria) values(5, 5, 'Espanhol');
insert into materias(idAluno, idProfessor, nomeMateria) values(6, 5, 'Português');
insert into materias(idAluno, idProfessor, nomeMateria) values(7, 5, 'Espanhol');
insert into materias(idAluno, idProfessor, nomeMateria) values(8, 4, 'Japones');
insert into materias(idAluno, idProfessor, nomeMateria) values(9, 9, 'Espanhol');
insert into materias(idAluno, idProfessor, nomeMateria) values(10, 10, 'Português');

select * from materias;

insert into responsaveis(nomeResponsavel, nascimentoResponsavel, generoResponsavel) values('Edgar', '1955-07-18', 'M');
insert into responsaveis(nomeResponsavel, nascimentoResponsavel, generoResponsavel) values('Danusa', '1956-08-18', 'F');
insert into responsaveis(nomeResponsavel, nascimentoResponsavel, generoResponsavel) values('Gaya', '1966-07-18', 'F');
insert into responsaveis(nomeResponsavel, nascimentoResponsavel, generoResponsavel) values('Luisa', '1970-01-02', 'F');
insert into responsaveis(nomeResponsavel, nascimentoResponsavel, generoResponsavel) values('Ione', '1969-12-13', 'M');
insert into responsaveis(nomeResponsavel, nascimentoResponsavel, generoResponsavel) values('Yasuo', '1967-10-02', 'M');
insert into responsaveis(nomeResponsavel, nascimentoResponsavel, generoResponsavel) values('Nidalle', '1957-08-02', 'F');
insert into responsaveis(nomeResponsavel, nascimentoResponsavel, generoResponsavel) values('Hummels', '1959-05-13', 'M');
insert into responsaveis(nomeResponsavel, nascimentoResponsavel, generoResponsavel) values('Enza', '1961-07-13', 'F');
insert into responsaveis(nomeResponsavel, nascimentoResponsavel, generoResponsavel) values('Julia', '1968-09-09', 'F');

insert into alunos_responsaveis(idAluno, idResponsavel) values(10, 1);
insert into alunos_responsaveis(idAluno, idResponsavel) values(9, 2);
insert into alunos_responsaveis(idAluno, idResponsavel) values(8, 3);
insert into alunos_responsaveis(idAluno, idResponsavel) values(7, 4);
insert into alunos_responsaveis(idAluno, idResponsavel) values(6, 5);
insert into alunos_responsaveis(idAluno, idResponsavel) values(5, 6);
insert into alunos_responsaveis(idAluno, idResponsavel) values(4, 7);
insert into alunos_responsaveis(idAluno, idResponsavel) values(3, 8);
insert into alunos_responsaveis(idAluno, idResponsavel) values(2, 9);
insert into alunos_responsaveis(idAluno, idResponsavel) values(1, 10);

drop table alunos_responsaveis, responsaveis;