CREATE TABLE usuario (
	IdUsu SERIAL PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	cpf VARCHAR (14) NOT NULL UNIQUE,
	Endereco VARCHAR (50) NOT NULL,
	email VARCHAR (30) NOT NULL,
	login VARCHAR (15) NOT NULL UNIQUE,
	senha VARCHAR (15) NOT NULL
)

CREATE TABLE turma (
	IdTurma SERIAL PRIMARY KEY,
	CodTurma VARCHAR (5) NOT NULL UNIQUE,
	Nome VARCHAR (20) NOT NULL,
	Sala VARCHAR(20) NOT NULL,
	Horario VARCHAR(30) NOT NULL
)

CREATE TABLE aluno (
	IdAluno SERIAL PRIMARY KEY,
	Matricula VARCHAR(10) NOT NULL UNIQUE,
	IdTurma INT REFERENCES Turma(IdTurma) ON UPDATE CASCADE ON DELETE CASCADE,
	IdUsu INT REFERENCES Usuario(IdUsu) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE professor (
	IdProf SERIAL PRIMARY KEY,
	IdUsu INT REFERENCES Usuario(IdUsu) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE diretor (
	IdDir SERIAL PRIMARY KEY,
	IdUsu INT REFERENCES Usuario(IdUsu) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE disciplina (
	IdDisc SERIAL PRIMARY KEY,
	CodDisc VARCHAR (7) UNIQUE,
	Nome VARCHAR(50),
	Status BOOL,
	IdProf INT REFERENCES Professor(IdProf) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE nota (
	IdNota SERIAL UNIQUE,
	IdAluno INT REFERENCES aluno(IdAluno) ON UPDATE CASCADE ON DELETE CASCADE,
	IdDisc INT REFERENCES Disciplina(IdDisc) ON UPDATE CASCADE ON DELETE CASCADE,
	n1 FLOAT,
	n2 FLOAT,
	n3 FLOAT,
	media FLOAT,
	faltas INT,
	PRIMARY KEY (IdAluno, IdDisc)
)

CREATE TABLE turmadisc (
	IdTurma INT REFERENCES Turma(IdTurma) ON UPDATE CASCADE ON DELETE CASCADE,
	IdDisc INT REFERENCES Disciplina(IdDisc) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (IdTurma, IdDisc)
)

CREATE TABLE turmaprof (
	IdTurma INT REFERENCES Turma(IdTurma) ON UPDATE CASCADE ON DELETE CASCADE,
	IdProf INT REFERENCES Professor(IdProf) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(IdTurma,IdProf)
)

CREATE TABLE boletim (
	IdAluno INT REFERENCES aluno(IdAluno) ON UPDATE CASCADE ON DELETE CASCADE,
	IdDisc INT REFERENCES Disciplina(IdDisc) ON UPDATE CASCADE ON DELETE CASCADE,
	n1 FLOAT,
	n2 FLOAT,
	n3 FLOAT,
	media FLOAT,
	faltas INT,
	situacao VARCHAR(10),
	PRIMARY KEY (IdAluno, IdDisc)
)