--EX.1
CREATE DATABASE AfterSchool
GO

--Creare tabele

CREATE TABLE AFTERSCHOOL(
ID int PRIMARY KEY,
Denumire nvarchar(40) NOT NULL,
NrClase int NOT NULL)



CREATE TABLE GRUPA(
ID int PRIMARY KEY,
AnScolar int NOT NULL,
DenumireGrupa nvarchar(30) NOT NULL
)



CREATE TABLE ELEV(
ID int PRIMARY KEY,
IdAfterS int NOT NULL,
FOREIGN KEY (IdAfterS) REFERENCES AFTERSCHOOL(ID),
IdGrupa int CHECK (IdGrupa IN (NULL, 1, 2, 3, 4, 5, 6, 7, 8, 9)),
Nume nvarchar(50) NOT NULL,
Prenume nvarchar(50) NOT NULL,
DataNastere date NOT NULL,
Varsta int NOT NULL,
DataInmatriculare date NOT NULL,
NumeParinte nvarchar(50),
NrTelefon nvarchar(10),
Activ bit NOT NULL)



CREATE TABLE PROFESOR(
ID int PRIMARY KEY,
IdAfterS int NOT NULL,
FOREIGN KEY (IdAfterS) REFERENCES AFTERSCHOOL(ID),
Nume nvarchar (50) NOT NULL,
Prenume nvarchar (50) NOT NULL,
Materie nvarchar(50),
Salariu int NOT NULL,
Vechime int NOT NULL,
Activ bit NOT NULL)



CREATE TABLE PROFESORGRUPA(
ID int PRIMARY KEY,
IdGrupa int NOT NULL CHECK (IdGrupa IN (1, 2, 3, 4, 5, 6, 7, 8, 9)),
FOREIGN KEY (IdGrupa) REFERENCES GRUPA(ID),
IdProfesor int NOT NULL CHECK (IdProfesor IN (1, 2, 3, 4, 5, 6, 7, 8, 9)),
FOREIGN KEY (IdProfesor) REFERENCES PROFESOR(ID)
)





--Inserare in tabele

INSERT INTO AFTERSCHOOL(ID, Denumire, NrClase)
VALUES
(1, 'Raza de soare', 9),
(2, 'Aurora', 2),
(3, 'Happy Kids Academy', 5),
(4, 'Butterfly', 4),
(5, 'Clubul Jucausilor', 3),
(6, 'Curcubeul Copilariei', 6)



INSERT INTO GRUPA(ID, AnScolar, DenumireGrupa)
VALUES
(1, 0, 'Floricele Colorate'),
(2, 1, 'Cercetasii'),
(3, 2, 'Fluturasii'),
(4, 3, 'Albinutele'),
(5, 4, 'Bucurosii'),
(6, 5, 'Piticii'),
(7, 6, 'Voinicii'),
(8, 7, 'Visatorii'),
(9, 8, 'Printii si printesele')





INSERT INTO ELEV(ID, IdAfterS, IdGrupa, Nume, Prenume, DataNastere, Varsta, DataInmatriculare, NumeParinte, NrTelefon, Activ)
VALUES
(1, 1, 1, 'Varza', 'Gabriel Catalin', '2016-07-17', 6, '2021-10-11', 'Grigore', '0789424155', 1),
(2, 1, 1, 'Dumitrescu', 'Cristina Ionela', '2017-07-20', 5, '2019-05-14', 'Adrian', '0721343777', 1),
(3, 1, 1, 'Liliac', 'Adelin', '2017-08-13', 5, '2019-10-22', 'Robert', NULL, 1),
(4, 1, 1, 'Tolea', 'Edward', '2016-11-09', 6, '2022-01-10', 'Mirel', '0746545323', 1),
(5, 1, 1, 'Pendea', 'Carmen', '2017-07-12', 5, '2022-01-22', 'Cosmin', '0733121680', 1),
(6, 1, 1, 'Sucleanta', 'Madalina Luciana', '2017-07-06', 6, '2018-09-19', 'Valentin', NULL, 1),
(7, 1, 1, 'Bran', 'Florin Vlad', '2016-02-21', 6, '2021-12-13', 'Marius', '0768491756', 1),
(8, 1, 2, 'Cioran', 'Valentin Stefan', '2016-03-11', 6, '2019-07-18', 'Iuliana', NULL, 1),
(9, 1, 2, 'Nicolae', 'Mario', '2015-06-10', 7, '2021-10-02', 'Aurel', '0712101222', 1),
(10, 1, 2, 'Titescu', 'Ioana', '2015-05-10', 7, '2021-09-12', 'Mirel', '0726161568', 1),
(11, 1, 2, 'Bogdanescu', 'Minodora', '2016-01-01', 6, '2021-09-24', 'Mircea', '0771898256', 1),
(12, 1, 2, 'Curteanu', 'Gabriel', '2016-11-08', 6, '2021-06-18', 'Mihaela', '0726797284', 1),
(13, 1, 2, 'Alecse', 'Iulia Elena', '2016-10-23', 6, '2021-11-03', 'Ileana', NULL, 1),
(14, 1, 2, 'Diaconescu', 'Valentin', '2015-11-11', 7, '2020-12-15', 'Petre', '0732156790', 1),
(15, 1, 2, 'Petrescu', 'Maia Ionela', '2015-08-26', 7, '2022-03-18', 'Valeria', NULL, 1),
(16, 1, 2, 'Catrina', 'Gabriela', '2015-04-01', 7, '2021-08-02', 'Petruta', '0213445089', 1),
(17, 1, 2, 'Pristanda', 'Ionel Marian', '2016-07-14', 6, '2022-01-03', 'Floricica', '0726868324', 1),
(18, 1, 2, 'Americanu', 'Ionut Willson', '2015-08-09', 7, '2021-09-02', 'John', '9159969739', 1),
(19, 1, 2, 'Calinescu', 'Ionut Cristian', '2016-06-01', 6, '2020-03-03', 'Mihai', '0766512345', 1),
(20, 1, 2, 'Bogdana', 'Flavia', '2015-12-09', 7, '2021-12-12', 'Georgel', '0789858444', 1),
(21, 1, 2, 'Tarb', 'Achim', '2016-11-07', 6, '2019-09-18', 'Sabin', '0790321454', 1),
(22, 1, 2, 'Taciu', 'Gabriel Justin', '2015-05-08', 7, '2021-10-10', 'Tudor', '0722123434', 1),
(23, 1 ,2, 'Hebean', 'Sebastian', '2016-10-08', 6, '2020-08-07', 'Calin', NULL, 1),
(24, 1, 2, 'Pedica', 'Patricia', '2016-12-28', 6, '2020-08-27', 'Cristian', '0755121334', 1),
(25, 1, 2, 'Petrescu', 'Lucian', '2015-08-09', 7, '2022-03-09', 'Mirela', '0798757464', 1),
(26, 1 ,2, 'Nebru', 'Adelina', '2016-09-10', 6, '2020-10-12', 'Emil', '0764656887', 1),
(27, 1, 2, 'Constantinescu', 'Alexandru', '2016-8-11', 6, '2019-10-12', 'Petrisor', '0753122665', 1),
(28, 1 ,2, 'Sava', 'Sergiu Mihai', '2015-03-07', 7, '2019-11-01', 'Serban', '0769343112', 1),
(29, 1, 2, 'Zaharia', 'Elena', '2016-06-23', 6, '2021-09-15', 'Aurelia', NULL, 1),
(30, 1, 2, 'Fifere', 'Valentina', '2016-11-09', 6, '2020-02-22', 'Monica', '0743565877', 1),
(31, 1, 2, 'Barbu', 'Ionut Alexandru', '2016-05-19', 6, '2021-05-27', 'Emanuel', '0743995897', 1),
(32, 1, 2, 'Ispas', 'Florin', '2015-06-21', 7, '2019-10-27', 'Victor', '0712343555', 1),
(33, 1, 2, 'Sima', 'Andreea', '2015-04-12', 7, '2020-01-03', 'Octavian', '0788654890', 1),
(34, 1, 3, 'Popescu', 'William', '2013-07-14', 8, '2019-06-27', 'Monica', '4148929343', 1),
(35, 1, 3, 'Miculete', 'Mihai Adrian', '2014-07-23', 8, '2022-04-19', 'Iuliana', NULL, 1),
(36, 1, 3, 'Aluminiu', 'Alexandru', '2014-03-11', 8, '2019-12-13', 'Mihai', NULL, 1),
(37, 1, 3, 'Olteanu', 'Dacian', '2015-06-07', 7, '2021-04-05', 'Ovidiu', '0768424126', 1),
(38, 1, 3, 'Tirdei', 'Cristina Elena', '2014-05-03', 7, '2019-11-11', 'Bogdan', '0779833901', 1),
(39, 1, 3, 'Popescu', 'Roxana', '2015-11-08', 7, '2019-08-03', 'Mioara', '0790123767', 1),
(40, 1, 3, 'Grigore', 'Teodor', '2014-08-23', 8, '2022-01-10', 'Marcel', '0771565788', 1),
(41, 1, 3, 'Ghebaur', 'Theodor Gabriel', '2014-09-24', 8, '2020-08-11', 'Toma', '0726979428', 1),
(42, 1, 3, 'Brutaru', 'Daniela Cristina', '2015-01-04', 7, '2012-03-29', 'Ionel', NULL, 1),
(43, 1, 4, 'Victor', 'Valeria Maria', '2014-05-18', 8, '2020-04-04', 'Oana', NULL, 1),
(44, 1, 4, 'Bob', 'Alina Gabriela', '2014-12-12', 8, '2019-08-01', 'Petru', '0768482884', 1),
(45, 1, 4, 'Protopopescu', 'Adrian Madalin', '2014-05-29', 8, '2019-06-04', 'Stefania', '0749010321', 1),
(46, 1, 4, 'Filip', 'Petru', '2014-08-01', 8, '2020-07-07', 'Ion', '0751474747', 1),
(47, 1, 4, 'Mihai', 'Teodora', '2014-02-05', 8, '2021-09-08', 'Cornel', '0771455633', 1),
(48, 1, 4, 'Bordincel', 'Corina', '2013-07-19', 9, '2022-02-07', 'Titel', '0788567455', 1),
(49, 1, 4, 'Moatar', 'Eugen', '2013-08-18', 9, '2020-05-12', 'Mircea', '0213556732', 1),
(50, 1, 4, 'Ciolpan', 'Ana-Maria', '2013-04-24', 9, '2022-03-21', 'Adriana', '0712555424', 1),
(51, 1, 4, 'Popescu', 'Eduard', '2013-05-07', 9, '2021-03-22', 'Adrian', '0798981332', 1),
(52, 1, 5, 'Rait', 'Ivona', '2014-01-09', 9, '2020-04-09', 'Toma', '0756424133', 1),
(53, 1, 5, 'Iepure', 'Carla Simina', '2014-09-13', 9, '2019-06-22', 'Elena', '0799878616', 1),
(54, 1, 5, 'Tanasie', 'Ecaterina Teodora', '2013-02-27', 10, '2020-01-30', 'Denisa', '0725666898', 1),
(55, 1, 5, 'Barbuta', 'Ioana', '2012-12-12', 10, '2019-10-01', 'Ilie', '0732114112', 1),
(56, 1, 5, 'Tanasoiu', 'Toma Mircea', '2014-01-04', 9, '2019-03-05', 'Mihaela', NULL, 1),
(57, 1, 5, 'Diaconescu', 'Dan Ionel', '2013-07-06', 9, '2022-03-17', 'Raul', '0778909878', 1),
(58, 1, 5, 'Oache', 'Christopher Mike', '2013-06-09', 9, '2021-04-29', 'Georgel', '7864206154', 1),
(59, 1, 5, 'Ciolpan', 'Ioana Mihaela', '2013-08-26', 9, '2021-09-05', 'Ilie', NULL, 1),
(60, 1, 6, 'Ianau', 'Narcis', '2012-08-19', 10, '2018-09-27', 'Maria Elena', '0789765443', 1),
(61, 1, 6, 'Brutaru', 'Catalin', '2012-10-09', 10, '2019-10-05', 'Bogdan', '0767515229', 1),
(62 ,1, 6, 'Saftoiu', 'Andi Daniel', '2012-01-11', 11, '2021-09-25', 'Costel', '0776090816', 1),
(63, 1, 6, 'Albuica', 'Catalina Ionela', '2012-05-03', 11, '2022-02-06', 'Florin', '0742848268', 1),
(64, 1, 6, 'Biaga', 'Florin', '2012-02-20', 11, '2020-09-13', 'Diana', '0741320550', 1),
(65, 1, 6, 'Olaru', 'Stefania Mihaela', '2012-10-30', 10, '2021-10-22', 'Gabriel', '0746787009', 1),
(66, 1, 6, 'Tudorache', 'Catalin', '2011-09-29', 11, '2019-08-16', 'Claudiu', '0722555421', 1),
(67, 1, 6, 'Suiu', 'Ana-Maria', '2012-06-18', 10, '2020-01-17', 'Minodora', '0766777888', 1),
(68, 1, 7, 'Skywalker', 'Luke', '2010-10-02', 12, '2020-10-02', 'Anakin', '0712678909', 1),
(69, 1, 7, 'Moldovan', 'Andrei Ilie', '2011-09-08', 11, '2019-10-22', 'Nicolae', '0747888121', 1),
(70, 1, 7, 'Cuza', 'Bianca Georgiana', '2010-07-02', 12, '2022-07-26', 'Mioara', '0768909111', 1),
(71, 1, 7, 'Georgescu', 'Alexandru Gabriel', '2011-08-10', 11, '2019-04-18', 'Tudor', NULL, 1),
(72, 1, 7, 'Istrat', 'Alexandra', '2010-01-28', 12, '2018-04-01', 'Cristian', NULL, 1),
(73, 1, 7, 'Lipan', 'Cristiano', '2010-05-07', 12, '2020-10-22', 'Victor', '0782123456', 1),
(74, 1, 7, 'Iliescu', 'Andreea Bianca', '2011-08-26', 11, '2021-09-28', 'Eugen', '074543677', 1),
(75, 1, 7, 'Buzescu', 'Radu Andrei', '2011-06-14', 11, '2021-03-12', 'Stefan', '0776554223', 1),
(76, 1, 8, 'Preda', 'Stefan', '2010-07-23', 12, '2022-03-10', 'Gheorghita', '0799999101', 1),
(77, 1, 8, 'Stroia', 'Melania', '2010-10-22', 12, '2021-10-09', 'Simona', '0729665429', 1),
(78, 1, 8, 'Stanisor', 'Angelica Elena', '2009-04-17', 13, '2021-08-09', 'Vasile', '0742676588', 1),
(79, 1, 8, 'Brutaru', 'Catalin', '2009-08-10', 13, '2019-10-15', 'Marian', NULL, 1),
(80, 1, 8, 'Barbu', 'Victor', '2010-04-03', 12, '2020-10-10', 'Iulian', '0744766898', 1),
(81, 1, 8, 'Achim', 'Emilia', '2008-07-19', 14, '2021-05-14', 'Falvia', '0721776534', 1),
(82, 1, 8, 'Forda', 'Geanina', '2009-05-05', 13, '2020-12-28', 'Liviu', '073212444', 1),
(83, 1, 9, 'Oltianu', 'Flavius', '2008-06-14', 14, '2019-08-06', 'Dacian', '0756434121', 1),
(84, 1, 9, 'Emil', 'Sabina Sanziana', '2008-04-21', 14, '2021-09-08', 'Radu', NULL, 1),
(85, 1, 9, 'Perian', 'Petrut', '2008-07-22', 14, '2020-08-18', 'Traian', '0768919221', 1),
(86, 1, 9, 'Kivu', 'Eusebia', '2007-02-21', 15, '2021-09-15', 'Camil', '0764565811', 1),
(87, 1, 9, 'Fetoiu', 'Marian', '2008-01-08', 14, '2021-10-20', 'Cornel', '0747457534', 1),
(88, 1, 9, 'Zoia', 'Bianca Maria', '2007-06-07', 15, '2019-04-28', 'Crina', '0790120102', 1),
(89, 1, 9, 'Simionescu', 'Nicoleta', '2007-09-11', 15, '2022-03-26', 'Bucur', NULL, 1),
(90, 1, 9, 'Bizu', 'Leontin Mihai', '2007-08-21', 15, '2021-07-13', 'Tiberiu', '0724343655', 1)




INSERT INTO PROFESOR(ID, IdAfterS, Nume, Prenume, Materie, Salariu, Vechime, Activ)
VALUES
(1, 1, 'Nicolae', 'Alin', 'Matematica', 7000, 28, 1),
(2, 1, 'Obada', 'Constantin', 'Istorie', 3800, 6, 1),
(3, 1, 'Tudor', 'Raluca', 'Literatura', 4500, 12, 1),
(4, 1, 'Ghinea', 'Maria', 'Geografie', 3000, 5, 1),
(5, 1, 'Albuica', 'Lucian', 'Informatica', 5500, 20, 1),
(6, 1, 'Copacelu', 'Mioara', 'Matematica', 4200, 10, 1),
(7, 2, 'Tudor', 'Alexandru', 'Istorie', 2900, 4, 1),
(8, 3, 'Mann', 'Adelina', 'Desen', 3000, 6, 1),
(9, 5, 'Motoci', 'Elena', 'Muzica', 4500, 23, 1)



INSERT INTO PROFESORGRUPA(ID, IdGrupa, IdProfesor)
VALUES
(1, 1, 4),
(2, 2, 8),
(3, 3, 6),
(4, 4, 2),
(5, 5, 5),
(6, 6, 3),
(7, 7, 7),
(8, 8, 9),
(9, 9, 1)









--Ex.2

SELECT E.DataNastere AS [Data Nasterii], E.NumeParinte AS [Parinte], E.NrTelefon
FROM ELEV E
WHERE MONTH(E.DataNastere) = (SELECT MONTH(DataNastere)
FROM ELEV WHERE NUME = 'Constantinescu' AND PRENUME = 'Alexandru') AND E.IdGrupa = 2


--Ex.3
CREATE VIEW Raport as
SELECT P.Nume AS [Nume Profesor],COUNT(E.ID) as [Numar Elevi],
G.DenumireGrupa AS[Denumire Grupa], G.AnScolar AS [An Scolar]
from PROFESOR as P JOIN PROFESORGRUPA as PG ON P.ID = PG.IdProfesor
JOIN GRUPA as G on PG.IdGrupa = G.ID
JOIN ELEV as E on G.ID = E.IdGrupa
GROUP BY P.Nume, G.DenumireGrupa, G.AnScolar

Select * from Raport




--Ex.4
Alter table PROFESOR ADD Bonus int
Alter table PROFESOR ADD BonusProcentaj nvarchar(5)


CREATE PROCEDURE BonusProfesori
AS 
BEGIN 
DECLARE
@IdProfesor int = 1,
@NrProfesori int,
@Bonus float,
@BonusProcentaj nvarchar(10),
@Procent float = 0,
@Vechime int,
@Salariu int,
@NrElevi int;

SET NOCOUNT ON
SET @NrProfesori = (SELECT TOP(1) ID FROM PROFESOR ORDER BY ID DESC)

WHILE @IdProfesor <= @NrProfesori
BEGIN
IF EXISTS (SELECT P.VECHIME FROM PROFESOR as P WHERE ID = @IdProfesor)
BEGIN
	SET @Procent = 0
	SELECT @Vechime = P.VECHIME FROM PROFESOR as P WHERE ID = @IdProfesor
	IF (@Vechime <= 5)
		BEGIN
		SET @Procent = @Procent + 2
		END

	IF (@Vechime >= 6 AND @Vechime < 15)
		BEGIN
		SET @Procent = @Procent + 5
		END

	IF (@Vechime >= 15 AND @Vechime <= 25)
		BEGIN
		SET @Procent = @Procent + 10
		END

	IF (@Vechime >= 26) 
		BEGIN
		SET @Procent = @Procent + 12
		END
			

	SELECT @NrElevi = COUNT(E.ID) FROM PROFESOR as P JOIN PROFESORGRUPA as PG ON P.ID = PG.IdProfesor
	JOIN GRUPA as G on PG.IdGrupa = G.ID JOIN ELEV as E on G.ID = E.IdGrupa
	WHERE P.ID = @IdProfesor
			
	IF (@NrElevi < 20)
	BEGIN
		SET @Procent = @Procent + 0
	END

	IF (@NrElevi >= 21)
	BEGIN
		SET @Procent = @Procent + 3
	END
			
	SET @Salariu = (SELECT top(1) Salariu FROM PROFESOR WHERE ID = @IdProfesor);
	SET @Bonus = (@Procent/100)  * @Salariu
	SET @BonusProcentaj = CAST(@Procent as nvarchar(10)) + '%'
			
	UPDATE PROFESOR
	SET Bonus = @Bonus,  BonusProcentaj = @BonusProcentaj
	WHERE ID = @IdProfesor
	

	SET @IdProfesor += 1
END
		
	ELSE 
	BEGIN
		SET @IdProfesor += 1
	END
	END
END



EXECUTE BonusProfesori

select * from PROFESOR



--EX.5
CREATE PROCEDURE Elimina_Elev
@IdElev INT 
AS
SET NOCOUNT ON

UPDATE ELEV SET
IdGrupa = NULL, Activ = 0
WHERE ID = @IdElev


EXECUTE Elimina_Elev 2

select * from ELEV