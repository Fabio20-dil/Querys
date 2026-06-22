SELECT
      pls_obter_dados_prestador(b.nr_sequencia,'N' ) AS RAZÃO_SOCIAL
    , pls_obter_cnes_prestador(b.nr_sequencia) CNES
    , CD_CGC AS CNPJ
    , Obter_Valor_Dominio(3256,IE_TIPO_CLASSIF_PTU) as CLASSIFICACAO
    , b.SG_UF_SIP AS UF
    , pls_obter_dados_prestador(b.nr_sequencia,'MA' ) AS MUNICIPIO
    , pls_obter_dados_prestador(b.nr_sequencia,'CLA' ) AS RELACAO_OPERADORA
    , pls_obter_dados_prestador(b.nr_sequencia,'TR' ) AS CONTRATUALIZACAO
    , DT_INICIO_CONTRATO AS DT_CONTRATUALIZACAO
    , b.IE_URGENCIA_EMERGENCIA AS URGENCIA_EMERGENCIA
    , DT_INICIO_SERVICO AS DT_INICIO_SERVICO
    , b.DT_EXCLUSAO AS DT_EXCLUSAO
    , pls_obter_dados_prestador(b.nr_sequencia,'S' ) AS SITUACAO
    , pls_obter_dados_produto(a.nr_seq_plano, 'N')   AS NOME_PRODUTO
    , pls_obter_dados_produto(a.nr_seq_plano, 'PA') AS REGISTRO_ANS
    --, pls_obter_dados_produto(a.nr_seq_plano, 'APD') AS ACOMODACAO
    , pls_obter_dados_produto(a.nr_seq_plano, 'S')   AS SEGMENTACAO
    , b.IE_PUBLICA_ANS AS PUBLICAR_ANS
FROM PLS_PRESTADOR b
INNER JOIN pls_prestador_plano a
ON a.NR_SEQ_PRESTADOR = b.nr_sequencia
--WHERE pls_obter_dados_prestador(b.nr_sequencia,'S' ) = 'A' 