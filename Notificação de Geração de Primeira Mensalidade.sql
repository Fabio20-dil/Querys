SELECT COUNT(*) 
FROM pls_lote_mensalidade 
WHERE ie_primeira_mensalidade = 'S'
  AND dt_geracao_titulos IS NULL
  AND dt_atualizacao >= TRUNC(SYSDATE - 30)
-- O presente comando irá buscar todos os lotes de mensalidades que possuam o parâmetro de primeira mensalidade como 'S' e possuam data de geração de título como NULL, da data atual do sistema até 30 dias para trás.


-- comando adicional
SELECT 
       CHR(10) ||
      'CÓDIGO_CONTRATO: ' || b.nr_contrato || CHR(10) ||
      'CONTRATANTE: ' || pls_obter_dados_contrato(a.nr_sequencia, 'E') || CHR(10) ||
      'LOTE: ' || b.nr_sequencia || CHR(10) ||
      'MÊS_REFERENCIA: ' || TO_CHAR(b.dt_mesano_referencia, 'MM/YYYY') || CHR(10) ||
      'VALOR LOTE: ' || TO_CHAR(b.vl_lote, 'FM999G999G990D00', 'NLS_NUMERIC_CHARACTERS='',.''') || CHR(10) ||
      'QUANTIDADE_BENEFICIARIOS: ' || NVL(b.qt_beneficiario_lote, 0) || CHR(10) ||
      '----------------------------------------------------------------------'  || CHR(10) AS MENSAGEM_TEXTO 
FROM pls_contrato a 
INNER JOIN pls_lote_mensalidade b ON a.nr_sequencia = b.nr_seq_contrato
WHERE b.ie_primeira_mensalidade = 'S'
  AND b.dt_geracao_titulos IS NULL
  AND b.dt_atualizacao >= TRUNC(SYSDATE - 30) 