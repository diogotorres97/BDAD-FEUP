-- Gatilho que impede a inscrição de mais de 4 juris num jurado


CREATE TRIGGER limitJuri
BEFORE INSERT ON Jurado
FOR EACH ROW
WHEN ( 4 >= (Select COUNT(*) from Jurado where (Jurado.JuriID = new.JuriID) ))
BEGIN
SELECT RAISE(rollback, 'Limite de Juris atingido.');
END;