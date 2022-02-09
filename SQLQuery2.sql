

PRINT  'HELLO WORLD!'

DECLARE @myVariable  INT
SET @myVariable = 6
PRINT @myVariable

DECLARE @var1 INT, @var2 INT
SET @var1 = 7
SET @var2 = 5


PRINT @var1 + @var2

PRINT 'I have '  + CONVERT(VARCHAR(50),@var1) + ' dollars.'


PRINT CHAR(9) + 'Having fun with ' + CHAR(13) + 'some cool technologies'


IF @var1 != 3
	BEGIN
		PRINT'VARIABLE 1 IS NOT ' + CONVERT(VARCHAR(5),@var1) + CHAR(13)
	END
ELSE
	BEGIN
		PRINT'variable 1 IS NOT < ' + CONVERT(VARCHAR(5),@var1) + CHAR(13)
	END


/* this is a comment in SQL */

