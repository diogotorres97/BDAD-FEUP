--Trigger que impede a insercao de categoria se data categoria e data de campeonato nao forem compativeis


CREATE TRIGGER checkDateCatCampeonato
BEFORE INSERT ON DataCat
FOR EACH ROW
WHEN ( new.DiaElim NOT BETWEEN (Select DataInicio from Campeonato where (Campeonato.ID = new.IDCampeonato))
 AND (Select DataFim from Campeonato where (Campeonato.ID = new.IDCampeonato))
 
OR new.DiaFinal NOT BETWEEN (Select DataInicio from Campeonato where (Campeonato.ID = new.IDCampeonato))
 AND (Select DataFim from Campeonato where (Campeonato.ID = new.IDCampeonato)))

BEGIN
SELECT RAISE(rollback, 'Datas invalidos.');
END;

