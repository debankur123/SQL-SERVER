/*
	Let's say we want to compute the first and last days of the previous months to use a parameter in a query that will return all values from the previous ones in the real world .
*/

DECLARE @Today DATE
SET @Today = CAST(GETDATE() AS DATE)

DECLARE @BOM DATE
SET @BOM = DATEFROMPARTS(YEAR(@Today),MONTH(@Today),1)

DECLARE @PREVBOM DATE
SET @PREVBOM = DATEADD(MONTH,-1,@BOM)
SELECT @PREVBOM

DECLARE @PREVEOM DATE
SET @PREVEOM = DATEADD(DAY,-1,@BOM)
SELECT @PREVEOM
