CREATE DATABASE SPMed_Group_Tarde;

USE SPMed_Group_Tarde;


CREATE TABLE Especialidade (
	IdEspecialidade		INT PRIMARY KEY IDENTITY,
	NomeEspecialidade	VARCHAR (60)
);


CREATE TABLE Endereco (
	IdEndereco		INT PRIMARY KEY IDENTITY,
	Logradouro		VARCHAR (100),
	Numero			INT,
	CEP				VARCHAR (10),
	Bairro			VARCHAR (50),
	Cidade			VARCHAR (50),
	Estado			CHAR (2)
);

CREATE TABLE Clinica (
	IdClinica		INT PRIMARY KEY IDENTITY,
	NomeClinica		VARCHAR (100),
	CNPJ			CHAR (20),
	RazaoSocial		VARCHAR (100),
	HoraAbertura	TIME,
	HoraFechamento	TIME,
	IdEndereco		INT FOREIGN KEY REFERENCES Endereco (IdEndereco)
);

CREATE TABLE TipoUsuario (
	IdTipoUsuario		INT PRIMARY KEY IDENTITY, 
	TituloTipoUsuario	VARCHAR (20)
);

CREATE TABLE Paciente (
	IdPaciente			INT PRIMARY KEY IDENTITY,
	NomePaciente		VARCHAR (50),
	Email				VARCHAR (50),
	DataNascimento		DATETIME,
	Telefone			VARCHAR (15),
	RG					VARCHAR (15),
	CPF					CHAR	(15),
	Senha				VARCHAR (50),
	IdTipoUsuario		INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario),
	IdEndereco			INT FOREIGN KEY REFERENCES Endereco (IdEndereco)
);

CREATE TABLE Medico (
	IdMedico		INT PRIMARY KEY IDENTITY, 
	NomeMedico		VARCHAR (50),
	CRM				VARCHAR (15),
	Email			VARCHAR (50),
	Senha			VARCHAR (50),
	IdClinica		INT FOREIGN KEY REFERENCES Clinica (IdClinica),
	IdEspecialidade	INT FOREIGN KEY REFERENCES Especialidade (IdEspecialidade),
	IdTipoUsuario	INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
);

CREATE TABLE Situacao (
	IdSituacao		INT PRIMARY KEY IDENTITY, 
	StatusConsulta	VARCHAR (10)
);

CREATE TABLE Consulta (
	IdConsulta		INT PRIMARY KEY IDENTITY, 
	DataConsulta	DATETIME, 
	IdPaciente		INT FOREIGN KEY REFERENCES Paciente (IdPaciente),
	IdMedico		INT FOREIGN KEY REFERENCES Medico	(IdMedico),
	IdSituacao		INT FOREIGN KEY REFERENCES Situacao (IdSituacao)
);

CREATE TABLE Administrador (
	IdAdministrador		INT PRIMARY KEY IDENTITY, 
	Nome				VARCHAR(50),
	Senha				VARCHAR (50),
	IdTipoUsuario		INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
);