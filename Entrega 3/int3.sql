.mode columns
.headers on
.nullvalue NULL

--3. Quais os 3 patrocinios que dao mais dinheiro por campeonato.

drop view if exists Temp;

create view Temp as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase
from Atleta, Juri, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Juri.ID = Classificacao.JuriID
  AND
  Juri.CampeonatoID = Campeonato.ID
AND
Classificacao.Fase = 'Eliminatoria');


Select Nome, COUNT(PatrocinioNome) as Counter ,Valor, COUNT(PatrocinioNome)*Valor as Total
from Atleta, AtletaPatrocinio,Patrocinio, Temp
where (Temp.AtletaCC = Atleta.AtletaCC AND
  Atleta.AtletaCC = AtletaPatrocinio.AtletaCC AND AtletaPatrocinio.PatrocinioNome= Patrocinio.Nome)
group by PatrocinioNome
ORDER BY Total desc limit 3;
