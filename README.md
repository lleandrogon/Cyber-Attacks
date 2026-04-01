# 🚨 Cyber Attacks Analytics - Projeto dbt

## 📌 Visão Geral

Este projeto foi desenvolvido utilizando o **dbt (Data Build Tool)** com o objetivo de transformar e analisar dados relacionados a **ataques cibernéticos**.

A partir de dados brutos extraídos de arquivos CSV e carregados em um banco **MySQL**, foram construídas camadas analíticas organizadas no padrão:

- **Raw (Fonte)**
- **Staging**
- **intermediate**
- **Mart (Camada final para BI)**

O projeto permite analisar:
- Impactos financeiros de ataques
- Características dos incidentes
- Reação do mercado financeiro

---

## 🧱 Arquitetura do Projeto

```
CSV Files → MySQL (raw) → dbt transformations → Data Marts → BI
```

### 🔹 Fonte de Dados
Os dados foram originalmente obtidos de **3 arquivos CSV**, contendo informações sobre ataques cibernéticos, e posteriormente carregados no schema:

```
cyber_attacks.raw
```

---

## 📂 Tabelas Raw (Fonte)

### 📊 raw_financial_impact
Contém informações financeiras dos ataques cibernéticos:

- Perdas diretas (`direct_loss_usd`)
- Resgates (`ransom_demanded_usd`, `ransom_paid_usd`)
- Custos de recuperação e jurídicos
- Multas regulatórias
- Perda total (`total_loss_usd`)

---

### 🧠 raw_incidents_master
Tabela principal com informações dos incidentes:

- Empresa afetada
- País e setor
- Vetores de ataque
- Dados comprometidos
- Tempo de indisponibilidade
- Qualidade e confiabilidade dos dados

---

### 📈 raw_market_impact
Dados sobre impacto no mercado financeiro:

- Preço das ações antes/depois do incidente
- Retornos anormais (CAR)
- Volume de negociação
- Volatilidade
- Tempo de recuperação do preço

---

## 🏗️ Camada de Transformação (Marts)

Após o tratamento e modelagem com dbt, foram geradas 3 tabelas finais otimizadas para análise:

---

### 💰 mt_financial_impact

Tabela analítica de impacto financeiro dos ataques.

**Principais insights:**
- Identificação dos ataques mais caros
- Análise de ransomwares
- Relação entre perdas e seguros
- Ranking de maiores prejuízos (`rank_total_loss`)

---

### 🧠 mt_incidents_master

Tabela consolidada com dados dos incidentes.

**Principais insights:**
- Setores mais afetados
- Tipos de ataque mais comuns
- Severidade das violações
- Ranking das maiores violações de dados (`rank_largest_breaches`)

---

### 📉 mt_market_impact

Tabela focada na reação do mercado financeiro.

**Principais insights:**
- Impacto imediato nas ações
- Retornos anormais (1d, 7d, 30d)
- Volatilidade antes e depois do incidente
- Ranking das piores reações do mercado

---

## ⚙️ Tecnologias Utilizadas

- dbt
- MySQL
- SQL
- CSV (Data Source)
- Power BI

---

## 🔄 Pipeline de Dados

1. Extração dos dados via CSV  
2. Carga no MySQL (camada raw)  
3. Modelagem com dbt:
   - Limpeza  
   - Padronização  
   - Criação de métricas  
   - Criação de rankings  
4. Geração das tabelas finais (marts)  
5. Consumo por ferramenta de BI  

---

## 🧪 Testes de Qualidade

Foram implementados testes com dbt para garantir a integridade dos dados:

- `not_null`
- `unique`

Principalmente na chave:

```
incident_id
```

---

## 🚀 Como Rodar o Projeto

1. Instale o dbt:
```bash
pip install dbt-core
```

2. Configure o profile do dbt para conectar ao MySQL

3. Execute os modelos:
```bash
dbt run
```

4. Execute os testes:
```bash
dbt test
```

5. Gere a documentação:
```bash
dbt docs generate
dbt docs serve
```

## 📌 Considerações Finais

Este projeto demonstra a construção de um pipeline completo de dados utilizando dbt, desde a ingestão até a disponibilização para análise.

Ele pode ser expandido com:
- Novas fontes de dados  
- Modelos preditivos  
- Dashboards mais avançados