-- Criando as tabelas e seus parametros

CREATE TABLE public.clientes (
	id serial4 NOT NULL,
	nome varchar(50) NULL,
	telefone varchar(20) NULL,
	email varchar(100) NULL,
	endereco text NULL,
	CONSTRAINT clientes_pkey PRIMARY KEY (id)
);

CREATE TABLE public.produtos (
	id int4 DEFAULT nextval('produto_id_seq'::regclass) NOT NULL,
	nome varchar(100) NULL,
	tipo varchar(50) NULL,
	material varchar(100) NULL,
	cor varchar(50) NULL,
	preco_unitario numeric NULL,
	CONSTRAINT produto_pkey PRIMARY KEY (id)
);

CREATE TABLE public.profissionais (
	id serial4 NOT NULL,
	nome varchar(100) NULL,
	funcao varchar(50) NULL,
	telefone varchar(20) NULL,
	CONSTRAINT profissionais_pkey PRIMARY KEY (id)
);

CREATE TABLE public.projetos (
	id serial4 NOT NULL,
	descricao text NULL,
	data_criacao date NULL,
	status varchar(50) NULL,
	cliente_id int4 NULL,
	CONSTRAINT projetos_pkey PRIMARY KEY (id),
	CONSTRAINT projetos_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id)
);

CREATE TABLE public.agendamontagem (
	id serial4 NOT NULL,
	projeto_id int4 NULL,
	data_montagem date NULL,
	profissional_id int4 NULL,
	CONSTRAINT agendamontagem_pkey PRIMARY KEY (id),
	CONSTRAINT agendamontagem_profissional_id_fkey FOREIGN KEY (profissional_id) REFERENCES public.profissionais(id),
	CONSTRAINT agendamontagem_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES public.projetos(id)
);

CREATE TABLE public.ambientes (
	id serial4 NOT NULL,
	nome varchar(100) NULL,
	projeto_id int4 NULL,
	CONSTRAINT ambientes_pkey PRIMARY KEY (id),
	CONSTRAINT ambientes_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES public.projetos(id)
);

CREATE TABLE public.itemprojeto (
	id serial4 NOT NULL,
	projeto_id int4 NULL,
	produto_id int4 NULL,
	quantidade int4 NULL,
	medidas_personalizadas_mm int4 NULL,
	CONSTRAINT itemprojeto_pkey PRIMARY KEY (id),
	CONSTRAINT itemprojeto_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(id),
	CONSTRAINT itemprojeto_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES public.projetos(id)
);

CREATE TABLE public.pagamentos (
	id serial4 NOT NULL,
	projeto_id int4 NULL,
	valor_total numeric(10, 2) NULL,
	forma_pagamento varchar(50) NULL,
	status_pagamento varchar(20) NULL,
	data_pagamento date NULL,
	CONSTRAINT pagamentos_pkey PRIMARY KEY (id),
	CONSTRAINT pagamentos_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES public.projetos(id)
);

-- SELECTS

-- Projetos dos clientes com nome do cliente
SELECT
  p.id,
  p.descricao,
  c.nome AS cliente,
  p.status,
  p.data_criacao
FROM projetos p
JOIN clientes c ON p.cliente_id = c.id
ORDER BY p.data_criacao DESC;

-- Projetos de um cliente específico (exemplo: Felipe Almeida)
SELECT
  p.id,
  p.descricao,
  c.nome AS cliente,
  p.status,
  p.data_criacao
FROM projetos p
JOIN clientes c ON p.cliente_id = c.id
WHERE c.nome ILIKE 'felipe almeida'
ORDER BY p.data_criacao DESC;

-- Projetos por status do projeto
SELECT
  p.id,
  p.descricao,
  c.nome AS cliente,
  p.status,
  p.data_criacao
FROM projetos p
JOIN clientes c ON p.cliente_id = c.id 
WHERE p.status = 'Aguardando aprovação'
ORDER BY p.data_criacao DESC;

-- Projetos por status de pagamento
SELECT
  p.id,
  p.descricao,
  p.status,
  pg.status_pagamento,
  pg.forma_pagamento,
  pg.data_pagamento
FROM projetos p
JOIN pagamentos pg ON pg.projeto_id = p.id
WHERE pg.status_pagamento = 'Pendente'
ORDER BY pg.status_pagamento ASC;

-- Agenda de montagem por profissional
SELECT 
  a.id,
  p.descricao AS projeto,
  a.data_montagem,
  pr.nome AS profissional
FROM agendamontagem a
JOIN projetos p ON p.id = a.projeto_id
JOIN profissionais pr ON pr.id = a.profissional_id
WHERE pr.nome ILIKE 'João%' 
ORDER BY a.data_montagem;

-- Total gasto por cliente (faturamento)
SELECT 
  c.nome AS cliente,
  SUM(pg.valor_total) AS total_gasto
FROM clientes c
JOIN projetos p ON p.cliente_id = c.id
JOIN pagamentos pg ON pg.projeto_id = p.id
GROUP BY c.nome
ORDER BY total_gasto DESC;

-- Produtos mais utilizados nos projetos
SELECT 
  pr.nome AS produto,
  COUNT(ip.id) AS vezes_usado,
  SUM(ip.quantidade) AS quantidade_total
FROM produtos pr
JOIN itemprojeto ip ON ip.produto_id = pr.id
GROUP BY pr.nome
ORDER BY quantidade_total DESC;

