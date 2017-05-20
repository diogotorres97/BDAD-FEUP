.mode columns
.headers on
.nullvalue NULL

--3. Quais os 3 patrocinios que dao mais dinheiro por campeonato.


-- Mais uma vez capeonato?
SELECT *
FROM Patrocinio
ORDER BY Patrocinio.Valor desc limit 3;
