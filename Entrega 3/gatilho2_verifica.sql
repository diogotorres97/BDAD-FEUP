Delete FROM Jurado WHERE JuradoCC = 221811950 AND JuriID = 1;

INSERT INTO Jurado VALUES (221811950, 1);

Select COUNT(*) from Jurado where (Jurado.JuriID = 1);