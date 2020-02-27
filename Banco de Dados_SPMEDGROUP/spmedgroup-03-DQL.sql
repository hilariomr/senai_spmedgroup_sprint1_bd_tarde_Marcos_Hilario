USE SPMed_Group_Tarde;

SELECT * FROM Especialidade;
SELECT * FROM Endereco;
SELECT * FROM Clinica;
SELECT * FROM TipoUsuario;
SELECT * FROM Paciente;
SELECT * FROM Medico;
SELECT * FROM Situacao;
SELECT * FROM Consulta;
SELECT * FROM Administrador;

SELECT COUNT (NomePaciente) AS [Quantidade de Pacientes Cadastrados] FROM Paciente;

SELECT NomePaciente, CONVERT(VARCHAR(10), DataNascimento, 103) AS [Data de Nascimento], DATEDIFF(YEAR,DataNascimento,GETDATE()) AS Idade, RG, CPF, Email  
FROM Paciente

 
SELECT  Medico.NomeMedico, CRM, Especialidade.NomeEspecialidade AS Especialidade
FROM Medico
INNER JOIN Especialidade ON Medico.IdMedico = Especialidade.IdEspecialidade
WHERE Especialidade.IdEspecialidade =  1


--Função que retorna a quantidade de médicos de uma determinada especialidade
CREATE FUNCTION QuantidadeEspecialista (@ID AS INT) RETURNS INT
AS
BEGIN
	DECLARE @ESPECIALISTAS INT
	SELECT @ESPECIALISTAS =  COUNT(IdMedico)  
	FROM Medico
	WHERE IdEspecialidade = @ID
	RETURN @ESPECIALISTAS
END

SELECT NomeEspecialidade, [dbo].[QuantidadeEspecialista](IdEspecialidade) AS Quantidade FROM Especialidade

SELECT Especialidade.NomeEspecialidade, COUNT (IdMedico) AS [Quantidade de Especialistas]
FROM Medico 
INNER JOIN Especialidade ON Medico.IdMedico = Especialidade.IdEspecialidade
WHERE Especialidade.IdEspecialidade = 1
GROUP BY Especialidade.NomeEspecialidade








