# 🪑 plamove_amb – Banco de Dados Relacional para Empresa de Móveis Planejados

Este projeto foi desenvolvido como parte da disciplina **Experiência Profissional: Banco de Dados Relacional** no curso de **Engenharia de Software** da **UNIASSELVI**, com o objetivo de estruturar uma solução de armazenamento de dados para uma startup do ramo de móveis planejados.

## 👨‍💼 Autor

- **Nome:** Filipe Rocha Santos  
- **Curso:** Engenharia de Software (6749469)  
- **Instituição:** Centro Universitário Leonardo da Vinci – UNIASSELVI  
- **Tutor Externo:** Katyeudo Karlos de Sousa Oliveira

---

## 📌 Objetivo

Criar um banco de dados relacional seguro, eficiente e de fácil manutenção, que centralize informações de clientes, projetos, profissionais, produtos e pagamentos, otimizando os processos internos da empresa **Plamove-Ambientes**.

---

## 🛠️ Tecnologias Utilizadas

- PostgreSQL
- SQL padrão ANSI
- Editor de queries: DBeaver

---

## 🗂️ Estrutura das Tabelas

O banco possui as seguintes entidades:

| Tabela            | Descrição |
|-------------------|-----------|
| `clientes`        | Dados dos clientes da empresa. |
| `produtos`        | Catálogo de produtos planejados. |
| `profissionais`   | Equipe responsável pela execução dos projetos. |
| `projetos`        | Projetos realizados para os clientes. |
| `agendamontagem`  | Agenda de montagem dos projetos. |
| `ambientes`       | Ambientes dentro de um projeto (ex: cozinha, quarto). |
| `itemprojeto`     | Itens (produtos) contidos em cada projeto. |
| `pagamentos`      | Informações de pagamento dos projetos. |

---

## 🔎 Consultas SQL Implementadas

O projeto inclui diversas queries úteis para consulta e análise, como por exemplo:

- 📋 Listagem de projetos com nome do cliente
- 🔍 Filtragem por status do projeto ou pagamento
- 📆 Agenda de montagem por profissional
- 💰 Faturamento total por cliente
- 📊 Produtos mais utilizados nos projetos

---

## 🧠 Estratégia de Desenvolvimento

A modelagem foi baseada em:
- Conversas diretas com representantes da empresa
- Levantamento de requisitos reais e pontos críticos do processo atual
- Análise de padrões adotados por empresas do mesmo setor

---

## ✅ Resultados

O modelo proposto resolve os seguintes problemas enfrentados:
- Redução de inconsistência de dados
- Centralização de informações antes descentralizadas em planilhas
- Facilitação na geração de relatórios e tomada de decisão

---

## 📚 Referências

- Date, C. J. *Introdução a Sistemas de Banco de Dados*. Bookman, 2004.  
- Heuser, C. A. *Projeto de Banco de Dados*. Bookman, 2019.  
- Elmasri, R., Navathe, S. B. *Sistemas de Banco de Dados*. Pearson, 2016.  
- Corrêa, P. L., Silva, F. S. *Modelagem de Dados: Teoria e Prática*. LTC, 2020.  
- Abrantes, C. R. *Banco de Dados para Sistemas Empresariais*. Saraiva Educação, 2021.
