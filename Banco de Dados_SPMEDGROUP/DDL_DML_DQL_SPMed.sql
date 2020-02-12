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

INSERT INTO Especialidade (NomeEspecialidade)
VALUES ('Acupuntura'), ('Anestesiologia'), ('Angiologia '), ('Cardiologia'), ('Cirurgia Cardiovascular'), ('Cirurgia da Mão'),
('Cirurgia do Aparelho Digestivo'),('Cirurgia Geral'), ('Cirurgia Pediátrica'), ('Cirurgia Plástica'), ('Cirurgia Torácica'),
('Cirurgia Vascular'), ('Dermatologia'), ('Radioterapia'), ('Urologia'), ('Pediatria'), ('Psiquiatria');


INSERT INTO Endereco (Logradouro, Numero, CEP, Bairro, Cidade, Estado)
VALUES	('Av. Barão de Limeira', 532, '04022-000','Santa Cecilia', 'São Paulo',	'SP'),
		('Rua Estado de Israel',240, '04022-000', 'Sâo Paulo','São Paulo', 'SP'),
		('Av. Paulista', 1578, '01310-200',	'Bela Vista', 'São Paulo', 'SP'),
		('Av. Ibirapuera', 2927, '04029-200', 'Indianopolis', 'São Paulo', 'SP'),
		('Rua Vitoria', 120, '06402-030', 'Vila São Jorge',	'Barueri',	'SP'),
		('Rua Geraldo de Camargo', 66, '09405-380', 'Santa Luzia', 'Ribeirão Pires', 'SP'),
		('Alameda dos Arapanes', 945, '04524-001', 'Indianopolis', 'São Paulo',	'SP'),
		('Rua São Antonio', 232, '06407-140', 'Vila Universal', 'Barueri', 'SP');

INSERT INTO Clinica (NomeClinica, CNPJ, RazaoSocial, HoraAbertura, HoraFechamento, IdEndereco)
VALUES ('Clinica Possarle',	'86.400.902/0001-30', 'SP Medical Group', '07:00', '20:00', 1);

INSERT INTO TipoUsuario (TituloTipoUsuario)
VALUES ('Administrador'), ('Medico'), ('Paciente');

INSERT INTO Paciente (NomePaciente, Email, DataNascimento, Telefone, RG, CPF, Senha, IdEndereco, IdTipoUsuario)
VALUES ('Ligia', 'ligia@gmail.com', '13/10/1983', '11 3456-7654', '43522543-5', '94839859000', 'ligia123', 2, 3),
		('Alexandre', 'alexandre@gmail.com', '23/07/2001', '11 98765-6543',	'32654345-7', '73556944057', 'alexandre233', 3,	3),
		('Fernando', 'fernando@gmail.com', '10/10/1978', '11 97208-4453', '54636525-3', '16839338002', 'fernando343', 4, 3),
		('Henrique', 'henrique@gmail.com', '13/10/1985', '11 3456-6543', '54366362-5', '14332654765', 'henrique453', 5,	3),
		('João', 'joao@hotmail.com', '27/08/1975', '11 7656-6377', 't32544444-1', '91305348010', 'joão563',	6, 3),
		('Bruno','bruno@gmail.com', '21/03/1972', '11 95436-8769', '54566266-7', '79799299004',	'bruno673',	7, 3),
		('Mariana',	'mariana@outlook.com', '05/03/2018', '11 95800-5244','54566266-8', '13771913039', 'mariana783',	8, 3);

INSERT INTO Medico (NomeMedico, CRM, Email, Senha, IdClinica, IdEspecialidade, IdTipoUsuario)
VALUES ('Ricardo Lemos', '54356-SP', 'ricardo.lemos@spmedicalgroup.com.br', 'ricardo123', 1, 2,	2),
		('Roberto Possarle', '53452-SP', 'roberto.possarle@spmedicalgroup.com.br', 'roberto123', 1,	17,	2),
		('Helena Strada', '65463-SP', 'helena.souza@spmedicalgroup.com.br', 'helena123', 1, 16,	2);

INSERT INTO Situacao (StatusConsulta)
VALUES	('Realizada'), ('Cancelada'), ('Agendada');

INSERT INTO Consulta (DataConsulta, IdSituacao, IdPaciente, IdMedico)
VALUES ('20/01/2020 15:00',	1,	7,	3),
		('06/01/2020 10:00', 2,	2,	2),
		('07/02/2020 11:00', 1,	3,	2),
		('06/02/2018 10:00', 1,	2,	2),
		('07/02/2019 11:00', 2,	4,	1),
		('08/03/2020 15:00', 3,	7,	3),
		('09/03/2020 11:00', 3,	4,	1);

INSERT INTO Administrador (Nome, Senha, IdTipoUsuario)
VALUES ('Marcos', 'marcos123', 1);

SELECT * FROM Especialidade;
SELECT * FROM Endereco;
SELECT * FROM Clinica;
SELECT * FROM TipoUsuario;
SELECT * FROM Paciente;
SELECT * FROM Medico;
SELECT * FROM Situacao;
SELECT * FROM Consulta;
SELECT * FROM Administrador;











 