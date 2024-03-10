CREATE DATABASE exprogramacao
GO
USE exprogramacao
GO

-- 1) Fazer em SQL Server os seguintes algoritmos:

-- a) Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles

DECLARE @num INT
SET @num = 6
IF(@num % 5 = 0 AND @num % 2 = 0)
BEGIN
PRINT CAST(@num AS VARCHAR) + ' é multiplo de 2 e 5'
END
ELSE
IF(@num % 2 = 0)
BEGIN
PRINT CAST(@num AS VARCHAR) + ' é multiplo de 2'
END
ELSE
IF(@num % 3 = 0)
BEGIN
PRINT CAST(@num AS VARCHAR) + ' é multiplo de 3'
END
ELSE
IF(@num % 5 = 0)
BEGIN
PRINT CAST(@num AS VARCHAR) + ' é multiplo de 5'
END
ELSE
BEGIN
PRINT 'Não é multiplo de 2, 3 ou 5'
END

-- b) Fazer um algoritmo que leia 3 números e mostre o maior e o menor
DECLARE @n1 INT,
	    @n2 INT,
		@n3 INT,
		@maior INT,
		@menor INT
SET @n1 = 99999
SET @n2 = 99
SET @n3 = 9999999
SET @maior = 0
SET @menor = 0

IF(@maior = 0 AND @menor = 0)
BEGIN
	SET @maior = @n1
	SET @menor = @n1
END

IF(@n1 > @maior)
BEGIN
	SET @maior = @n1
END
ELSE
IF(@n1 < @menor)
BEGIN
	SET @menor = @n1
END

IF(@n2 > @maior)
BEGIN
	SET @maior = @n2
END
ELSE
IF(@n2 < @menor)
BEGIN
	SET @menor = @n2
END

IF(@n3 > @maior)
BEGIN
	SET @maior = @n3
END
ELSE
IF(@n3 < @menor)
BEGIN
	SET @menor = @n3
END
PRINT 'Maior: '+CAST(@maior AS VARCHAR)
PRINT 'Menor: '+CAST(@menor AS VARCHAR)

--c) Fazer um algoritmo que calcule os 15 primeiros termos da série
--1,1,2,3,5,8,13,21,...
--E calcule a soma dos 15 termos
DECLARE @fib2 INT = 0
DECLARE @fib1 INT = 1
DECLARE @fib INT
DECLARE	@ctrl INT
DECLARE @sum INT = 0
SET @ctrl = 1
WHILE(@ctrl <= 15)
BEGIN
	PRINT @fib
    SET @fib = @fib1 + @fib2
    SET @fib2 = @fib1
    SET @fib1 = @fib
	SET @sum = @sum + @fib
    SET @ctrl = @ctrl + 1;
END
PRINT 'Soma de todos os termos: '+CAST(@sum AS VARCHAR)

--d) Fazer um algoritmo que separa uma frase, colocando todas as letras em maiúsculo e em
--minúsculo (Usar funções UPPER e LOWER)
DECLARE @frase VARCHAR(100),
		@upper VARCHAR(100),
	    @lower VARCHAR(100),
		@length INT,
		@cont INT
SET @frase = 'Ola Mundo'
SET @upper = UPPER(@frase)
SET @lower = LOWER(@frase)
PRINT @upper
PRINT @lower

--e) Fazer um algoritmo que inverta uma palavra (Usar a função SUBSTRING)
DECLARE @palavra VARCHAR(100),
		@invertida VARCHAR(100),
		@cont	INT
SET @cont = 1
SET @palavra = 'Socorram-me subi no onibus em marrocos'
WHILE(@cont <= LEN(@palavra))
BEGIN
	SET @invertida = CONCAT(@invertida, SUBSTRING(@palavra, LEN(@palavra)-@cont+1, 1))
	SET @cont = @cont + 1
END
PRINT @invertida

--f) Considerando a tabela abaixo, gere uma massa de dados, com 100 registros, para fins de teste
--com as regras estabelecidas (Não usar constraints na criação da tabela)
CREATE TABLE computador(
id		INT		NOT NULL,
marca	VARCHAR(40)		NOT NULL,
qtd_ram	INT		NOT NULL,
tipo_hd	VARCHAR(10)	NOT NULL,
qtd_hd	INT		NOT NULL,
freq_cpu		DECIMAL(7,2)		NOT NULL
PRIMARY KEY(id)
)

DECLARE @cid INT,
		@marca VARCHAR(40),
		@qtdram INT,
		@tipohd	VARCHAR(40),
		@qtdhd INT,
		@freqcpu DECIMAL(7,2),
		@cont INT,
		@rand INT
SET @cont = 1
SET @cid = 10001
WHILE(@cont <= 100)
BEGIN
	SET @marca = 'Marca ' + CAST(@cont AS VARCHAR)
	SET @qtdram = RAND()*4+1
	SET @qtdram = CHOOSE(@qtdram, 2, 4, 8, 16)
	SET @tipohd = (@cid % 3) + 1
	SET @tipohd = CHOOSE(@tipohd, 'HDD', 'SSD', 'M2 NVME')
	IF(@tipohd = 'HDD')
	BEGIN
		SET @qtdhd = RAND()*3+1
		SET @qtdhd = CHOOSE(@qtdhd, 500, 1000, 2000)
	END
	ELSE
	BEGIN
		SET @qtdhd = RAND()*3+1
		SET @qtdhd = CHOOSE(@qtdhd, 128, 256, 512)
	END
	SET @freqcpu = RAND()*1.50+1.70
	
	INSERT INTO computador VALUES
	(@cid, @marca, @qtdram, @tipohd, @qtdhd, @freqcpu)
	SET @cont = @cont + 1
	SET @cid = @cid + 1
END

SELECT * FROM computador
