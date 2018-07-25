CREATE DATABASE EFUN;

USE EFUN;

CREATE TABLE Denuncia(
		codigo				int					not null	auto_increment,
        dataHoraDenuncia	timestamp			not null,
        descricao			varchar(200)		not null,
        primary key 		(codigo)
);

CREATE TABLE Pessoa(
		nomeUsuario		varchar(100)	not null,
		nome			varchar(100)	not null,
        email			varchar(50)		not null,
        dataNasc		date			not null,
        senha			varchar(50)		not null,
        primary key		(nomeUsuario)
);

CREATE TABLE Denunciacao(
		codDenuncia		int				not null	auto_increment,
        nomeUsuPessoa	varchar(100)	not null,
        primary key		(codDenuncia, nomeUsuPessoa),
        foreign key		(codDenuncia)	References Denuncia(codigo),
        foreign key		(nomeUsuPessoa)	References Pessoa(nomeUsuario)
);

CREATE TABLE Supervisor(
		cpf				varchar(11)		not null,
        nome			varchar(100)	not null,
        email			varchar(50)		not null,
        dataDemissao	date				null,
        dataAdmissao	timestamp			not null,
        primary key		(cpf)
);

CREATE TABLE Historia(
		codigo			int				not null	auto_increment,
        genero			varchar(20)		not null,
        capitulos		varchar(200)	 		not null,
        titulo			varchar(100)	not null,
        sinopse			varchar(200)	not null,
        nomeUsuPessoa	varchar(100)	not null,
        primary key		(codigo),
        foreign key		(nomeUsuPessoa)	References Pessoa(nomeUsuario)
);


CREATE TABLE CriacaoHistoria(
		codHistoria			int				not null	auto_increment,
        nomeUsuPessoa		varchar(100)	not null,
        dataHoraCriacao		timestamp		not null,
        primary key			(codHistoria, nomeUsuPessoa),
        foreign key			(codHistoria)	References Historia(codigo),
        foreign key			(nomeUsuPessoa)	References Pessoa(nomeUsuario)
);

CREATE TABLE ComentarioHistoria(
		nomeUsuPessoa		varchar(100)	not null,
        codHistoria			int				not null,
        dataHoraComent		timestamp		not null,
        descricao			varchar(200)	not null,
        primary key			(nomeUsuPessoa, codHistoria),
        foreign key			(nomeUsuPessoa)	References Pessoa(nomeUsuario),
        foreign key			(codHistoria)	References Historia(codigo)
);

CREATE TABLE CompartilhamentoHistoria(
		nomeUsuPessoa		varchar(100)	not null,
        codHistoria			int				not null,
        dataHoraComp		timestamp		not null,
        primary key			(nomeUsuPessoa, codHistoria),
        foreign key			(nomeUsuPessoa)	References Pessoa(nomeUsuario),
        foreign key			(codHistoria)	References Historia(codigo)
);

CREATE TABLE AvaliacaoHistoria(
		nomeUsuPessoa		varchar(100)	not null,
        codHistoria			int				not null,
        dataHoraCurt		timestamp		not null,
        primary key			(nomeUsuPessoa, codHistoria),
        foreign key			(nomeUsuPessoa)	References Pessoa(nomeUsuario),
        foreign key			(codHistoria)	References Historia(codigo)
);


CREATE TABLE Forum(
		codigo			int				not null	auto_increment,
        nome			varchar(100)	not null,
        descricao		varchar(200)	not null,
        privacidade		varchar(10)		not null,
        nomeUsuPessoa	varchar(100)	not null,
        primary key		(codigo),
        foreign key		(nomeUsuPessoa)	References Pessoa(nomeUsuario)
);

CREATE TABLE CriacaoForum(
		nomeUsuPessoa	varchar(100)	not null,
        codForum		int				not null	auto_increment,
        dataHoraCriacao		timestamp			not null,
        primary key		(nomeUsuPessoa, codForum),
        foreign key		(nomeUsuPessoa)	References Pessoa(nomeUsuario),		
        foreign key		(codForum)		References Forum(codigo)
);

CREATE TABLE ParticipacaoForum(
		nomeUsuPessoa		varchar(100)	not null,
        codForum			int				not null,
        dataHoraPart		timestamp		not null,
        primary key			(nomeUsuPessoa, codForum),
        foreign key			(nomeUsuPessoa)	References Pessoa(nomeUsuario),		
        foreign key			(codForum)		References Forum(codigo)
);

CREATE TABLE SuspensaoPessoa(
		cpfSupervisor	varchar(11)		not null,
        nomeUsuPessoa	varchar(100)	not null,
        dataSusp		date			not null,
        situacao		char			not null,
        descricao		varchar(200)	not null,
        primary key		(cpfSupervisor, nomeUsuPessoa),
        foreign key		(cpfSupervisor) References Supervisor(cpf),
        foreign key		(nomeUsuPessoa) References Pessoa(nomeUsuario)
);

CREATE TABLE SuspensaoHistoria(
		cpfSupervisor	varchar(11)		not null,
        codHistoria		int				not null,
        dataSusp		date			not null,
        situacao		char			not null,
        descricao		varchar(200)	not null,
        primary key		(cpfSupervisor, codHistoria),
        foreign key		(cpfSupervisor)	References Supervisor(cpf),
        foreign key		(codHistoria)	References Historia(codigo)
);


CREATE TABLE SuspensaoForum(
		cpfSupervisor	varchar(11)		not null,
        codForum		int				not null,
        dataSusp		date			not null,
        situacao		char			not null,
        descricao		varchar(200)	not null,
        primary key		(cpfSupervisor, codForum),
        foreign key		(cpfSupervisor)	References Supervisor(cpf),
        foreign key		(codForum)		References Forum(codigo)
);

INSERT INTO Supervisor
VALUES('11111111111','Leonardo','leosilva@pmail',null,now());

select * from Forum;