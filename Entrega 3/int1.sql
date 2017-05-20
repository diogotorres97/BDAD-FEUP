.mode columns
.headers on
.nullvalue NULL

--1. Vencedores do sexo masculino que perten�am � categoria Men's Physique e que sejam patrocinados por Dedicated Division.

-- Atleta so se pode inscrever em categorias masculinas? trigger?


Select DISTINCT *
from Atleta, AtletaPatrocinio, Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC AND
 Atleta.AtletaCC = AtletaPatrocinio.AtletaCC
 AND
    AtletaPatrocinio.PatrocinioNome = 'Dedicated Division'
  AND
Atleta.CategoriaNome = 'Men´s Physique'
AND
Classificacao.Fase='Final' AND Classificacao.Pontos=0);
