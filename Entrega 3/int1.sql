.mode columns
.headers on
.nullvalue NULL

--1. Vencedores do sexo masculino que pertencam a categoria Men's Physique e que sejam patrocinados por Dedicated Division.

Select DISTINCT Atleta.AtletaCC, Pessoa.Nome, Atleta.CategoriaNome, AtletaPatrocinio.PatrocinioNome --, Classificacao.Fase, Classificacao.Pontos
from Atleta, AtletaPatrocinio, Classificacao, Pessoa
where ( Atleta.AtletaCC=Classificacao.AtletaCC AND
 Atleta.AtletaCC = AtletaPatrocinio.AtletaCC
 AND
 Atleta.AtletaCC = Pessoa.CC
 AND
 AtletaPatrocinio.PatrocinioNome = 'Dedicated Division'
 AND
 Atleta.CategoriaNome = 'Men´s Physique'
 AND
 Classificacao.Fase='Final' AND Classificacao.Pontos=0);
