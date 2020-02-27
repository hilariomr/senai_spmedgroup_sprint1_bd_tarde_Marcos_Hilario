USE SPMed_Group_Tarde;

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
VALUES ('Ligia', 'ligia@gmail.com', '19831013', '11 3456-7654', '43522543-5', '94839859000', 'ligia123', 2, 3),
		('Alexandre', 'alexandre@gmail.com', '20010723', '11 98765-6543',	'32654345-7', '73556944057', 'alexandre233', 3,	3),
		('Fernando', 'fernando@gmail.com', '19781010', '11 97208-4453', '54636525-3', '16839338002', 'fernando343', 4, 3),
		('Henrique', 'henrique@gmail.com', '19851013', '11 3456-6543', '54366362-5', '14332654765', 'henrique453', 5,	3),
		('João', 'joao@hotmail.com', '19750827', '11 7656-6377', 't32544444-1', '91305348010', 'joão563',	6, 3),
		('Bruno','bruno@gmail.com', '19720321', '11 95436-8769', '54566266-7', '79799299004',	'bruno673',	7, 3),
		('Mariana',	'mariana@outlook.com', '20180305', '11 95800-5244','54566266-8', '13771913039', 'mariana783',	8, 3);

		

INSERT INTO Medico (NomeMedico, CRM, Email, Senha, IdClinica, IdEspecialidade, IdTipoUsuario)
VALUES ('Ricardo Lemos', '54356-SP', 'ricardo.lemos@spmedicalgroup.com.br', 'ricardo123', 1, 2,	2),
		('Roberto Possarle', '53452-SP', 'roberto.possarle@spmedicalgroup.com.br', 'roberto123', 1,	17,	2),
		('Helena Strada', '65463-SP', 'helena.souza@spmedicalgroup.com.br', 'helena123', 1, 16,	2);

INSERT INTO Situacao (StatusConsulta)
VALUES	('Realizada'), ('Cancelada'), ('Agendada');

INSERT INTO Consulta (DataConsulta, IdSituacao, IdPaciente, IdMedico)
VALUES ('20200120 15:00',	1,	7,	3),
		('20200106 10:00', 2,	2,	2),
		('20200207 11:00', 1,	3,	2),
		('20180206 10:00', 1,	2,	2),
		('20190207 11:00', 2,	4,	1),
		('20200308 15:00', 3,	7,	3),
		('20200309 11:00', 3,	4,	1);

INSERT INTO Administrador (Nome, Senha, IdTipoUsuario)
VALUES ('Marcos', 'marcos123', 1);

