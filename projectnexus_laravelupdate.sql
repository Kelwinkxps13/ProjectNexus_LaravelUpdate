-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31/07/2025 às 13:39
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projectnexus_laravelupdate`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_mauricio.jaborandy@email.com|127.0.0.1', 'i:1;', 1753960597),
('laravel_cache_mauricio.jaborandy@email.com|127.0.0.1:timer', 'i:1753960597;', 1753960597);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_nickname` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `user_id`, `user_nickname`, `created_at`, `updated_at`, `deleted_at`, `name_slug`) VALUES
(1, 'Sociologia Moderna', 'Análise das teorias sociológicas contemporâneas e sua aplicação nos desafios do século XXI', '4a47a0db6e60853dedfcfdf08a5ca249_1753958043.png', 22, 'jpbandeira', '2025-07-30 23:00:01', '2025-07-31 13:34:03', NULL, 'sociologia-moderna'),
(2, 'Movimentos Sociais', 'Estudo dos principais movimentos sociais e suas transformações na era digital', '156005c5baf40ff51a327f1c34f2975b_1753958053.jpg', 22, 'jpbandeira', '2025-07-30 23:00:01', '2025-07-31 13:34:13', NULL, 'movimentos-sociais'),
(3, 'Teorias Clássicas', 'Exploração das bases sociológicas estabelecidas por Durkheim, Marx e Weber', NULL, 2, 'cadu', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'teorias-classicas'),
(4, 'Cultura Urbana', 'Análise dos fenômenos culturais nas grandes metrópoles contemporâneas', NULL, 2, 'cadu', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'cultura-urbana'),
(5, 'Gênero e Sociedade', 'Discussões sobre as relações de gênero e suas implicações sociais', NULL, 7, 'mary', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'genero-sociedade'),
(6, 'Desigualdades', 'Estudo das estruturas que perpetuam desigualdades sociais e econômicas', NULL, 7, 'mary', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'desigualdades'),
(7, 'Segurança Digital', 'Técnicas avançadas de proteção de dados e privacidade online', '6c789dabbbd35bf9a9146d96ef73c48a_1753958257.png', 21, 'mjaborandy', '2025-07-30 23:00:01', '2025-07-31 13:37:37', NULL, 'seguranca-digital'),
(8, 'Ethical Hacking', 'Fundamentos do hacking ético e testes de penetração', '15781e266c036fa81dabef7691dcc6e6_1753958265.jpg', 21, 'mjaborandy', '2025-07-30 23:00:01', '2025-07-31 13:37:45', NULL, 'ethical-hacking'),
(9, 'Programação', 'Linguagens modernas e boas práticas de desenvolvimento', NULL, 10, 'thi', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'programacao'),
(10, 'Cloud Computing', 'Soluções em nuvem e arquitetura de sistemas distribuídos', NULL, 10, 'thi', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'cloud-computing'),
(11, 'Redes Complexas', 'Arquitetura e segurança de redes corporativas', NULL, 12, 'brunim', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'redes-complexas'),
(12, 'IoT Security', 'Desafios de segurança na Internet das Coisas', NULL, 12, 'brunim', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'iot-security'),
(13, 'Pentesting', 'Metodologias avançadas de teste de invasão', NULL, 14, 'dieguito', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'pentesting'),
(14, 'Forensic Analysis', 'Técnicas de análise forense digital', NULL, 14, 'dieguito', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'forensic-analysis'),
(15, 'Criptografia', 'Algoritmos e protocolos de segurança da informação', NULL, 6, 'luquinhas', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'criptografia'),
(16, 'DevSecOps', 'Integração contínua de segurança no DevOps', NULL, 6, 'luquinhas', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'devsecops'),
(17, 'Gramática Avançada', 'Estudo aprofundado da norma culta e variações', '00e80ded1da27b2431159fe85a4041ca_1753959400.png', 23, 'eug', '2025-07-30 23:00:01', '2025-07-31 13:56:40', NULL, 'gramatica-avancada'),
(18, 'Literatura Clássica', 'Análise das obras fundamentais da língua portuguesa', 'c901d80465dbdea2e537bd142cebdbdd_1753959430.jpeg', 23, 'eug', '2025-07-30 23:00:01', '2025-07-31 13:57:10', NULL, 'literatura-classica'),
(19, 'Redação Criativa', 'Técnicas para desenvolvimento de textos autorais', NULL, 3, 'nanda', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'redacao-criativa'),
(20, 'Análise Textual', 'Métodos de interpretação e crítica literária', NULL, 3, 'nanda', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'analise-textual'),
(21, 'Linguística', 'Ciência da linguagem e suas ramificações', NULL, 19, 'lau', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'linguistica'),
(22, 'Ortografia', 'Regras e atualizações do acordo ortográfico', NULL, 19, 'lau', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'ortografia'),
(23, 'Arte Digital', 'Técnicas e tendências da criação artística digital', NULL, 1, 'aninha', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'arte-digital'),
(24, 'Fotografia', 'Composição e técnicas fotográficas avançadas', NULL, 1, 'aninha', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'fotografia'),
(25, 'Ecoturismo', 'Práticas sustentáveis de turismo ecológico', NULL, 4, 'gabi', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'ecoturismo'),
(26, 'Gastronomia', 'Exploração cultural através da culinária local', NULL, 4, 'gabi', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'gastronomia'),
(27, 'Cozinha Molecular', 'Técnicas científicas aplicadas à gastronomia', NULL, 5, 'ju', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'cozinha-molecular'),
(28, 'Panificação Artesanal', 'Métodos tradicionais de fabricação de pães', NULL, 5, 'ju', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'panificacao-artesanal'),
(29, 'Produção Musical', 'Técnicas de gravação e mixagem profissional', NULL, 9, 'rafa', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'producao-musical'),
(30, 'Teoria Musical', 'Fundamentos harmônicos e melódicos', NULL, 9, 'rafa', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'teoria-musical'),
(31, 'Treino Funcional', 'Exercícios para desenvolvimento integral', NULL, 11, 'ali', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'treino-funcional'),
(32, 'Nutrição Esportiva', 'Alimentação para performance e saúde', NULL, 11, 'ali', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'nutricao-esportiva'),
(33, 'Retrato', 'Técnicas avançadas de fotografia de retrato', NULL, 13, 'camilinha', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'retrato'),
(34, 'Fotopintura', 'Processos criativos de manipulação digital', NULL, 13, 'camilinha', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'fotopintura'),
(35, 'Mindfulness', 'Práticas de atenção plena no cotidiano', NULL, 15, 'lis', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'mindfulness'),
(36, 'Yoga Terapêutico', 'Benefícios físicos e mentais do yoga', NULL, 15, 'lis', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'yoga-terapeutico'),
(37, 'Lean Startup', 'Metodologias ágeis para empreendedores', NULL, 16, 'fabim', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'lean-startup'),
(38, 'Pitch Perfect', 'Técnicas de apresentação para investidores', NULL, 16, 'fabim', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'pitch-perfect'),
(39, 'Horta Urbana', 'Cultivo de alimentos em espaços reduzidos', NULL, 18, 'igorzin', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'horta-urbana'),
(40, 'Paisagismo', 'Design e composição de jardins residenciais', NULL, 18, 'igorzin', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'paisagismo'),
(41, 'Plantas Medicinais', 'Cultivo e uso de ervas terapêuticas', NULL, 18, 'igorzin', '2025-07-30 23:00:01', '2025-07-30 23:00:01', NULL, 'plantas-medicinais');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` text DEFAULT NULL,
  `id_commenter` int(11) NOT NULL,
  `id_creator` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `response_to` text DEFAULT NULL,
  `comment_level` int(11) DEFAULT NULL,
  `likes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`likes`)),
  `dislikes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dislikes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `comments`
--

INSERT INTO `comments` (`id`, `created_at`, `updated_at`, `text`, `id_commenter`, `id_creator`, `id_item`, `response_to`, `comment_level`, `likes`, `dislikes`) VALUES
(1, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Excelente explicação sobre TAR! Sempre tive dúvidas sobre como aplicar na análise digital.', 3, 1, 1, NULL, 0, NULL, NULL),
(2, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar Latour, mas o conteúdo está bom no geral.', 5, 1, 1, NULL, 0, NULL, NULL),
(3, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém tem exemplos práticos de uso dessa teoria em redes sociais?', 7, 1, 1, NULL, 0, NULL, NULL),
(4, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto muito denso pra quem está começando, poderia ser mais didático.', 9, 1, 1, NULL, 0, NULL, NULL),
(5, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Adorei como relacionou com a cultura meme! Faz todo sentido.', 2, 1, 2, NULL, 0, NULL, NULL),
(6, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Discordo que estejamos numa fase pós-pós-moderna. Ainda vivemos os mesmos dilemas.', 4, 1, 2, NULL, 0, NULL, NULL),
(7, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótima análise, mas e a questão do neoliberalismo nisso tudo?', 6, 1, 2, NULL, 0, NULL, NULL),
(8, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto perfeito pra entender porque nada faz sentido hoje em dia haha', 8, 1, 2, NULL, 0, NULL, NULL),
(9, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Senti falta de exemplos brasileiros, como os rolezinhos ou ocupações estudantis.', 10, 1, 3, NULL, 0, NULL, NULL),
(10, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Muito relevante! Trabalho com coletivo e essas dicas são valiosas.', 12, 1, 3, NULL, 0, NULL, NULL),
(11, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alerta importante sobre a dependência de plataformas corporativas.', 14, 1, 3, NULL, 0, NULL, NULL),
(12, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Como equilibrar ativismo e privacidade nesse contexto?', 16, 1, 3, NULL, 0, NULL, NULL),
(13, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto necessário! Precisamos falar mais sobre violência digital contra mulheres.', 18, 1, 4, NULL, 0, NULL, NULL),
(14, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém indica coletivos que trabalham com segurança digital feminista?', 20, 1, 4, NULL, 0, NULL, NULL),
(15, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótima análise, mas e as mulheres rurais que não têm acesso à tecnologia?', 3, 1, 4, NULL, 0, NULL, NULL),
(16, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Adorei o tópico sobre apropriação corporativa das causas. Muito real!', 5, 1, 4, NULL, 0, NULL, NULL),
(17, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Explicação clara e direta, ótima para estudantes de sociologia.', 7, 2, 5, NULL, 0, NULL, NULL),
(18, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Como isso se aplica hoje com as fake news? Seriam fatos sociais?', 9, 2, 5, NULL, 0, NULL, NULL),
(19, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Sempre atual, Durkheim explica tanta coisa ainda hoje...', 11, 2, 5, NULL, 0, NULL, NULL),
(20, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Poderia ter mais exemplos contemporâneos, mas o conteúdo é bom.', 13, 2, 5, NULL, 0, NULL, NULL),
(21, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto show! Marx nunca esteve tão atual com os apps de delivery.', 15, 2, 6, NULL, 0, NULL, NULL),
(22, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alienação digital é real... passo 8h no trabalho e mais 4h rolando feed.', 17, 2, 6, NULL, 0, NULL, NULL),
(23, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou aprofundar na questão da mais-valia digital, mas gostei.', 19, 2, 6, NULL, 0, NULL, NULL),
(24, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda livros atuais sobre alienação no século XXI?', 2, 2, 6, NULL, 0, NULL, NULL),
(25, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Amo grafite! Conhecem os trabalhos do Kobra em SP?', 4, 2, 7, NULL, 0, NULL, NULL),
(26, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Legal, mas e quando é pichação? Também consideram arte?', 6, 2, 7, NULL, 0, NULL, NULL),
(27, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar do grafite feminino, tem muita mina fazendo trabalho incrível!', 8, 2, 7, NULL, 0, NULL, NULL),
(28, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótimo texto pra mostrar pra quem acha que grafite é vandalismo.', 10, 2, 7, NULL, 0, NULL, NULL),
(29, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Saudades da época do Orkut que dava pra identificar as tribos pelos grupos haha', 12, 2, 8, NULL, 0, NULL, NULL),
(30, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'E as tribos digitais? Seria o pessoal do TikTok uma nova tribo?', 14, 2, 8, NULL, 0, NULL, NULL),
(31, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto meio generalista, mas faz um bom panorama inicial.', 16, 2, 8, NULL, 0, NULL, NULL),
(32, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém lembra dos emos? Era a melhor tribo!', 18, 2, 8, NULL, 0, NULL, NULL),
(33, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Importante falar sobre a solidão na comunidade LGBTQ+, ninguém comenta disso.', 20, 3, 9, NULL, 0, NULL, NULL),
(34, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Sinto que faltou abordar mais a questão trans, que é tão urgente!', 3, 3, 9, NULL, 0, NULL, NULL),
(35, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Apps de relacionamento são uma benção e uma maldição ao mesmo tempo...', 5, 3, 9, NULL, 0, NULL, NULL),
(36, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto necessário! Precisamos falar mais sobre saúde mental LGBTQ+', 7, 3, 9, NULL, 0, NULL, NULL),
(37, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Por mais textos como esse! Interseccionalidade é fundamental.', 9, 3, 10, NULL, 0, NULL, NULL),
(38, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Conheçam o trabalho da Sueli Carneiro, referência nesse tema!', 11, 3, 10, NULL, 0, NULL, NULL),
(39, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar mais sobre empreendedorismo negro feminino', 13, 3, 10, NULL, 0, NULL, NULL),
(40, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Como homem branco, esse texto me fez refletir muito. Obrigado!', 15, 3, 10, NULL, 0, NULL, NULL),
(41, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto difícil mas necessário. Reconhecer privilégios é o primeiro passo.', 17, 3, 11, NULL, 0, NULL, NULL),
(42, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém tem dicas de como usar meu privilégio para ajudar?', 19, 3, 11, NULL, 0, NULL, NULL),
(43, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Já vi gente se doendo com esse tema... é sempre bom reforçar.', 2, 3, 11, NULL, 0, NULL, NULL),
(44, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar o privilégio da branquitude no mercado de trabalho', 4, 3, 11, NULL, 0, NULL, NULL),
(45, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Dados assustadores sobre o Brasil... 9 gerações é muita coisa!', 6, 3, 12, NULL, 0, NULL, NULL),
(46, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'E como fica a mobilidade com a automação dos empregos?', 8, 3, 12, NULL, 0, NULL, NULL),
(47, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto bom, mas poderia sugerir políticas públicas concretas', 10, 3, 12, NULL, 0, NULL, NULL),
(48, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Minha família é prova que educação quebra esse ciclo!', 12, 3, 12, NULL, 0, NULL, NULL),
(49, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Uso VPN diariamente, essas dicas de segurança foram ótimas!', 14, 4, 13, NULL, 0, NULL, NULL),
(50, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda um provedor confiável? Os grátis são furada?', 16, 4, 13, NULL, 0, NULL, NULL),
(51, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar sobre a nova lei de dados na Europa e como VPNs ajudam', 18, 4, 13, NULL, 0, NULL, NULL),
(52, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótimo conteúdo! VPN deveria ser item básico de segurança', 20, 4, 13, NULL, 0, NULL, NULL),
(53, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Depois que comecei a usar 2FA nunca mais tive conta invadida!', 3, 4, 14, NULL, 0, NULL, NULL),
(54, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Odeio quando sites só oferecem 2FA por SMS... é tão inseguro!', 5, 4, 14, NULL, 0, NULL, NULL),
(55, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Comprei um YubiKey e mudou minha vida digital, recomendo!', 7, 4, 14, NULL, 0, NULL, NULL),
(56, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto bom pra mostrar pra quem ainda não ativou 2FA em nada', 9, 4, 14, NULL, 0, NULL, NULL),
(57, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Estudando para o OSCP e esse material ajudou demais!', 11, 4, 15, NULL, 0, NULL, NULL),
(58, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar ferramentas como Nessus e OpenVAS', 13, 4, 15, NULL, 0, NULL, NULL),
(59, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém tem dicas de laboratórios pra praticar?', 15, 4, 15, NULL, 0, NULL, NULL),
(60, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótima introdução ao tema! Pentest é fascinante', 17, 4, 15, NULL, 0, NULL, NULL),
(61, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Todo dev deveria decorar essa lista! Salvou meus projetos várias vezes', 19, 4, 16, NULL, 0, NULL, NULL),
(62, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Injection ainda no topo depois de tantos anos... triste', 2, 4, 16, NULL, 0, NULL, NULL),
(63, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém explica como proteger contra SSRF em APIs?', 4, 4, 16, NULL, 0, NULL, NULL),
(64, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Material essencial pra quem trabalha com desenvolvimento web', 6, 4, 16, NULL, 0, NULL, NULL),
(65, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Depois que comecei a aplicar esses princípios, meu código ficou 200% melhor', 8, 5, 17, NULL, 0, NULL, NULL),
(66, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Livro do Uncle Bob é bíblia pra qualquer programador', 10, 5, 17, NULL, 0, NULL, NULL),
(67, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Meu chefe precisa ler isso... o código aqui é uma bagunça!', 12, 5, 17, NULL, 0, NULL, NULL),
(68, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém tem exemplos de antes/depois aplicando clean code?', 14, 5, 17, NULL, 0, NULL, NULL),
(69, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Pattern matching em Python 3.10 mudou minha vida!', 16, 5, 18, NULL, 0, NULL, NULL),
(70, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar sobre type hints e mypy, essenciais hoje em dia', 18, 5, 18, NULL, 0, NULL, NULL),
(71, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Python continua sendo a melhor linguagem pra prototipar rápido', 20, 5, 18, NULL, 0, NULL, NULL),
(72, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém já usou o PyScript? Vale a pena?', 3, 5, 18, NULL, 0, NULL, NULL),
(73, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'AWS tá cobrando meu rim... alguém tem dicas pra reduzir custo?', 5, 5, 19, NULL, 0, NULL, NULL),
(74, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'EC2 + S3 é o básico que todo mundo deveria aprender', 7, 5, 19, NULL, 0, NULL, NULL),
(75, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar o free tier e suas limitações', 9, 5, 19, NULL, 0, NULL, NULL),
(76, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Material ótimo pra quem tá começando na nuvem!', 11, 5, 19, NULL, 0, NULL, NULL),
(77, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Lambda + API Gateway é minha stack favorita pra APIs simples', 13, 5, 20, NULL, 0, NULL, NULL),
(78, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Cold start ainda é o maior problema... como vocês contornam?', 15, 5, 20, NULL, 0, NULL, NULL),
(79, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Serverless economiza tanto tempo de deploy, não volto atrás!', 17, 5, 20, NULL, 0, NULL, NULL),
(80, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém já comparou custos serverless vs containers em longo prazo?', 19, 5, 20, NULL, 0, NULL, NULL),
(81, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Implementamos na empresa e reduziu nossos custos com MPLS em 40%!', 2, 6, 21, NULL, 0, NULL, NULL),
(82, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém compara Cisco SD-WAN vs Fortinet? Tô na dúvida', 4, 6, 21, NULL, 0, NULL, NULL),
(83, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar o impacto do 5G nessa tecnologia', 6, 6, 21, NULL, 0, NULL, NULL),
(84, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótimo overview! SD-WAN tá revolucionando redes corporativas', 8, 6, 21, NULL, 0, NULL, NULL),
(85, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Implementei ZTNA na empresa e os usuários reclamam demais... vale a pena?', 10, 6, 22, NULL, 0, NULL, NULL),
(86, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'BeyondCorp do Google é o melhor modelo pra seguir', 12, 6, 22, NULL, 0, NULL, NULL),
(87, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém já testou a solução da Cloudflare?', 14, 6, 22, NULL, 0, NULL, NULL),
(88, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Zero Trust deveria ser padrão em qualquer empresa hoje', 16, 6, 22, NULL, 0, NULL, NULL),
(89, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Minha casa toda é automatizada com Home Assistant! Vida mudou', 18, 6, 23, NULL, 0, NULL, NULL),
(90, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Cuidado com dispositivos chineses... já viram os relatos de spyware?', 20, 6, 23, NULL, 0, NULL, NULL),
(91, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar do Matter, novo padrão que vai unificar tudo', 3, 6, 23, NULL, 0, NULL, NULL),
(92, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda fechaduras inteligentes confiáveis?', 5, 6, 23, NULL, 0, NULL, NULL),
(93, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'MQTT é vida pra quem trabalha com IoT industrial!', 7, 6, 24, NULL, 0, NULL, NULL),
(94, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém já usou LoRaWAN em projetos urbanos? Como foi?', 9, 6, 24, NULL, 0, NULL, NULL),
(95, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar o desafio de baterias em dispositivos IoT', 11, 6, 24, NULL, 0, NULL, NULL),
(96, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótima comparação! Escolher protocolo certo faz toda diferença', 13, 6, 24, NULL, 0, NULL, NULL),
(97, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Metasploit + Burp Suite é o kit básico do pentester!', 15, 7, 25, NULL, 0, NULL, NULL),
(98, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda módulos pra testar APIs REST?', 17, 7, 25, NULL, 0, NULL, NULL),
(99, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Cuidado com scans agressivos sem autorização! Já tomei block', 19, 7, 25, NULL, 0, NULL, NULL),
(100, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Pro version vale o investimento pra quem trabalha na área', 2, 7, 25, NULL, 0, NULL, NULL),
(101, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Burp Pro é caro mas não tem igual pra testar aplicações web', 4, 7, 26, NULL, 0, NULL, NULL),
(102, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém sabe configurar o Collaborator direito? Nunca consegui', 6, 7, 26, NULL, 0, NULL, NULL),
(103, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Community edition já salva em muitos testes básicos', 8, 7, 26, NULL, 0, NULL, NULL),
(104, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Intruder é minha ferramenta favorita! Brute force inteligente', 10, 7, 26, NULL, 0, NULL, NULL),
(105, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Volatility salvou minha vida em vários incidentes de segurança!', 12, 7, 27, NULL, 0, NULL, NULL),
(106, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém tem dicas pra analisar dumps de sistemas Linux?', 14, 7, 27, NULL, 0, NULL, NULL),
(107, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar técnicas anti-forense que dificultam análise', 16, 7, 27, NULL, 0, NULL, NULL),
(108, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótimo material pra quem tá começando em forense digital', 18, 7, 27, NULL, 0, NULL, NULL),
(109, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Já perdi caso por falha na cadeia de custódia... aprendi na dor', 20, 7, 28, NULL, 0, NULL, NULL),
(110, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Blockchain pra documentar evidências é o futuro!', 3, 7, 28, NULL, 0, NULL, NULL),
(111, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda software pra gerenciar isso em grandes casos?', 5, 7, 28, NULL, 0, NULL, NULL),
(112, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Material essencial pra qualquer profissional de TI forense', 7, 7, 28, NULL, 0, NULL, NULL),
(113, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Padrão ouro em criptografia! Confio meu banco de dados a ele', 9, 8, 29, NULL, 0, NULL, NULL),
(114, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém explica a diferença prática entre AES-128 e 256?', 11, 8, 29, NULL, 0, NULL, NULL),
(115, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Implementação correta é tão importante quanto o algoritmo', 13, 8, 29, NULL, 0, NULL, NULL),
(116, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto bom pra mostrar pra quem ainda usa RSA pra tudo', 15, 8, 29, NULL, 0, NULL, NULL),
(117, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'RSA ainda tem seu lugar, mas ECC é o futuro!', 17, 8, 30, NULL, 0, NULL, NULL),
(118, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém já implementou RSA em microcontroladores? Como foi?', 19, 8, 30, NULL, 0, NULL, NULL),
(119, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar sobre tamanhos de chave mínimos recomendados hoje', 2, 8, 30, NULL, 0, NULL, NULL),
(120, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótima explicação sobre os fundamentos matemáticos!', 4, 8, 30, NULL, 0, NULL, NULL),
(121, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'SonarQube + ESLint é meu combo favorito pra análise estática', 6, 8, 31, NULL, 0, NULL, NULL),
(122, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém compara Checkmarx vs Fortify? Tô avaliando pra empresa', 8, 8, 31, NULL, 0, NULL, NULL),
(123, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Falsos positivos são o maior problema... gastamos horas verificando', 10, 8, 31, NULL, 0, NULL, NULL),
(124, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'SAST deveria ser obrigatório em qualquer pipeline de dev', 12, 8, 31, NULL, 0, NULL, NULL),
(125, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'GitHub Actions com step de segurança é vida!', 14, 8, 32, NULL, 0, NULL, NULL),
(126, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém já sofreu ataque na pipeline? Como se proteger?', 16, 8, 32, NULL, 0, NULL, NULL),
(127, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar a importância de secrets management', 18, 8, 32, NULL, 0, NULL, NULL),
(128, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótimo guia pra quem tá começando com DevOps seguro', 20, 8, 32, NULL, 0, NULL, NULL),
(129, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Nossa, sempre errava \"aspirar a\" vs \"aspirar\"! Obrigado', 3, 9, 33, NULL, 0, NULL, NULL),
(130, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém tem uma tabela com os principais verbos e suas regências?', 5, 9, 33, NULL, 0, NULL, NULL),
(131, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou o clássico \"namorar com\" que todo mundo erra', 7, 9, 33, NULL, 0, NULL, NULL),
(132, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto perfeito pra tirar dúvidas de português', 9, 9, 33, NULL, 0, NULL, NULL),
(133, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Nunca vou decorar todas as regras de crase haha', 11, 9, 34, NULL, 0, NULL, NULL),
(134, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Dica: substituir por \"ao\" é o melhor macete mesmo!', 13, 9, 34, NULL, 0, NULL, NULL),
(135, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar de casos polêmicos como \"à medida que\"', 15, 9, 34, NULL, 0, NULL, NULL),
(136, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Crase é o terror dos concurseiros! Ótimo material', 17, 9, 34, NULL, 0, NULL, NULL),
(137, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Dom Casmurro é genial! Capitu traiu ou não traiu?', 19, 9, 35, NULL, 0, NULL, NULL),
(138, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda por onde começar em Machado?', 2, 9, 35, NULL, 0, NULL, NULL),
(139, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar do conto \"O Alienista\", meu favorito!', 4, 9, 35, NULL, 0, NULL, NULL),
(140, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Machado era à frente do seu tempo, impressionante', 6, 9, 35, NULL, 0, NULL, NULL),
(141, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'A Hora da Estrela me marcou profundamente... que livro!', 8, 9, 36, NULL, 0, NULL, NULL),
(142, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém entendeu Perto do Coração Selvagem? Confesso que sofri', 10, 9, 36, NULL, 0, NULL, NULL),
(143, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar as crônicas dela, tão boas quanto os romances', 12, 9, 36, NULL, 0, NULL, NULL),
(144, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Clarice é única! Ninguém escreve como ela', 14, 9, 36, NULL, 0, NULL, NULL),
(145, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Essa técnica transformou minha escrita! Difícil no começo mas vale a pena', 16, 10, 37, NULL, 0, NULL, NULL),
(146, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém tem exemplos bons de antes/depois aplicando isso?', 18, 10, 37, NULL, 0, NULL, NULL),
(147, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar que às vezes \"tell\" também é necessário', 20, 10, 37, NULL, 0, NULL, NULL),
(148, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Dica que todo escritor iniciante precisa ouvir', 3, 10, 37, NULL, 0, NULL, NULL),
(149, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Tentei escrever assim uma vez e ficou horrível haha difícil demais!', 5, 10, 38, NULL, 0, NULL, NULL),
(150, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Clarice Lispector é a mestra absoluta dessa técnica', 7, 10, 38, NULL, 0, NULL, NULL),
(151, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar Ulysses do Joyce, o auge do estilo', 9, 10, 38, NULL, 0, NULL, NULL),
(152, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ótima explicação sobre essa técnica complexa', 11, 10, 38, NULL, 0, NULL, NULL),
(153, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Adoro quando identifico referências em livros e filmes!', 13, 10, 39, NULL, 0, NULL, NULL),
(154, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda obras com intertextualidade bem feita?', 15, 10, 39, NULL, 0, NULL, NULL),
(155, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar de fanfiction, que é pura intertextualidade', 17, 10, 39, NULL, 0, NULL, NULL),
(156, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Todo texto é um palimpsesto, como dizia Barthes!', 19, 10, 39, NULL, 0, NULL, NULL),
(157, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Estudando isso na faculdade e tá abrindo minha mente!', 2, 10, 40, NULL, 0, NULL, NULL),
(158, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda livros introdutórios sobre o tema?', 4, 10, 40, NULL, 0, NULL, NULL),
(159, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar a importância do narrador não-confiável', 6, 10, 40, NULL, 0, NULL, NULL),
(160, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Análise narrativa é essencial pra qualquer escritor', 8, 10, 40, NULL, 0, NULL, NULL),
(161, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Amo como a linguagem reflete a sociedade!', 10, 11, 41, NULL, 0, NULL, NULL),
(162, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém estuda variação linguística no Brasil?', 12, 11, 41, NULL, 0, NULL, NULL),
(163, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar mais sobre preconceito linguístico', 14, 11, 41, NULL, 0, NULL, NULL),
(164, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto ótimo pra entender porque não existe \"português errado\"', 16, 11, 41, NULL, 0, NULL, NULL),
(165, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Sou fono e esse material está muito bem explicado!', 18, 11, 42, NULL, 0, NULL, NULL),
(166, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém explica a diferença entre fonética e fonologia?', 20, 11, 42, NULL, 0, NULL, NULL),
(167, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar os sotaques regionais brasileiros', 3, 11, 42, NULL, 0, NULL, NULL),
(168, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Pra quem quer aprender línguas, entender fonética ajuda muito', 5, 11, 42, NULL, 0, NULL, NULL),
(169, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Ainda erro quando usar hífen... alguém decifrou as regras?', 7, 11, 43, NULL, 0, NULL, NULL),
(170, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Odeio que tiraram o trema! Como fica \"saüdade\"?', 9, 11, 43, NULL, 0, NULL, NULL),
(171, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar que algumas palavras têm duas grafias aceitas', 11, 11, 43, NULL, 0, NULL, NULL),
(172, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Depois de 10 anos ainda não me acostumei totalmente', 13, 11, 43, NULL, 0, NULL, NULL),
(173, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Detesto quando usam \"meeting\" em vez de reunião!', 15, 11, 44, NULL, 0, NULL, NULL),
(174, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém sabe a origem de \"xerox\" no Brasil?', 17, 11, 44, NULL, 0, NULL, NULL),
(175, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar dos estrangeirismos que já viraram brasileirismos', 19, 11, 44, NULL, 0, NULL, NULL),
(176, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Língua é viva, vai absorver influências e tá tudo bem', 2, 11, 44, NULL, 0, NULL, NULL),
(177, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Uso Photoshop há 10 anos e ainda aprendo coisas novas!', 4, 12, 45, NULL, 0, NULL, NULL),
(178, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda tutoriais bons pra iniciantes?', 6, 12, 45, NULL, 0, NULL, NULL),
(179, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar o poder das máscaras de camada', 8, 12, 45, NULL, 0, NULL, NULL),
(180, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Dica: aprendam atalhos de teclado, economiza horas!', 10, 12, 45, NULL, 0, NULL, NULL),
(181, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Amo pixel art! Tô fazendo meus primeiros sprites', 12, 12, 46, NULL, 0, NULL, NULL),
(182, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda paletas de cores pra iniciantes?', 14, 12, 46, NULL, 0, NULL, NULL),
(183, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar o Aseprite, melhor software pra isso', 16, 12, 46, NULL, 0, NULL, NULL),
(184, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Pixel art tem um charme que gráficos 3D não conseguem', 18, 12, 46, NULL, 0, NULL, NULL),
(185, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Uso isso em todas minhas fotos e faz diferença demais!', 20, 12, 47, NULL, 0, NULL, NULL),
(186, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém tem dicas pra quebrar a regra com estilo?', 3, 12, 47, NULL, 0, NULL, NULL),
(187, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar a proporção áurea, que é similar', 5, 12, 47, NULL, 0, NULL, NULL),
(188, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Dica básica mas que transforma qualquer composição', 7, 12, 47, NULL, 0, NULL, NULL),
(189, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Fotos de cachoeira com efeito seda são minhas favoritas!', 9, 12, 48, NULL, 0, NULL, NULL),
(190, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda filtros ND bons e baratos?', 11, 12, 48, NULL, 0, NULL, NULL),
(191, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar light painting, que é super divertido', 13, 12, 48, NULL, 0, NULL, NULL),
(192, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Dica: usem timer ou controle remoto pra evitar tremidas', 15, 12, 48, NULL, 0, NULL, NULL),
(193, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Viajo sempre pensando no impacto, ótimo texto!', 17, 13, 49, NULL, 0, NULL, NULL),
(194, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda destinos sustentáveis no Brasil?', 19, 13, 49, NULL, 0, NULL, NULL),
(195, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar sobre compensação de carbono em voos', 2, 13, 49, NULL, 0, NULL, NULL),
(196, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Turismo consciente é o futuro!', 4, 13, 49, NULL, 0, NULL, NULL),
(197, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Precisamos proteger nossos biomas! Tão ricos e ameaçados', 6, 13, 50, NULL, 0, NULL, NULL),
(198, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém já visitou o Pantanal? É minha próxima meta', 8, 13, 50, NULL, 0, NULL, NULL),
(199, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar os manguezais, tão importantes!', 10, 13, 50, NULL, 0, NULL, NULL),
(200, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Texto ótimo pra conscientização ambiental', 12, 13, 50, NULL, 0, NULL, NULL),
(201, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Pastel de feira é a melhor invenção brasileira!', 14, 13, 51, NULL, 0, NULL, NULL),
(202, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém conhece bons food trucks em SP?', 16, 13, 51, NULL, 0, NULL, NULL),
(203, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar o acarajé baiano, patrimônio cultural', 18, 13, 51, NULL, 0, NULL, NULL),
(204, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Comida de rua mostra a verdadeira cultura de um lugar', 20, 13, 51, NULL, 0, NULL, NULL),
(205, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Amo sushi com manga! Combinação perfeita', 3, 13, 52, NULL, 0, NULL, NULL),
(206, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém recomenda restaurantes de fusão no RJ?', 5, 13, 52, NULL, 0, NULL, NULL),
(207, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou falar da culinária nikkei, minha favorita', 7, 13, 52, NULL, 0, NULL, NULL),
(208, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Fusão feita com respeito às culturas originais é incrível', 9, 13, 52, NULL, 0, NULL, NULL),
(209, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Comi numa casa molecular e foi experiência única!', 11, 14, 53, NULL, 0, NULL, NULL),
(210, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Alguém tentou fazer em casa? Dá muito trabalho?', 13, 14, 53, NULL, 0, NULL, NULL),
(211, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Faltou mencionar o risco de asfixia com as esferas', 15, 14, 53, NULL, 0, NULL, NULL),
(212, '2025-07-31 00:02:29', '2025-07-31 00:02:29', 'Gastronomia molecular é arte e ciência juntas', 17, 14, 53, NULL, 0, NULL, NULL),
(213, '2025-07-31 03:48:17', '2025-07-31 03:48:17', 'corna', 24, 22, 1, '1', 1, '[]', '[]'),
(214, '2025-07-31 03:48:26', '2025-07-31 03:48:26', 'ksksksks', 24, 22, 1, '213', 2, '[]', '[]'),
(215, '2025-07-31 14:02:34', '2025-07-31 14:02:34', 'traiu kkkkkk', 23, 23, 35, '137', 1, '[]', '[]'),
(216, '2025-07-31 14:09:54', '2025-07-31 14:09:54', 'eu tenho, dps te passo', 23, 23, 33, '130', 1, '[]', '[]'),
(217, '2025-07-31 14:10:13', '2025-07-31 14:10:13', 'kkkkkkkk pior', 23, 23, 33, '131', 1, '[]', '[]'),
(218, '2025-07-31 14:13:05', '2025-07-31 14:13:05', 'blz chapa', 5, 23, 33, '216', 2, '[]', '[]'),
(219, '2025-07-31 14:32:13', '2025-07-31 14:32:13', 'recomendo a Kaspersky (sei la como se escreve)', 21, 21, 13, '50', 1, '[]', '[]'),
(220, '2025-07-31 14:33:11', '2025-07-31 14:33:11', 'eu nao gosto muito de vpn nao, e nao acho essencial. tipo sei la, acho que meio que roubam seus dados ou algo do tipo', 21, 21, 13, '52', 1, '[]', '[]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `contents`
--

INSERT INTO `contents` (`id`, `name`, `description`, `image`, `item_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Introdução', 'A Teoria Ator-Rede (TAR), desenvolvida por Bruno Latour e Michel Callon, propõe uma abordagem simétrica para analisar as relações entre humanos e não-humanos na construção de redes sociais. Esta teoria desafia as dicotomias tradicionais entre sujeito/objeto e natureza/cultura, enfatizando como atores humanos e não-humanos se associam para formar redes estáveis. Na sociedade contemporânea, podemos observar essa teoria em ação ao analisar como plataformas digitais, algoritmos e dispositivos técnicos se tornam atores fundamentais nas dinâmicas sociais.', NULL, 1, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(2, 'Conceitos-chave', 'Os principais conceitos da TAR incluem: ator-rede (que considera tanto humanos quanto não-humanos como atores), tradução (processo pelo qual os atores se alinham em redes), inscrição (como as relações se estabilizam em artefatos), e caixa-preta (quando as redes se tornam tão estáveis que sua complexidade interna é esquecida). Esses conceitos nos ajudam a entender fenômenos como as redes sociais digitais, onde plataformas técnicas modificam profundamente o comportamento humano.', NULL, 1, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(3, 'Aplicações', 'Na prática, a TAR tem sido aplicada para estudar desde controvérsias científicas até o desenvolvimento de tecnologias. Por exemplo, podemos analisar como um aplicativo de mobilidade urbana reconfigura as relações entre passageiros, motoristas, reguladores e a infraestrutura da cidade. A teoria nos permite mapear essas associações complexas sem privilegiar explicações puramente sociais ou técnicas.', NULL, 1, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(4, 'Críticas', 'Apesar de inovadora, a TAR recebe críticas por seu relativismo radical e por dificultar a análise de estruturas de poder estáveis. Alguns sociólogos argumentam que a teoria negligencia o papel das desigualdades estruturais ao tratar todos os atores como simétricos. Outros questionam se objetos técnicos podem realmente ter \"agência\" no mesmo sentido que os humanos.', NULL, 1, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(5, 'Definição', 'A pós-modernidade representa uma ruptura com os grandes relatos modernos como progresso, razão absoluta e verdades universais. Pensadores como Lyotard, Baudrillard e Foucault argumentam que vivemos em uma era de fragmentação, simulacros e desconfiança em metanarrativas. Na cultura, isso se manifesta no pastiche, na ironia e no colapso de hierarquias entre alta cultura e cultura popular. Socialmente, reflete-se na crise das instituições tradicionais e na multiplicação de identidades fluidas.', NULL, 2, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(6, 'Características', 'Entre as principais características da condição pós-moderna estão: a desmaterialização (substituição do real por signos), a temporalidade fragmentada, o fim das utopias políticas totais, a estetização da vida cotidiana, e o predomínio da cultura do espetáculo. A internet e as mídias digitais aceleraram muitas dessas tendências, criando um mundo de realidades virtuais e identidades múltiplas.', 'c901d80465dbdea2e537bd142cebdbdd_1753961828.jpeg', 2, '2025-07-30 23:34:27', '2025-07-31 14:37:08', NULL),
(7, 'Impacto Social', 'Na sociedade pós-moderna, observamos a erosão de autoridades tradicionais (como escola, família, Estado), a mercantilização de todas as esferas da vida, e o surgimento de novas formas de sociabilidade baseadas em redes digitais. Isso gera tanto novas liberdades quanto novas formas de controle, como o capitalismo de vigilância e a governamentalidade algorítmica.', NULL, 2, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(8, 'Debates Atuais', 'Atualmente, discute-se se já teríamos entrado em uma fase \"pós-pós-moderna\" ou se a pós-modernidade se aprofundou. Alguns teóricos argumentam que crises globais como mudanças climáticas e pandemias estão levando a um retorno de narrativas totalizantes, enquanto outros veem na cultura meme e na realidade pós-verdade a radicalização da condição pós-moderna.', '71c155491c879ef37e3e8cf58132347f_1753961838.jpeg', 2, '2025-07-30 23:34:27', '2025-07-31 14:37:18', NULL),
(9, 'Novas Formas', 'O ativismo digital transformou radicalmente as práticas de mobilização social, permitindo ações globais coordenadas em tempo real. Plataformas como Twitter e Telegram tornaram-se espaços de organização, enquanto táticas como hacktivismo e hashtag activism criam novas formas de pressão política. Movimentos como Primavera Árabe, Occupy e Black Lives Matter demonstraram o poder dessas ferramentas, mas também revelaram seus limites frente à repressão estatal e à vigilância digital.', 'ac2e9e98d9374eb4a4f500e7bee3ad40_1753961863.jpg', 3, '2025-07-30 23:34:27', '2025-07-31 14:37:43', NULL),
(10, 'Ferramentas', 'Ativistas contemporâneos utilizam um arsenal digital que inclui: criptografia para comunicação segura (Signal, PGP), plataformas de financiamento coletivo, ferramentas de verificação de fatos, mapas colaborativos de protestos, e tecnologias de anonimização como Tor. Essas ferramentas permitem contornar censuras, mas também criam dependência de corporações tecnológicas cujos interesses nem sempre alinham-se com as causas ativistas.', NULL, 3, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(11, 'Desafios', 'Entre os principais desafios do ativismo digital estão: a vigilância estatal e corporativa, a desinformação e deepfakes usados para descreditar movimentos, a \"slacktivism\" (ativismo de baixo comprometimento), e a dificuldade de traduzir engajamento online em mudanças estruturais offline. Além disso, a infraestrutura digital consome recursos naturais e depende de cadeias produtivas exploratórias, criando contradições éticas.', NULL, 3, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(12, 'Casos de Estudo', 'Podemos analisar casos como: o uso do WhatsApp nas eleições brasileiras, o papel do TikTok em protestos globais, a censura a ativistas na China através do Great Firewall, e as táticas do Anonymous. Cada caso revela diferentes facetas das possibilidades e limitações do ativismo na era digital, mostrando como a tecnologia amplifica tanto a resistência quanto o controle.', NULL, 3, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(13, 'Evolução Histórica', 'O chamado Feminismo 4.0 representa a quarta onda do movimento, caracterizada pela interseccionalidade radical e pelo uso intensivo de tecnologias digitais. Se a primeira onda lutou por direitos básicos, a segunda pela libertação sexual, e a terceira pela diversidade, a quarta onda enfrenta desafios como assédio online, deepnudes, algoritmos sexistas e a violência digital de gênero. Plataformas como Twitter tornaram-se arenas de disputa, com hashtags como #MeToo ganhando escala global.', NULL, 4, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(14, 'Táticas Atuais', 'As feministas 4.0 desenvolvem táticas inovadoras como: criação de redes de apoio online, desenvolvimento de apps contra violência, uso de data activism para expor desigualdades, pressão sobre plataformas digitais para moderar conteúdo misógino, e produção de contra-narrativas em formatos como podcasts e threads. A luta agora inclui a governança da internet e o direito ao esquecimento digital para vítimas.', NULL, 4, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(15, 'Críticas', 'Alguns setores criticam o Feminismo 4.0 por seu excessivo foco no cultural em detrimento do econômico, por gerar polarizações improdutivas em redes sociais, e por depender de plataformas capitalistas que lucram com o conflito. Outros apontam que o movimento ainda não conseguiu incluir adequadamente mulheres de classes baixas e regiões periféricas do globo, reproduzindo privilégios digitais.', NULL, 4, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(16, 'Futuro', 'Os desafios futuros incluem: regular a inteligência artificial sexista, combater a violência digital transfeminista, criar alternativas tecnológicas feministas fora das Big Techs, e articular o online com lutas por direitos reprodutivos, igualdade salarial e divisão sexual do trabalho. O feminismo precisa hackear o sistema tecnopatriarcal sem ser cooptado por ele.', NULL, 4, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(17, 'Fato Social', 'Para Durkheim, fatos sociais são maneiras de agir, pensar e sentir exteriores ao indivíduo, dotadas de poder coercitivo. Eles existem independentemente das vontades individuais e se impõem através de sanções ou constrangimentos. Exemplos incluem normas jurídicas, costumes morais e até mesmo formas de linguagem. Na era digital, podemos pensar em algoritmos de redes sociais como novos fatos sociais que moldam nosso comportamento.', NULL, 5, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(18, 'Características', 'Durkheim estabeleceu três características dos fatos sociais: exterioridade (existem fora da consciência individual), coercitividade (exercem pressão sobre os indivíduos), e generalidade (são coletivos, não particulares). Esses critérios nos ajudam a distinguir fenômenos verdadeiramente sociais de meros comportamentos individuais agregados.', NULL, 5, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(19, 'Método', 'O estudo dos fatos sociais exige, segundo Durkheim, que o sociólogo trate os fenômenos sociais como \"coisas\", ou seja, com objetividade científica, livre de preconceitos. Isso implica afastar-se das pré-noções, definir claramente os fatos estudados, e buscar explicações sociais para fenômenos sociais, não reduzi-los a explicações psicológicas ou biológicas.', NULL, 5, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(20, 'Atualidade', 'O conceito de fato social permanece relevante para analisar fenômenos contemporâneos como viralizações digitais, padrões de consumo globalizados, ou a adesão a modismos tecnológicos. As plataformas digitais criam novas formas de coercitividade social, como os algoritmos que padronizam comportamentos ou a pressão por constante engajamento online.', NULL, 5, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(21, 'Conceito', 'Para Marx, alienação refere-se ao processo pelo qual o trabalhador se torna estranho ao produto de seu trabalho, à atividade produtiva, a si mesmo como ser genérico, e aos outros trabalhadores. No capitalismo industrial, o trabalhador não se reconhece no que produz, que é apropriado pelo capitalista, transformando-se em algo hostil que domina seu criador. Na era digital, novas formas de alienação surgem com a precarização do trabalho via apps e a coisificação das relações sociais.', NULL, 6, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(22, 'Quatro Formas', 'Marx descreveu quatro dimensões da alienação: 1) do produto do trabalho (que não pertence ao trabalhador), 2) do ato de produção (trabalho como mero meio de sobrevivência), 3) do ser genérico (o homem se afasta de seu potencial criativo), e 4) dos outros homens (relações tornam-se mediadas pelo mercado). Essas formas se intensificam no capitalismo cognitivo atual.', NULL, 6, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(23, 'Atualização', 'Teóricos contemporâneos atualizam o conceito para incluir a alienação digital: alienação dos dados pessoais (que geram lucro para terceiros), do tempo de atenção (monetizado por plataformas), e até mesmo das emoções (exploradas pelo capitalismo afetivo). O trabalho em plataformas digitais reproduz em nova escala a separação entre trabalhador e controle sobre o processo produtivo.', NULL, 6, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(24, 'Superação', 'Para Marx, a superação da alienação exigiria a abolição da propriedade privada dos meios de produção e a construção de uma sociedade comunista onde os trabalhadores controlassem coletivamente o processo produtivo. Hoje, debates sobre renda básica universal, economia colaborativa e plataformas cooperativistas buscam respostas para as novas alienações do capitalismo digital.', NULL, 6, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(25, 'História', 'O grafite emergiu nas décadas de 1960-70 nos subúrbios de Nova York como expressão de grupos marginalizados, especialmente jovens afro-americanos e latinos. Inicialmente visto como vandalismo, foi gradualmente reconhecido como forma artística legítima, com nomes como Basquiat, Banksy e Kobra conquistando espaços em galerias. Essa trajetória reflete lutas por reconhecimento cultural e direito à cidade.', NULL, 7, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(26, 'Técnicas', 'Artistas de grafite desenvolveram técnicas específicas como uso de sprays com diferentes bicos, stencils para imagens detalhadas, efeitos 3D, e integração com arquitetura urbana. O estilo varia desde tags simples até murais complexos, incorporando elementos de pop art, surrealismo e design gráfico. A evolução das tintas e materiais permitiu maior durabilidade e riqueza cromática.', NULL, 7, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(27, 'Significado', 'Como arte pública, o grafite democratiza o acesso à cultura, transformando espaços urbanos cinzas em galerias a céu aberto. Ele documenta conflitos sociais, homenageia figuras locais, e provoca reflexões sobre temas como desigualdade e meio ambiente. Em muitas cidades, tornou-se atração turística e elemento de identidade cultural.', NULL, 7, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(28, 'Controvérsias', 'Apesar do reconhecimento artístico, persistem tensões entre grafite legal (autorizado) e ilegal, entre apropriação cultural e autenticidade, e entre mercantilização e contestação. Projetos de \"gentrificação artística\" usam grafite para valorizar imóveis, enquanto artistas de rua lutam por espaços autônomos fora do circuito institucional.', NULL, 7, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(29, 'Definição', 'Tribos urbanas são grupos identitários que se formam em contextos metropolitanos, caracterizados por estilos de vida, códigos estéticos e valores compartilhados. Diferentemente de classes ou estratos sociais, essas tribos são escolhidas afetivamente pelos indivíduos, como punks, góticos, hipsters ou otakus. Elas oferecem pertencimento em sociedades complexas onde identidades tradicionais se fragmentam.', NULL, 8, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(30, 'Características', 'As tribos urbanas tipicamente desenvolvem: um estilo visual distinto (moda, tatuagens, penteados), gostos musicais específicos, linguajar próprio, espaços de sociabilidade (baladas, cafés, eventos), e uma ética compartilhada. Na era digital, essas tribos se organizam em comunidades online, mantendo simultaneamente territórios físicos nas cidades.', NULL, 8, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(31, 'Funções', 'Esses grupos cumprem funções psicossociais importantes: proporcionam identidade a jovens em transição, criam redes de apoio contra a massificação, e permitem experimentação com papéis sociais. Ao mesmo tempo, podem gerar conformismo dentro do grupo e conflitos com outras tribos, reproduzindo dinâmicas de exclusão.', NULL, 8, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(32, 'Transformações', 'Com as redes sociais, as tribos urbanas tornaram-se mais fluidas e globais. Estilos que antes levavam anos para se difundir agora viralizam em semanas, e os indivíduos transitam entre múltiplas tribos. Alguns teóricos argumentam que estamos passando de \"tribos\" para \"redes pessoais\" como forma principal de organização identitária.', NULL, 8, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(33, 'Panorama Atual', 'O movimento LGBTQ+ contemporâneo enfrenta um cenário paradoxal: conquistas legais históricas (como casamento igualitário) coexistem com retrocessos em vários países e o surgimento de novas formas de violência. A visibilidade sem precedentes na mídia e política contrasta com o aumento de crimes de ódio e legislações anti-gênero. A comunidade se globalizou, mas enfrenta desafios específicos em cada contexto cultural.', NULL, 9, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(34, 'Novas Frentes', 'Além das lutas tradicionais por direitos civis, o movimento hoje se dedica a: combater a LGBTQ+fobia digital, garantir acesso à saúde específica (especialmente para pessoas trans), enfrentar a instrumentalização política de pautas identitárias, e incluir interseccionalidades como raça, classe e deficiência. A neurodiversidade também entra na agenda.', NULL, 9, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(35, 'Tecnologia', 'Aplicativos de encontros transformaram as sociabilidades LGBTQ+, criando novos espaços seguros mas também novas formas de solidão e objetificação. Plataformas como TikTok permitem ativismo criativo, enquanto deepfakes e discursos de ódio algorítmicos representam ameaças. A comunidade desenvolve suas próprias tecnologias, como apps de segurança para encontros.', NULL, 9, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(36, 'Desafios', 'Entre os principais desafios atuais estão: a divisão entre assimilacionistas e radicais, a comercialização do Pride por corporações, o acesso desigual a direitos globais, e o cuidado com uma geração mais jovem que sofre com altos índices de depressão e suicídio. A pandemia exacerbou vulnerabilidades específicas da comunidade.', NULL, 9, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(37, 'Fundamentos', 'O feminismo negro surge da constatação de que as experiências de mulheres negras não são adequadamente representadas nem pelo feminismo branco majoritário nem pelos movimentos negros masculinizados. Pensadoras como bell hooks, Angela Davis e Sueli Carneiro desenvolveram análises interseccionais que mostram como raça, gênero e classe se articulam na opressão específica das mulheres negras.', NULL, 10, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(38, 'Contribuições', 'Entre as contribuições únicas do feminismo negro estão: o conceito de \"matriz de dominação\" (sistemas interligados de opressão), a valorização do conhecimento produzido na experiência vivida, a crítica ao universalismo feminista branco, e propostas de organização comunitária baseadas em afetos e cuidados. Essas ideias influenciaram toda a teoria social contemporânea.', NULL, 10, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(39, 'Ativismo', 'No Brasil, o feminismo negro se expressa em coletivos periféricos, grupos de mães, empreendedoras negras, e iniciativas como marchas e ocupações culturais. A luta por políticas públicas específicas, contra a violência obstétrica e o genocídio da juventude negra, e por representação midiática são centrais. A internet amplificou essas vozes, mas também expôs ativistas a ataques racistas.', NULL, 10, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(40, 'Desdobramentos', 'Recentemente, o feminismo negro tem se dedicado a: combater o encarceramento em massa de mulheres negras, garantir titulação de terras quilombolas, desenvolver epistemologias decoloniais, e criar alternativas econômicas solidárias. A saúde mental da mulher negra em sociedades racistas também se tornou pauta central.', NULL, 10, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(41, 'Definição', 'Privilégio branco refere-se às vantagens estruturais que pessoas brancas desfrutam em sociedades racialmente hierarquizadas, independentemente de sua classe, gênero ou intenção individual. Como um sistema de benefícios não-escritos, ele se manifesta desde maior probabilidade de ser contratado até ausência de vigilância em lojas. Peggy McIntosh popularizou o conceito com sua metáfora da \"mochila invisível\" de privilégios.', NULL, 11, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(42, 'Manifestações', 'O privilégio branco aparece em estatísticas de renda, educação, violência policial e representação midiática. Ele se expressa também em microinterações: não ter a fala interrompida, ver sua cultura como norma universal, ou não ser tomado como representante de toda sua \"raça\". Na era digital, algoritmos de reconhecimento facial evidenciam esses privilégios técnicos.', NULL, 11, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(43, 'Desafios', 'Reconhecer o privilégio branco envolve superar resistências como a ideologia da \"democracia racial\", o mito da meritocracia, e o desconforto de confrontar vantagens pessoais. Muitas vezes, há uma reação defensiva que interpreta a discussão sobre privilégios como acusação pessoal, quando na verdade se trata de analisar estruturas coletivas.', NULL, 11, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(44, 'Ação', 'Pessoas brancas aliadas podem usar seu privilégio para: amplificar vozes não-brancas, confrontar racismos cotidianos, apoiar políticas afirmativas, e desmontar mecanismos institucionais de exclusão. Isso requer autoeducação constante, disposição para errar e aprender, e renúncia a posições de protagonismo em espaços de luta antirracista.', NULL, 11, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(45, 'Conceito', 'Mobilidade social refere-se à capacidade dos indivíduos de mudarem sua posição socioeconômica ao longo da vida ou entre gerações. Ela pode ser vertical (mudança de classe), horizontal (mudança de ocupação sem alteração de status), ou intergeracional (comparação com os pais). Sociedades com alta mobilidade são consideradas mais justas, pois permitem que talentos emergentes independentemente de origem.', NULL, 12, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(46, 'Fatores', 'Entre os principais fatores que influenciam a mobilidade social estão: qualidade da educação pública, acesso a saúde básica, estrutura do mercado de trabalho, políticas de redistribuição de renda, e capital social (redes de relacionamento). No Brasil, estudos mostram que leva em média nove gerações para que descendentes de famílias pobres atinjam a renda média.', NULL, 12, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(47, 'Desafios', 'A mobilidade social enfrenta novos obstáculos na era digital: a automação ameaça empregos tradicionais de ascensão, a educação online de qualidade é inacessível para muitos, e plataformas digitais criam formas precarizadas de trabalho. Simultaneamente, a internet oferece novas oportunidades de aprendizagem e empreendedorismo para quem tem acesso e habilidades digitais.', NULL, 12, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(48, 'Políticas', 'Para aumentar a mobilidade, especialistas recomendam: investimento em educação infantil de qualidade, programas de primeira empregos, tributação progressiva, moradia acessível, e combate a discriminações estruturais. Experiências como renda básica universal também são testadas como forma de criar um piso mínimo para a mobilidade ascendente.', NULL, 12, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(49, 'Funcionamento', 'VPNs (Redes Privadas Virtuais) criam túneis criptografados entre dispositivos e servidores remotos, mascarando o tráfego original e ocultando o endereço IP real do usuário. As versões avançadas incorporam técnicas como double VPN (criptografia em cascata), servidores RAM-only (que não armazenam dados), e protocolos como WireGuard® que combinam velocidade e segurança. Essas ferramentas são essenciais para jornalistas, ativistas e profissionais em regimes censuradores.', 'ee771a78a367d98e7f318fc8bf506cda_1753961490.jpg', 13, '2025-07-30 23:34:27', '2025-07-31 14:31:30', NULL),
(50, 'Aplicações', 'Além de privacidade, VPNs avançadas permitem: acesso a conteúdo georestrito sem deixar rastros, proteção em redes Wi-Fi públicas, bypass de censura governamental, e separação segura de tráfegos profissionais/pessoais. Empresas as usam para proteger comunicações remotas, enquanto indivíduos as utilizam contra vigilância massiva e throttling de ISPs.', '106cc9eee05e5b71b9009fb6e5190117_1753961501.jpg', 13, '2025-07-30 23:34:27', '2025-07-31 14:31:41', NULL),
(51, 'Limitações', 'VPNs não são panaceias: podem reduzir velocidade de conexão, serem bloqueadas por serviços (como Netflix), e dar falsa sensação de anonimato (o provedor VPN ainda vê seu tráfego). Alguns países criminalizam seu uso, e serviços gratuitos muitas vezes monetizam dados dos usuários. A escolha de jurisdição do provedor é crucial para proteção legal.', NULL, 13, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(52, 'Futuro', 'Novos desenvolvimentos incluem VPNs descentralizadas baseadas em blockchain, integração com TOR para múltiplas camadas de anonimato, e soluções hardware-based como roteadores pré-configurados. A guerra tecnológica entre censura e contornamento impulsiona inovações constantes nessa área.', NULL, 13, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(53, 'Tipos', 'A autenticação em dois fatores (2FA) eficaz vai além de SMS, utilizando métodos como: aplicativos autenticadores (Google Authenticator, Authy), chaves físicas de segurança (YubiKey), notificações push, ou biometria comportamental. Cada método tem trade-offs entre conveniência e segurança - chaves físicas são as mais seguras contra phishing, enquanto apps equilibram praticidade e proteção.', NULL, 14, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(54, 'Implementação', 'Para 2FA robusto, recomenda-se: ativar em todos serviços críticos (e-mail principal, bancos, redes sociais), usar métodos diferentes para contas distintas, ter códigos de backup impressos em local seguro, e registrar múltiplos dispositivos de autenticação. Contas privilegiadas (admin) devem exigir 2FA em cada login, não apenas em dispositivos novos.', NULL, 14, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(55, 'Ataques', 'Mesmo com 2FA, ataques como SIM swapping (clonagem de chip), man-in-the-middle, e engenharia social podem burlar proteções fracas. Soluções avançadas como FIDO2/WebAuthn usam criptografia de chave pública para resistir a phishing, enquanto biometria multimodal combina múltiplos fatores fisiológicos.', NULL, 14, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(56, 'Tendências', 'O futuro do 2FA inclui: autenticação sem senha (passwordless), padrões como FIDO Alliance para interoperabilidade, e integração com wallets digitais. A inteligência artificial também permite autenticação contínua baseada em padrões de comportamento, reduzindo dependência de etapas discretas de login.', NULL, 14, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(57, 'Metodologia', 'Testes de invasão (pentests) seguem metodologias estruturadas como PTES (Penetration Testing Execution Standard), envolvendo: reconhecimento (coleta de informações), varredura (identificação de vulnerabilidades), exploração (tentativa de acesso), pós-exploração (manutenção de acesso), e relatório. Pentesters profissionais usam abordagem ética, com consentimento por escrito e cuidado para não causar danos reais aos sistemas.', NULL, 15, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(58, 'Ferramentas', 'O arsenal inclui: Nmap (varredura de redes), Burp Suite (testes web), Metasploit (exploração de vulnerabilidades), Wireshark (análise de tráfego), e frameworks como Kali Linux. Pentesters avançados desenvolvem scripts personalizados e técnicas de engenharia social, simulando ataques reais sem depender apenas de ferramentas automatizadas.', NULL, 15, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(59, 'Certificações', 'Profissionais buscam certificações como OSCP (Offensive Security Certified Professional), CEH (Certified Ethical Hacker), ou eJPT, que validam habilidades práticas. O mercado valoriza pentesters com conhecimento em normas como ISO 27001, PCI-DSS e OWASP, capazes de alinhar testes aos riscos de negócio reais.', NULL, 15, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(60, 'Desafios', 'Pentesters enfrentam dilemas como: balancear profundidade do teste com tempo orçado, lidar com sistemas críticos onde explorações podem causar indisponibilidade, e comunicar vulnerabilidades complexas para gestores não-técnicos. A evolução para Red Teaming (simulações de ataques avançados persistentes) representa o próximo nível de maturidade.', NULL, 15, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(61, 'Visão Geral', 'A lista OWASP Top 10 cataloga as dez vulnerabilidades web mais críticas, atualizada periodicamente por especialistas globais. A edição 2021 inclui: injeções (SQL, comandos), falhas de autenticação, exposição de dados sensíveis, configurações inseguras, e lógica de negócio falha. Cada item vem com exemplos reais, impactos potenciais, e melhores práticas de prevenção.', NULL, 16, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(62, 'Mudanças', 'A versão 2021 trouxe novidades como: \"Server-Side Request Forgery\" (SSRF) entrando pela primeira vez, \"Insecure Design\" focando em falhas arquiteturais, e \"Software and Data Integrity Failures\" refletindo ataques à cadeia de suprimentos. A remoção de \"XML External Entities\" (XXE) mostra progresso na correção desse vetor.', NULL, 16, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(63, 'Impacto', 'Empresas usam o OWASP Top 10 para priorizar investimentos em segurança, enquanto frameworks como NIST e ISO 27001 a referenciam. Certificações de desenvolvedores (como Secure Code Warrior) testam conhecimento dessas vulnerabilidades. O projeto democratiza conhecimento técnico, permitindo que startups protejam sistemas sem orçamentos elevados.', NULL, 16, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(64, 'Críticas', 'Alguns especialistas argumentam que a lista simplifica excessivamente riscos complexos, foca demais em aplicações web tradicionais (ignorando APIs modernas e serverless), e atualiza-se lentamente para ameaças emergentes. Alternativas como \"OWASP API Security Top 10\" surgem para cobrir essas lacunas.', NULL, 16, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(65, 'Princípios', 'Clean Code (Código Limpo) é uma filosofia de programação que enfatiza clareza, manutenibilidade e simplicidade. Seus princípios incluem: nomes significativos (variáveis, funções), funções pequenas com única responsabilidade, ausência de duplicação (DRY), tratamento explícito de erros, e testes automatizados. O objetivo é criar código que humanos entendam facilmente, não apenas máquinas.', NULL, 17, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(66, 'Benefícios', 'Código limpo reduz bugs, facilita colaboração em equipe, permite refatoração segura, e diminui custos de manutenção a longo prazo. Estudos mostrem que até 80% do custo total de software vem da fase de manutenção, tornando investimento em qualidade inicial altamente rentável. Sistemas legados com código limpo são mais fáceis de modernizar.', NULL, 17, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(67, 'Técnicas', 'Práticas como: revisão de código em pares, padronização via linters (ESLint, Pylint), refatoração contínua, e documentação embutida (via docstrings) ajudam a manter limpeza. Metodologias como TDD (Test-Driven Development) naturalmente incentivam código mais modular e testável. Ferramentas de análise estática (SonarQube) identificam \"code smells\".', NULL, 17, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(68, 'Desafios', 'Equipes enfrentam obstáculos como: pressão por prazos curtos que incentivam \"quick and dirty\", resistência a mudanças culturais, e dificuldade em medir ROI da qualidade de código. Projetos com alta rotatividade de desenvolvedores sofrem especialmente quando não há padrões claros documentados.', NULL, 17, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(69, 'Recursos', 'Python moderno (3.8+) introduziu features poderosas como: assignment expressions (:=), positional-only parameters, type hints avançados, e melhorias de desempenho (subinterpreters). Context managers async, pattern matching (estrutural), e zoneinfo para timezones refletem necessidades contemporâneas. A linguagem mantém sua filosofia de legibilidade enquanto incorpora paradigmas complexos.', NULL, 18, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(70, 'Ecossistema', 'Além da biblioteca padrão, o ecossistema Python moderno inclui: FastAPI para APIs rápidas, Poetry para gerenciamento de dependências, Pydantic para validação de dados, e ferramentas como PyTorch para ML. Jupyter Notebooks evoluíram para JupyterLab, enquanto soluções como PyScript permitem rodar Python no browser.', NULL, 18, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(71, 'Boas Práticas', 'Desenvolvedores modernos adotam: type checking estático com mypy, virtual environments nativos, formatação automática via Black, e testes com pytest. Arquiteturas assíncronas (asyncio) e uso eficiente de recursos são prioritários, especialmente em microsserviços e edge computing. O PEP 8 permanece como guia de estilo, mas com adaptações pragmáticas.', NULL, 18, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(72, 'Futuro', 'As próximas versões prometem: melhor desempenho via otimizações no bytecode, mais features para programação concorrente, e integração com WebAssembly. Projetos como Cinder (Meta) exploram JIT compilation, enquanto CPython trabalha em reduzir GIL limitations. Python consolida-se como lingua franca para dados, automação e prototyping rápido.', NULL, 18, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(73, 'Serviços Essenciais', 'AWS oferece mais de 200 serviços, mas iniciantes devem dominar: EC2 (máquinas virtuais), S3 (armazenamento objeto), RDS (bancos relacionais), Lambda (computação serverless), e IAM (gerenciamento de acesso). Entender billing e tags é crucial para evitar custos surpresa. O Free Tier permite experimentação inicial sem custos.', NULL, 19, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(74, 'Conceitos-chave', 'Novatos precisam compreender: regiões e zonas de disponibilidade, modelos de responsabilidade compartilhada, arquitetura well-architected (os cinco pilares), e diferenças entre infraestrutura como serviço (IaaS), plataforma (PaaS) e software (SaaS). O console web é acessível, mas a CLI e CDK são mais poderosas para automação.', NULL, 19, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(75, 'Segurança', 'Boas práticas iniciais incluem: configurar MFA na conta root, usar políticas IAM mínimas necessárias, habilitar CloudTrail para auditoria, e não expor credenciais em repositórios. Serviços como GuardDuty detectam ameaças, enquanto AWS Organizations ajuda a gerenciar múltiplas contas com segurança.', NULL, 19, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(76, 'Certificação', 'A AWS Certified Cloud Practitioner valida conhecimento básico em nuvem e serviços AWS. Preparação envolve cursos gratuitos da AWS Skill Builder, whitepapers arquiteturais, e testes práticos. Essa base permite avançar para certificações associadas como Solutions Architect ou Developer.', NULL, 19, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(77, 'Fundamentos', 'Computação serverless permite executar código (como AWS Lambda) sem gerenciar servidores, com cobrança por tempo de execução real. Benefícios incluem escalabilidade automática, alta disponibilidade nativa, e redução de overhead operacional. Use cases típicos são: APIs leves, processamento de eventos, e automações pontuais.', NULL, 20, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(78, 'Desafios', 'Apesar da simplicidade, serverless traz complexidades: cold starts (latência inicial), debugging distribuído, limites de tempo/memória, e acoplamento a serviços cloud específicos. Aplicações complexas exigem orquestração (Step Functions) e padrões como Event Sourcing para gerenciar estado.', NULL, 20, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(79, 'Ferramentas', 'Frameworks como Serverless e SAM simplificam deploy, enquanto soluções como AWS X-Ray ajudam a monitorar performance. Bibliotecas específicas (aws-lambda-powertools) implementam boas práticas. Para desenvolvimento local, ferramentas como LocalStack emulam ambiente AWS serverless offline.', NULL, 20, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(80, 'Futuro', 'O ecossistema evolui para: maior tempo máximo de execução, suporte a mais linguagens, melhores ferramentas observabilidade, e integração com edge computing. Conceitos como serverless containers (AWS Fargate) e databases serverless (Aurora Serverless) expandem o modelo para novas cargas de trabalho.', NULL, 20, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(81, 'Conceito', 'SD-WAN (Software-Defined Wide Area Network) aplica princípios de virtualização a redes corporativas, separando plano de controle (gerenciamento centralizado) do plano de dados (tráfego local). Isso permite roteamento inteligente entre múltiplos links (MPLS, LTE, broadband) baseado em políticas de negócio, QoS e custo.', NULL, 21, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(82, 'Vantagens', 'Comparado a WAN tradicional, SD-WAN oferece: redução de custos (usa links baratos para tráfego não-crítico), agilidade (provisionamento via software), resiliência (failover automático), e visibilidade centralizada. Empresas com múltiplas filiais ou migrando para nuvem são principais beneficiárias.', NULL, 21, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(83, 'Implementação', 'Soluções como Cisco SD-WAN, VMware Velocloud e Fortinet Secure SD-WAN combinam appliances físicos (CPE) com controladores em nuvem. A migração requer inventário de aplicações (para definir políticas), avaliação de links existentes, e possível upgrade de branch offices. Segurança integrada (ZTNA, firewall) é diferencial.', NULL, 21, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(84, 'Tendências', 'O futuro do SD-WAN inclui: integração com SASE (Secure Access Service Edge), suporte a 5G como link primário, e maior uso de AIOps para otimização preditiva. A convergência com redes 5G privadas e edge computing criará arquiteturas híbridas ainda mais flexíveis.', NULL, 21, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(85, 'Princípios', 'Zero Trust é um modelo de segurança que assume que nenhum usuário ou dispositivo deve ser confiável por padrão, mesmo dentro da rede corporativa. Seus pilares são: verificação contínua, acesso mínimo privilegiado, e microssegmentação. Diferente do modelo \"castelo e fosso\", Zero Trust protege dados onde quer que estejam - nuvem, endpoints ou data centers.', NULL, 22, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(86, 'Componentes', 'Implementar Zero Trust requer: IAM robusto (com MFA), segmentação de rede granular, inspeção de tráfego east-west, e políticas baseadas em contexto (localização, horário, risco do dispositivo). Soluções como Zscaler Private Access e Google BeyondCorp oferecem frameworks prontos, enquanto NIST SP 800-207 fornece diretrizes.', NULL, 22, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(87, 'Desafios', 'Adoção enfrenta obstáculos como: complexidade em ambientes legados, resistência cultural à verificação constante, e necessidade de visibilidade unificada. Migrações para nuvem aceleram a adoção, mas exigem reestruturação de políticas de acesso. ROI é medido em redução de superfície de ataque e velocidade de detecção de breaches.', NULL, 22, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(88, 'Futuro', 'Evoluções incluem: integração com AI para avaliação contínua de risco, expansão para IoT/OT, e padrões abertos para interoperabilidade. O conceito está se expandindo para Zero Trust Data Security (proteção baseada em classificação de dados), não apenas controle de acesso.', NULL, 22, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(89, 'Segurança', 'Dispositivos IoT para smart homes frequentemente têm vulnerabilidades como senhas padrão, firmware desatualizado, e comunicações não criptografadas. Boas práticas incluem: mudar credenciais padrão, segmentar rede (VLAN separada), desativar features não usadas, e monitorar tráfego suspeito. Certificações como ioXt garantem padrões mínimos.', NULL, 23, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(90, 'Privacidade', 'Assistentes virtuais e câmeras inteligentes coletam dados sensíveis (voz, imagens internas). Usuários devem: revisar permissões, desativar gravações desnecessárias, optar por processamento local quando possível, e entender políticas de retenção de dados. Leis como GDPR dão direito à exclusão desses dados.', NULL, 23, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(91, 'Protocolos', 'Padrões concorrentes como Matter (ex-Project CHIP), Zigbee, Z-Wave e Thread prometem maior interoperabilidade e segurança. Dispositivos com suporte a atualizações OTA (Over-The-Air) são preferíveis, pois recebem patches de segurança. Hubs centralizados (Home Assistant) oferecem mais controle que soluções cloud-dependentes.', NULL, 23, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(92, 'Automação', 'Rotinas automatizadas (como iluminação e climatização) devem ter fallbacks manuais para evitar lockouts digitais. Sistemas críticos (fechaduras, alarmes) exigem redundância e backup de energia. A automação excessiva pode criar complexidade desnecessária - simplicidade muitas vezes é mais segura.', NULL, 23, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(93, 'Comparação', 'Protocolos IoT diferem em: consumo energético, alcance, taxa de dados, segurança nativa e custo. MQTT é leve para telemetria, CoAP funciona bem em redes restritas, AMQP suporta mensagens complexas, enquanto LoRaWAN cobre longas distâncias com baixa energia. Escolha depende do use case específico - industrial, urbano ou residencial.', NULL, 24, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(94, 'Segurança', 'Muitos protocolos IoT foram criados sem segurança robusta. Mitigações incluem: usar TLS/DTLS mesmo quando opcional, implementar controle de acesso granular, rotacionar chaves regularmente, e monitorar padrões anômalos. Padrões emergentes como OSCORE trazem criptografia fim-a-fim para ambientes restritos.', NULL, 24, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(95, 'Tendências', 'Novos desenvolvimentos incluem: 5G RedCap para IoT de média complexidade, Wi-Fi 6 para alta densidade de dispositivos, e Matter para padronização residencial. Edge AI está levando a protocolos mais inteligentes que filtram dados localmente antes da transmissão, economizando banda e melhorando privacidade.', NULL, 24, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(96, 'Implementação', 'Projetar redes IoT requer: análise de trade-offs (latência vs. energia), testes de interferência em ambiente real, e planejamento para atualizações remotas. Gateways intermediários podem traduzir entre protocolos diferentes, enquanto gerenciamento centralizado (como Azure IoT Hub) simplifica operações em escala.', NULL, 24, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(97, 'Framework', 'Metasploit é um framework open-source para desenvolvimento e execução de exploits contra sistemas vulneráveis. Sua estrutura modular inclui: módulos de exploração, payloads (código executado após exploração), encoders (para evadir AV), e auxiliares (scanners, fuzzers). A versão Pro adiciona features para equipes profissionais.', NULL, 25, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(98, 'Workflow', 'O fluxo típico envolve: identificar alvos (via nmap ou aux modules), selecionar exploit apropriado, configurar payload (como reverse shell), definir opções (portas, credenciais), e executar. Pós-exploração, módulos como mimikatz extraem credenciais, enquanto pivotagem permite avançar na rede comprometida.', NULL, 25, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(99, 'Defesa', 'Para se proteger contra Metasploit, organizações devem: manter sistemas atualizados, usar EDR/XDR para detecção comportamental, segmentar redes, e realizar pentests regulares. Ferramentas como Metasploit podem ser usadas defensivamente para validar controles de segurança - ethical hacking é aplicação principal.', NULL, 25, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(100, 'Comunidade', 'A versão community é mantida por contribuições open-source, com novos módulos frequentemente adicionados para vulnerabilidades zero-day. Recursos como Exploit-DB integram-se ao Metasploit, enquanto treinamentos como OSCP ensinam seu uso ético profissional. O framework evolui para cobrir novas tecnologias como containers e IoT.', NULL, 25, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(101, 'Componentes', 'Burp Suite é um conjunto de ferramentas para teste de segurança web. O Professional inclui: Proxy (interceptar/modificar tráfego), Scanner (automatizado), Intruder (ataques personalizados), Repeater (modificar/reenviar requests), e Collaborator (detectar interações externas). A versão Community tem funcionalidades limitadas.', NULL, 26, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(102, 'Metodologia', 'Testes com Burp seguem: mapeamento de aplicação (spidering), análise de tráfego (Proxy), identificação automatizada de vulnerabilidades (Scanner), e exploração manual (Intruder/Repeater). Features como match-and-replace automatizam modificações de requests, enquanto extensões BApps ampliam funcionalidades.', NULL, 26, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(103, 'Casos de Uso', 'Burp é essencial para encontrar: vulnerabilidades OWASP Top 10, lógicas de negócio quebradas, problemas de controle de acesso, e vazamentos de informação. Seu scanner gera relatórios detalhados para desenvolvedores corrigirem falhas. Profissionais usam junto com ferramentas como OWASP ZAP para cobertura abrangente.', NULL, 26, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(104, 'Extensões', 'A API BApp permite instalar extensões como: Autorize (testar controle de acesso), Turbo Intruder (ataques high-speed), e SAML Raider (testar SSO). Desenvolvedores podem criar plugins em Python ou Ruby para automatizar testes específicos. A comunidade mantém centenas de extensões para nichos como APIs GraphQL e WebSockets.', NULL, 26, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(105, 'Técnicas', 'Memory forensics analisa dumps de memória RAM para evidências de malware, credenciais, ou atividades maliciosas. Ferramentas como Volatility (open-source) ou Rekall permitem: extrair processos ativos, reconhecer injeções de código, recuperar arquivos mapeados, e analisar artefatos como conexões de rede e registros de teclas digitadas.', NULL, 27, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(106, 'Coleta', 'Criar dumps válidos requer: ferramentas especializadas (WinPmem, LiME para Linux), evitar contaminação do estado original, e documentar cadeia de custódia. Dumps completos consomem GBs - técnicas alternativas como extração seletiva (apenas heap de processo específico) podem ser mais eficientes em sistemas críticos.', NULL, 27, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(107, 'Análise', 'Investigadores buscam: processos ocultos (rootkits), DLLs injetadas, hooks maliciosos, e strings sensíveis (como senhas em texto claro). Técnicas avançadas incluem análise de page tables para reconstruir memória paginada, e correlacionar timestamps entre diferentes artefatos na memória.', NULL, 27, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(108, 'Desafios', 'Memory forensics enfrenta: criptografia de memória (como Windows Credential Guard), técnicas anti-forense (overwriting artifacts), e complexidade em sistemas modernos (containers, serverless). A ascensão de ataques fileless (que existem apenas na memória) aumenta a importância dessa disciplina.', NULL, 27, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(109, 'Procedimentos', 'Cadeia de custódia documenta quem manipulou evidências digitais, quando e por quê. Requer: registro detalhado (formulários padronizados), selagem física/logística (hashes criptográficos), e controle de acesso estrito. Quebras na cadeia podem invalidar evidências em tribunais - ferramentas como FTK Imager geram logs automáticos de aquisição.', NULL, 28, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(110, 'Padrões', 'Organizações seguem frameworks como ISO 27037 (preservação de evidências), NIST SP 800-86 (integração forense), e normas locais (como FBI CJIS). Evidências devem ser armazenadas em local seguro, com cópias íntegras (write-blockers durante aquisição) e políticas claras para destruição após caso encerrado.', NULL, 28, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(111, 'Automação', 'Soluções como GRR Rapid Response e osquery permitem coleta remota de evidências com cadeia de custódia digital, usando assinaturas criptográficas e logs imutáveis. Blockchain está sendo testado para registrar manipulações de forma verificável, especialmente em investigações distribuídas.', NULL, 28, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(112, 'Casos Complexos', 'Investigações em nuvem (multi-jurisdição), IoT (dados efêmeros), e ambientes ágeis (containers efêmeros) desafiam modelos tradicionais. Novas abordagens incluem: preservação legal em nuvem (legal hold), image forensics para microserviços, e coleta contínua em sistemas dinâmicos.', NULL, 28, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(113, 'Algoritmo', 'AES (Advanced Encryption Standard) é um cifrador de bloco simétrico que processa dados em blocos de 128 bits usando chaves de 128, 192 ou 256 bits. AES-256 usa 14 rodadas de transformações (SubBytes, ShiftRows, MixColumns, AddRoundKey), com expansão de chave complexa. Seu design segue princípios de confusão e difusão para resistência a ataques.', NULL, 29, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(114, 'Implementação', 'Usar AES-256 corretamente requer: modo de operação apropriado (GCM para autenticação, CBC para compatibilidade), IVs únicos/não-preditivos, e gerenciamento seguro de chaves (HSMs, TPMs). Implementações devem evitar side-channel attacks (como timing attacks) - bibliotecas como OpenSSL e libsodium oferecem versões seguras.', NULL, 29, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL);
INSERT INTO `contents` (`id`, `name`, `description`, `image`, `item_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(115, 'Segurança', 'AES-256 é considerado quantum-resistant - mesmo com algoritmo de Grover, computadores quânticos precisariam de 2^128 operações para quebrá-lo. Ataques práticos hoje são contra implementações (weak keys, poor randomness), não contra o algoritmo em si. NIST aprova AES-256 para informações classificadas até TOP SECRET.', NULL, 29, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(116, 'Aplicações', 'Além de criptografia de dados em repouso/trânsito, AES-256 é usado em: sistemas de arquivos criptografados (BitLocker), VPNs (IPsec), comunicações seguras (Signal), e até hardware (chips Secure Enclave). Sua eficiência em hardware permite uso desde servidores até dispositivos IoT com restrições.', NULL, 29, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(117, 'Fundamentos', 'RSA é um algoritmo assimétrico baseado na dificuldade de fatorar grandes números primos. Seus parâmetros são: módulo n (produto de dois primos p,q), expoente público e (tipicamente 65537), e privado d (inverso modular de e). Mensagens são cifradas com a chave pública e decifradas com a privada - ou vice-versa para assinaturas.', NULL, 30, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(118, 'Boas Práticas', 'Implementações seguras requerem: tamanhos de chave ≥2048 bits (3072/4096 para longevidade), preenchimento seguro (OAEP, não PKCS#1 v1.5), e proteção contra side-channel attacks. RSA puro é lento - na prática, usa-se para trocar chaves simétricas ou assinar hashes, não cifrar dados diretamente.', NULL, 30, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(119, 'Limitações', 'RSA enfrenta: vulnerabilidade a computação quântica (algoritmo de Shor), degradação de desempenho com chaves grandes, e riscos se primos p,q não forem verdadeiramente aleatórios. Alternativas como ECC (curvas elípticas) oferecem segurança similar com chaves menores, mas RSA persiste por compatibilidade.', NULL, 30, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(120, 'Cenário Atual', 'Apesar dos desafios, RSA ainda protege a maioria das conexões HTTPS (juntamente com ECDHE para forward secrecy), assina pacotes software, e autentica dispositivos. A migração para algoritmos pós-quânticos (como NTRU, CRYSTALS-Kyber) está em curso, mas será gradual devido à base instalada.', NULL, 30, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(121, 'Funcionamento', 'Static Application Security Testing (SAST) analisa código-fonte sem executá-lo, identificando vulnerabilidades como injeções SQL, XSS, ou uso inseguro de criptografia. Ferramentas como Checkmarx, Fortify e SonarQube usam: análise de fluxo de dados, pattern matching, e modelos de ameaça para detectar riscos durante o desenvolvimento.', NULL, 31, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(122, 'Integração', 'SAST eficaz requer: escaneamento em pull requests (impedir código vulnerável no main), customização de regras para contexto específico, e triagem de resultados (priorizar falsos positivos). Pipelines CI/CD modernas incorporam SAST como gate de qualidade, com ferramentas como GitLeaks prevenindo vazamentos de credenciais.', NULL, 31, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(123, 'Limitações', 'SAST sofre com: falsos positivos (requer revisão humana), incapacidade de detectar runtime issues, e dificuldade com linguagens dinâmicas. Análises profundas consomem tempo - abordagens como incremental scanning (apenas código modificado) e análise diferencial melhoram desempenho.', NULL, 31, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(124, 'Tendências', 'Inovações incluem: SAST para infra-as-code (Terraform, Kubernetes), uso de IA para reduzir falsos positivos, e integração com SCM (como GitHub Code Scanning). Ferramentas emergentes focam em linguagens modernas (Rust, Go) e frameworks cloud-native, complementando DAST e IAST.', NULL, 31, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(125, 'Riscos', 'Pipelines CI/CD são alvos valiosos - comprometimento permite injeção de malware em builds oficiais. Ataques comuns exploram: secrets em logs, dependências maliciosas, runners mal configurados, e aprovações automáticas. O caso SolarWinds destacou riscos na cadeia de suprimentos de software.', NULL, 32, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(126, 'Proteções', 'Pipeline seguras implementam: least privilege (tokens temporários, permissões mínimas), escaneamento de dependências (Dependabot, Snyk), artefatos assinados (cosign, SBOMs), e ambientes efêmeros/isolados. Ferramentas como Tekton e GitLab oferecem features de segurança nativas, enquanto SPIFFE/SPIRE gerenciam identidades.', NULL, 32, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(127, 'Monitoramento', 'Além de prevenir ataques, equipes devem: auditar atividades de pipeline (quem aprovou mudanças?), monitorar desvios de baseline (novas dependências, tempos de build anômalos), e ter rollback automatizado para builds comprometidos. Soluções como Chainguard e Aqua Security focam em supply chain security.', NULL, 32, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(128, 'Futuro', 'Próximos passos incluem: padrões como SLSA (Supply-chain Levels for Software Artifacts), adoção de attested builds (proveniência verificável), e maior uso de confidential computing para proteger segredos durante o build. A ascensão de AI coding assistants traz novos vetores de ataque a considerar.', NULL, 32, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(129, 'Conceito', 'Regência verbal estuda a relação entre verbos e seus complementos, determinando se estes são ligados por preposição (regência indireta) ou não (regência direta). Verbos como \"aspirar\" mudam sentido conforme a regência: \"aspirar o pó\" (diretamente) vs \"aspirar ao cargo\" (com preposição). Dominar regência evita erros como \"obedecer o pai\" (incorreto) vs \"obedecer ao pai\".', NULL, 33, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(130, 'Classificação', 'Verbos podem ser: transitivos diretos (exigem objeto direto: \"amar alguém\"), transitivos indiretos (exigem preposição: \"gostar de algo\"), bitransitivos (dois complementos: \"dar algo a alguém\"), ou intransitivos (não exigem complemento: \"chorar\"). Alguns como \"pedir\" permitem ambas construções (\"pedir ajuda\"/\"pedir por ajuda\") com nuances de significado.', '05caa736f2e41f518adb804494ef2252_1753960248.jpg', 33, '2025-07-30 23:34:27', '2025-07-31 14:10:48', NULL),
(131, 'Casos Complexos', 'Certos verbos desafiam regras simples: \"perdoar\" aceita ambas construções (\"perdoar alguém\"/\"perdoar a alguém\"), enquanto \"querer\" é direto para pessoas (\"querer alguém\") mas indireto para coisas (\"querer a algo\"). Verbos como \"visar\" geram controvérsias entre puristas (\"visar algo\") e uso consolidado (\"visar a algo\").', '101b34148a5a9722aea3155f8c918d56_1753960264.jpg', 33, '2025-07-30 23:34:27', '2025-07-31 14:11:04', NULL),
(132, 'Evolução', 'A regência verbal não é estática - construções como \"assistir o jogo\" (em vez de \"assistir ao jogo\") ganham aceitação pelo uso generalizado. Dicionários e gramáticas registram essas mudanças, mas contextos formais ainda privilegiam as regras tradicionais. A influência de traduções do inglês acelera algumas dessas transformações.', NULL, 33, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(133, 'Regras Básicas', 'A crase é a fusão da preposição \"a\" com o artigo feminino \"a\", indicada pelo acento grave (`). Ocorre antes de substantivos femininos (\"vou à escola\"), em locuções adverbiais femininas (\"à noite\"), e em expressões de modo (\"à francesa\"). Não se usa antes de nomes masculinos, verbos no infinitivo, ou pronomes pessoais (exceto \"àquelas\").', NULL, 34, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(134, 'Casos Especiais', 'Dúvidas comuns incluem: topônimos (usa-se em \"à Bahia\" mas não em \"a Brasília\"), palavras masculinas que antecedem femininos (\"à mesma hora\"), e expressões com \"casa\"/\"terra\"/\"distância\" (só têm crase quando especificadas: \"vou à casa da mãe\" vs \"vou a casa\"). O pronome \"que\" pode exigir crase (\"à que custo\").', NULL, 34, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(135, 'Testes Práticos', 'Para confirmar o uso, substitua o termo feminino por um masculino equivalente: se exigir \"ao\", há crase (\"dedicado à música\" → \"dedicado ao esporte\"). Outra técnica é tentar trocar por \"para a\" - se fizer sentido, provavelmente leva crase. Ferramentas como Revisaço automatizam essa verificação.', NULL, 34, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(136, 'Controvérsias', 'Algumas construções geram debate: \"à medida que\" (padrão) vs \"a medida que\" (uso consagrado), ou expressões como \"a princípio\"/\"à princípio\". A tendência moderna é simplificar o uso da crase, mas redações formais ainda exigem rigor. Dicionários eletrônicos ajudam a sanar dúvidas específicas.', NULL, 34, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(137, 'Estilo Literário', 'Machado de Assis (1839-1908) é celebrado por sua ironia fina, narradores não-confiáveis, e análise psicológica profunda. Sua obra divide-se em fase romântica (como \"Helena\") e realista/psicológica (\"Memórias Póstumas de Brás Cubas\"). Características únicas incluem: digressões filosóficas, intertextualidade, e metalinguagem, antecipando técnicas modernistas.', '106cc9eee05e5b71b9009fb6e5190117_1753960100.jpg', 35, '2025-07-30 23:34:27', '2025-07-31 14:08:20', NULL),
(138, 'Temas Recorrentes', 'Machado explorou: o caráter ilusório das aparências sociais, o egoísmo humano mascarado por convenções, a loucura como contraponto à razão, e a mobilidade social no Segundo Reinado. Seus personagens frequentemente revelam contradições entre o ser e o parecer, como Bentinho (\"Dom Casmurro\") ou Rubião (\"Quincas Borba\").', NULL, 35, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(139, 'Inovações', 'Considerado precursor do realismo mágico e da literatura pós-moderna, Machado quebrou convenções: \"Brás Cubas\" é narrado por um defunto-autor, \"Dom Casmurro\" constrói ambiguidade irresolúvel, e \"O Alienista\" satiriza a ciência. Sua linguagem mescla registros cultos e populares com maestria.', '71c155491c879ef37e3e8cf58132347f_1753960112.jpeg', 35, '2025-07-30 23:34:27', '2025-07-31 14:08:32', NULL),
(140, 'Legado', 'Fundador da Academia Brasileira de Letras, Machado influenciou autores de Graciliano Ramos a Dalton Trevisan. Sua obra ganha novas interpretações: estudos pós-coloniais destacam seu olhar sobre escravidão, enquanto análises feministas revisitam personagens como Capitu. Traduções recentes o consagram como autor universal.', NULL, 35, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(141, 'Estilo Único', 'Clarice Lispector (1920-1977) desenvolveu uma prosa introspectiva e poética que desafia convenções narrativas. Suas obras (\"Perto do Coração Selvagem\", \"A Hora da Estrela\") caracterizam-se por fluxo de consciência, frases fragmentadas, e mergulho em estados psicológicos liminares. A linguagem clariceana busca capturar o indizível - epifanias cotidianas que revelam abismos existenciais.', NULL, 36, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(142, 'Temas', 'Explorou: a solidão essencial do ser, a estranheza do familiar, a violência sob a superfície do banal, e a busca por autenticidade em um mundo de máscaras. Personagens como Macabéa (\"A Hora da Estrela\") ou G.H. (\"A Paixão Segundo G.H.\") encarnam dramas metafísicos através de vidas aparentemente insignificantes.', NULL, 36, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(143, 'Filosofia', 'Sua obra dialoga com existencialismo, misticismo judaico, e fenomenologia, sem se filiar a sistemas. A pergunta \"quem sou?\" ecoa em narrativas que desconstroem identidades fixas. Animais, objetos e espaços domésticos ganham carga metafísica, revelando o extraordinário no ordinário.', NULL, 36, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(144, 'Recepção', 'Inicialmente mal compreendida, Clarice tornou-se ícone feminista e literário. Sua figura pública - mulher, estrangeira, de beleza glamourosa - contrastava com a profundidade de sua escrita. Hoje, inspira adaptações para cinema, teatro e artes visuais, além de estudos acadêmicos multidisciplinares.', NULL, 36, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(145, 'Técnica', '\"Show, dont tell\" ensina a apresentar experiências através de detalhes sensoriais, ações e diálogos, em vez de resumos abstratos. Em vez de \"Ela estava nervosa\", mostrar: \"Seus dedos tamborilavam na mesa, os olhos saltando do relógio para a porta\". Isso imerge o leitor na cena, permitindo que infira emoções e significados.', NULL, 37, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(146, 'Aplicações', 'A técnica é útil para: caracterização indireta (revelar personagens por ações), criação de atmosfera (descrever ambientes que evocam sentimentos), e desenvolvimento de tensão (mostrar pistas em vez de anunciar perigos). Memórias e narrativas jornalísticas também se beneficiam desse enfoque mais vívido.', NULL, 37, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(147, 'Equilíbrio', 'Embora poderosa, a técnica não deve eliminar totalmente o \"telling\", que é necessário para transições, resumos de períodos longos, ou informações contextuais. O segredo está em dosar - mostrar momentos-chave e contar o que conecta esses momentos. Autores como Hemingway usaram esse equilíbrio magistralmente.', NULL, 37, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(148, 'Exercícios', 'Praticar através de: transformar adjetivos em cenas (\"bondoso\" → \"ajudava vizinhos a carregar compras\"), reescrever resumos como cenas dramáticas, e criar descrições que impliquem emoções sem nomeá-las. Ferramentas como \"The Emotion Thesaurus\" auxiliam nesse processo.', NULL, 37, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(149, 'Origem', 'O fluxo de consciência (stream of consciousness) surgiu no modernismo, influenciado por teorias psicológicas sobre a mente associativa. Autores como Virginia Woolf (\"Mrs. Dalloway\"), James Joyce (\"Ulysses\") e William Faulkner capturam o pensamento em seu estado bruto - não-linear, fragmentado, mesclando memórias, sensações e associações livres.', NULL, 38, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(150, 'Técnicas', 'Para representar o fluxo mental, escritores usam: pontuação não-convencional, monólogos interiores, justaposição de tempos verbais, e rupturas sintáticas. Em Clarice Lispector, o fluxo muitas vezes culmina em epifanias; em Joyce, reproduz até os tropeços da mente pré-verbal.', NULL, 38, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(151, 'Desafios', 'Escrever (e ler) fluxo de consciência exige: abandonar expectativas de linearidade, tolerar ambiguidades, e capturar vozes mentais autênticas. O risco é criar textos caóticos ou autoindulgentes - o melhor fluxo equilibra espontaneidade e controle artístico.', NULL, 38, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(152, 'Variações', 'Técnicas relacionadas incluem: monólogo interior (mais estruturado), estilo indireto livre (narrativa em terceira pessoa que absorve a voz do personagem), e cut-up (colagem de fragmentos). Autores contemporâneos como David Foster Wallace atualizaram a técnica para a era da hiperestimulação.', NULL, 38, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(153, 'Conceito', 'Intertextualidade refere-se ao diálogo entre textos, onde uma obra referencia, parodia, reinterpreta ou ecoa outra. Pode ser explícita (citações, alusões) ou implícita (estruturas paralelas, arquétipos compartilhados). Desde a Bíblia até memes digitais, a cultura se constrói através dessa rede de significados compartilhados.', NULL, 39, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(154, 'Tipos', 'Gérard Genette classificou: paratextualidade (títulos, prefácios), metatextualidade (comentário crítico), arquitextualidade (gêneros), hipertextualidade (transformação de um texto anterior), e hipotextualidade (relação com textos-fonte). Práticas como fanfiction e remix culture são hipertextuais por excelência.', NULL, 39, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(155, 'Funções', 'A intertextualidade pode: homenagear tradições, criar ironia através do contraste, enriquecer significados através de camadas, ou subverter textos canônicos. Em \"Grande Sertão: Veredas\", Guimarães Rosa dialoga com a épica clássica; em \"Cem Anos de Solidão\", García Márquez reinventa mitos bíblicos.', NULL, 39, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(156, 'Exemplos', 'Casos famosos incluem: \"Ulysses\" de Joyce recontando a Odisseia, \"O Leitor\" de Bernhard Schlink problematizando a cultura letrada, e \"Cidade de Deus\" de Paulo Lins ressignificando tragédia grega no contexto favelado. Até plágios, quando descobertos, revelam-se formas perversas de intertextualidade.', NULL, 39, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(157, 'Disciplina', 'A narratologia estuda a estrutura e funcionamento das narrativas, independente de seu suporte (literatura, cinema, games). Derivada do formalismo russo e do estruturalismo francês, analisa elementos como: tempo narrativo (ordem, duração, frequência), foco narrativo (quem vê/quem narra), e modos de representação (diálogo, descrição).', NULL, 40, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(158, 'Conceitos-chave', 'Termos fundamentais incluem: diegese (universo da história), narrador (extradiegético, intradiegético), focalização (zero, interna, externa), e instâncias narrativas (autor implícito, narrador, leitor implícito). A análise separa história (o que é contado) de discurso (como é contado).', NULL, 40, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(159, 'Aplicações', 'A narratologia ajuda a: comparar adaptações de uma obra, entender efeitos de perspectiva (como narrativas não-confiáveis), e criar estruturas inovadoras. Teóricos como Gérard Genette, Mieke Bal e Seymour Chatman desenvolveram ferramentas para desmontar mecanismos narrativos complexos.', NULL, 40, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(160, 'Tendências', 'Novas narratologias estudam: narrativas transmídia (que atravessam plataformas), inteligência artificial como narrador, e formas não-humanas de narrar (como algoritmos de redes sociais). A pós-narratologia questiona modelos muito rígidos, incorporando cognição e recepção.', NULL, 40, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(161, 'Objeto de Estudo', 'A sociolinguística investiga como fatores sociais (classe, gênero, idade, etnia) influenciam a variação e mudança linguística. Analisa desde padrões fonéticos (como a pronúncia do \"r\" caipira) até escolhas lexicais (gírias jovens vs. linguagem formal), mostrando que a língua é um sistema heterogêneo e dinâmico.', NULL, 41, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(162, 'Métodos', 'Pesquisas usam: entrevistas sociolinguísticas, corpora de fala espontânea, e técnicas estatísticas para correlacionar variáveis linguísticas e sociais. O modelo de Labov sobre estratificação social da linguagem revolucionou o campo, mostrando padrões sistemáticos onde se via apenas \"erros\".', NULL, 41, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(163, 'Aplicações', 'Findings sociolinguísticos informam: políticas de educação bilíngue, planejamento linguístico, marketing (adaptação a públicos), e até investigações forenses (identificação por características de fala). No Brasil, estudos sobre preconceito linguístico ajudaram a valorizar variedades não-padrão.', NULL, 41, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(164, 'Tópicos Atuais', 'Tendências incluem: sociolinguística digital (variação em redes sociais), estudos sobre letramento crítico, e abordagens queer da linguagem. Pesquisas brasileiras destacam-se em contato entre línguas (português-indígenas), e análise do português afro-brasileiro.', NULL, 41, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(165, 'Ramo da Linguística', 'A fonética estuda os sons da fala humana em seus aspectos articulatórios (como são produzidos), acústicos (propriedades físicas das ondas sonoras), e auditivos (como são percebidos). Diferencia-se da fonologia, que analiza o funcionamento dos sons em sistemas linguísticos específicos.', NULL, 42, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(166, 'Técnicas', 'Foneticistas usam: espectrogramas para visualizar formantes, palatografia para mapear contato língua-palato, e softwares como Praat para análise acústica. Estudos articulatórios avançados empregam ressonância magnética e ultrassom para observar órgãos fonadores em ação.', NULL, 42, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(167, 'Aplicações', 'Conhecimento fonético é essencial para: ensino de pronúncia de línguas estrangeiras, desenvolvimento de sistemas de reconhecimento de fala, terapia fonoaudiológica, e preservação de línguas ameaçadas (documentação sonora). Cantores e atores também se beneficiam desse entendimento.', NULL, 42, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(168, 'Descobertas', 'Pesquisas revelaram: variações dialetais em microtraços articulatórios, padrões universais na aquisição fonética infantil, e adaptações neurológicas ao processar sons não-nativos. Estudos sobre cochichos, cantos e fala em ambientes ruidosos expandem nosso entendimento da produção vocal.', NULL, 42, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(169, 'Mudanças Principais', 'O Acordo Ortográfico de 1990 (efetivo no Brasil desde 2016) buscou unificar 98% da escrita nos países lusófonos. Principais alterações: eliminação do trema (exceto nomes próprios), novas regras para hífen (prefixos + palavras iniciadas por h ou vogal igual), e inclusão de k, w, y no alfabeto. Acento diferencial sumiu em \"pára\" (verbo) e \"pêlo\".', NULL, 43, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(170, 'Controvérsias', 'O acordo gerou debates sobre: custos da transição (mudança em livros, sistemas), suposta submissão ao português europeu, e perturbação desnecessária. Críticos argumentam que unificação é ilusória (pronúncias continuam diversas) e que mudanças como o fim do trema prejudicam a clareza.', NULL, 43, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(171, 'Adaptação', 'Para se adequar: dicionários eletrônicos atualizam automaticamente, corretores ortográficos incorporam as regras, e guias práticos explicam casos dúbios (como \"micro-ondas\" vs \"microondas\"). Aprendizado na escola agora enfatiza variações aceitáveis (como \"facto\"/\"fato\") sem penalizar usos regionais.', NULL, 43, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(172, 'Impacto', 'Estudos mostram que: gerações escolarizadas pós-acordo internalizaram as regras rapidamente, mas adultos mantêm hábitos anteriores. A escrita digital (com autocorreção) acelerou a transição. Português se tornou mais inclusivo de variantes africanas, mas resistências persistem em Portugal.', NULL, 43, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(173, 'Tipos', 'Palavras estrangeiras são incorporadas por: empréstimo puro (\"shopping\"), tradução (\"vale-refeição\" do inglês \"meal voucher\"), ou decalque (\"hora de ouro\" de \"golden hour\"). Podem manter pronúncia original (\"delivery\") ou aportuguesada (\"debitar\"). Neologismos como \"printar\" (de \"print\") mostram a criatividade nesse processo.', NULL, 44, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(174, 'Atitudes', 'Reações variam da purista (rejeição de estrangeirismos) à descritivista (aceitação do uso real). No Brasil, termos tecnológicos em inglês são amplamente adotados (\"site\", \"feed\"), enquanto Portugal prefere traduções (\"sítio\", \"alimentação\"). Setores como direito e medicina mantêm mais latinismos.', NULL, 44, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(175, 'Impactos', 'Estrangeirismos podem: enriquecer a língua (novos conceitos), causar ambiguidade (\"mouse\" animal/dispositivo), ou excluir falantes menos escolarizados. Empresas globais desenvolvem guias de localização para adaptar termos a cada mercado, enquanto governos promovem alternativas (França com \"courriel\" para \"email\").', NULL, 44, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(176, 'Tendências', 'A internet acelerou a circulação de estrangeirismos, especialmente no vocabulário digital (\"hashtag\", \"fake news\"). Novos fenômenos incluem: \"emojis\" como léxico universal, misturas como \"portunhol\" em fronteiras, e resistências através de movimentos como \"orgulho linguístico\" em comunidades minoritárias.', NULL, 44, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(177, 'Ferramentas Essenciais', 'Dominar Photoshop exige compreender: layers (organização não-destrutiva), selection tools (máscaras, canais alpha), adjustment layers (correções reversíveis), e blending modes (como multiplicar ou overlay). Ferramentas como clone stamp, content-aware fill e healing brush são fundamentais para retoques profissionais.', NULL, 45, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(178, 'Workflows', 'Profissionais desenvolvem fluxos como: tratamento de fotos (sequência RAW → lens corrections → exposure → color grading → retouch), composição digital (montagens realistas com matching de luz/sombra), ou design gráfico (criação de mockups e materiais promocionais). Atalhos personalizados e actions automatizam tarefas repetitivas.', NULL, 45, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(179, 'Técnicas Avançadas', 'Habilidades premium incluem: dodge & burn não-destrutivo, frequency separation para retoques de pele, color grading com LUTs, e manipulações 3D com Photoshop Extended. Integração com Lightroom (para fotógrafos) e Illustrator (para designers) amplia possibilidades criativas.', NULL, 45, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(180, 'Aprendizado', 'Recursos para aprender: tutoriais da Adobe, cursos especializados (Phlearn, KelbyOne), desafios como \"Daily Photoshop Challenge\", e comunidades no Behance/Dribbble. Versões recentes adicionaram AI (Neural Filters) e melhorias em seleção de objetos e preenchimento contextual.', NULL, 45, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(181, 'Estética', 'Pixel art celebra a restrição como virtude criativa - cada pixel é colocado intencionalmente, evocando jogos retrô e hardware antigo. Estilos variam do minimalista (1-bit) ao detalhado (32-bit era SNES), com técnicas como dithering (mistura óptica de cores) e anti-aliasing manual para suavizar curvas.', NULL, 46, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(182, 'Ferramentas', 'Artistas usam: Aseprite (especializado), Photoshop (com configurações específicas), ou até MS Paint. Paletas de cores limitadas (como EGA 16-color ou PICO-8) impõem restrições criativas. Animação frame-by-frame exige planejamento de spritesheets e timing.', NULL, 46, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(183, 'Aplicações', 'Além de jogos indies (Celeste, Stardew Valley), pixel art aparece em: NFTs colecionáveis, vinhetas de TV, e até arte generativa. Seu charme nostálgico convive com inovações como shaders dinâmicos e iluminação em tempo real sobre sprites pixelados.', NULL, 46, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(184, 'Comunidade', 'Festivais como Pixel Jam e fóruns como Pixel Joint compartilham técnicas e promovem a arte. Desafios comuns incluem: criar dentro de resoluções extremas (16x16), imitar estilos de consoles específicos, ou traduzir fotos reais para pixel art mantendo reconhecibilidade.', NULL, 46, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(185, 'Fundamentos', 'A regra dos terços divide o frame em 9 partes iguais (2 linhas horizontais e 2 verticais). Elementos-chave devem alinhar-se com essas linhas ou seus cruzamentos (pontos de ouro). O horizonte numa paisagem, por exemplo, fica melhor na linha inferior (ênfase no céu) ou superior (ênfase no solo), raramente no centro.', NULL, 47, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(186, 'Psicologia', 'A assimetria criada pela regra gera tensão visual mais interessante que composições centradas. Estudos de eye-tracking mostram que olhos naturalmente percorrem os pontos de ouro antes do centro. A regra deriva da proporção áurea, presente em diversas manifestações artísticas históricas.', NULL, 47, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(187, 'Variações', 'Além da versão 3x3, composições podem usar: espirais áureas (que conduzem o olhar), triângulos dinâmicos, ou a \"regra das odds\" (números ímpares de elementos são mais agradáveis). Fotógrafos frequentemente combinam múltiplas guias de composição numa mesma imagem.', NULL, 47, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(188, 'Quebrando a Regra', 'Composições centradas funcionam para: retratos formais, simetrias arquitetônicas, ou quando se busca impacto direto. Saber quando seguir ou quebrar a regra diferencia amadores de profissionais - a regra deve servir à mensagem, não limitar a criatividade.', NULL, 47, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(189, 'Técnica', 'Fotografia de longa exposição usa tempos de obturação prolongados (de segundos a horas) para capturar a passagem do tempo. Requer: tripé estável, controle manual de exposição (prioridade de abertura ou modo bulb), e muitas vezes filtros ND para reduzir entrada de luz. Resultados típicos incluem: água aveludada, rastros de luz, e cidades sem pessoas.', NULL, 48, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(190, 'Cenários', 'Aplicações comuns: cachoeiras e marés (efeito seda), tráfego noturno (rastros de faróis), astrofotografia (startrails), e light painting (desenhar com fontes luminosas). Fotógrafos exploram criativamente a técnica para abstrações ou documentar processos lentos (construções, mudança de estações).', NULL, 48, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(191, 'Desafios', 'Problemas frequentes: overexposure mesmo com ISO mínimo e abertura fechada (requer filtros ND fortes), vibration reduction que deve ser desligado, e hot pixels em exposições muito longas. Fotógrafos levam lanternas para ajustes no escuro e apps para calcular exposição com filtros.', NULL, 48, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(192, 'Pós-processamento', 'Longas exposições frequentemente exigem: redução de ruído (especialmente em sombras), ajuste de white balance (luz artificial cria dominantes), e às vezes compositing (combinar múltiplas exposições). Técnicas como time stacking (empilhar fotos sequenciais) simulam o efeito sem filtros ND.', NULL, 48, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(193, 'Princípios', 'O turismo sustentável busca minimizar impactos ambientais, respeitar culturas locais, e gerar benefícios econômicos para comunidades anfitriãs. Diretrizes incluem: preferir acomodações eco-certificadas, reduzir pegada de carbono (transporte terrestre vs aéreo), e apoiar negócios locais em vez de cadeias globais.', NULL, 49, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(194, 'Certificações', 'Selo GSTC (Global Sustainable Tourism Council) valida operadores comprometidos com: conservação de recursos, proteção à biodiversidade, e condições justas de trabalho. Programas como Rainforest Alliance e EarthCheck oferecem certificação para hotéis. Viajantes podem consultar plataformas como BookDifferent para opções sustentáveis.', NULL, 49, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(195, 'Destinos', 'Exemplos de boas práticas: Costa Rica (30% do território protegido, energia renovável), Butão (turismo de alto valor/baixo volume), e Fernando de Noronha (limite de visitantes, taxa de preservação). Cidades como Barcelona e Amsterdã combatem overtourism com regulamentação e taxação.', NULL, 49, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(196, 'Tendências', 'Novos modelos incluem: volunturismo (combina viagem e trabalho social), ecoturismo regenerativo (que melhora áreas degradadas), e slow travel (permanências longas com imersão cultural). A pandemia acelerou demanda por destinos menos massificados e acomodações com espaços abertos.', NULL, 49, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(197, 'Diversidade', 'O Brasil abriga 6 biomas continentais: Amazônia (maior floresta tropical), Cerrado (savana mais biodiversa), Mata Atlântica (hotspot ameaçado), Caatinga (exclusivamente brasileira), Pampa (campos sulinos), e Pantanal (maior área úmida). Cada um possui clima, solo, flora e fauna distintivos, além de culturas humanas adaptadas.', NULL, 50, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(198, 'Ameaças', 'Principais riscos: Amazônia (desmatamento para agropecuária), Cerrado (expansão da soja), Mata Atlântica (fragmentação urbana), Caatinga (desertificação), Pampa (conversão em silvicultura), e Pantanal (queimadas e hidrovias). Mudanças climáticas exacerbam esses processos, com savanização da Amazônia como cenário preocupante.', NULL, 50, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(199, 'Conservação', 'Estratégias de proteção incluem: unidades de conservação (parques, reservas), corredores ecológicos, pagamento por serviços ambientais, e manejo sustentável por comunidades tradicionais. Projetos como ARPA (Amazônia) e Pacto pela Restauração da Mata Atlântica buscam escalar esforços.', NULL, 50, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(200, 'Turismo Responsável', 'Cada bioma oferece experiências únicas: observação de onças-pintadas no Pantanal, trilhas na Chapada Diamantina (Caatinga), mergulho em Abrolhos (Mata Atlântica marinha). Operadores sérios seguem códigos de conduta para minimizar impactos e envolver guias locais.', NULL, 50, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(201, 'Cultura e História', 'A comida de rua reflete a alma culinária de cada lugar, desde os tacos mexicanos até os banh mi vietnamitas. No Brasil, evoluiu dos tabuleiros coloniais para uma cena vibrante com pastel de feira, acarajé baiano, e gourmetizações como hot dogs artesanais. Esses alimentos contam histórias de migração, adaptação e criatividade popular.', NULL, 51, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(202, 'Segurança Alimentar', 'Consumir comida de rua com segurança requer observar: higiene do vendedor (luvas, touca), temperatura dos alimentos (cuidado com maionese exposta), movimento do local (alta rotatividade indica frescor), e água para lavagem de utensílios. Cidades como Singapura implementaram rigorosos programas de capacitação para vendedores.', NULL, 51, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(203, 'Tendências', 'A cena contemporânea mistura tradição e inovação: food trucks com cozinha de autor, redes sociais divulgando pontos obscuros, e fusões como esfirras árabes com recheios brasileiros. Eventos como feiras noturnas e festivais de comida de rua tornaram-se programas culturais.', NULL, 51, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(204, 'Sustentabilidade', 'Desafios incluem: reduzir plásticos descartáveis (muitos vendedores adotam embalagens comestíveis ou biodegradáveis), aproveitamento integral de alimentos, e inclusão de produtores locais. Projetos como \"Comida Invisível\" combatem o desperdício na comida de rua.', NULL, 51, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(205, 'Conceito', 'Fusion food combina técnicas e ingredientes de tradições culinárias distintas, resultando em pratos como sushi brasileiro (com manga e cream cheese) ou ramen mexicano. Diferente da mestiçagem culinária histórica (como a culinária peruano-japonesa), a fusão moderna é intencional e frequentemente gourmet.', NULL, 52, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(206, 'Críticas', 'Alguns puristas consideram a fusão como apropriação cultural, especialmente quando chefs privilegiados lucram com tradições marginalizadas. Fusões bem-sucedidas respeitam a essência das cozinhas originais e dão crédito às inspirações, evitando exotização superficial.', NULL, 52, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(207, 'Exemplos', 'Casos celebrados incluem: kofta de berinjela com tahine (fusão árabe-mediterrânea), tacos de peixe com kimchi (coreano-mexicano), e moqueca de banana-da-terra (afro-indígena contemporânea). Restaurantes como Nobu popularizaram a fusão japonesa-peruana globalmente.', NULL, 52, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(208, 'Tendências', 'Novas fronteiras da fusão exploram: ingredientes amazônicos em técnicas francesas, fermentações ancestrais em pratos modernos, e \"hyper-local fusion\" que combina vizinhanças específicas (como culinária paulistana misturando Bixiga e Liberdade). A fusão também entra em drinks e sobremesas.', NULL, 52, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(209, 'Técnica', 'A esferificação, popularizada por Ferran Adrià, transforma líquidos em esferas gelatinosas através de reação entre alginato (extraído de algas) e cálcio. Existem dois métodos: básico (esfera com líquido dentro e pele fina) e reverso (pele mais espessa, líquido externo). O resultado são \"caviar\" ou \"ovos\" que explodem na boca.', NULL, 53, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(210, 'Aplicações', 'Chefs usam a técnica para: azeites em forma de caviar, cóquetis encapsulados, ou molhos que se rompem ao cortar. Versões caseiras simplificadas usam kits com ingredientes pré-dosados. A esferificação permite brincar com expectativas - uma esfera transparente pode revelar sabores surpreendentes.', NULL, 53, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(211, 'Desafios', 'Problemas comuns incluem: esferas que colam umas às outras, tempo de reação muito rápido para trabalhar, e sabores alterados pelo alginato. Ajustar pH (com citrato de sódio) e temperatura dos banhos melhora resultados. Esferas devem ser servidas imediatamente - não armazenam bem.', NULL, 53, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(212, 'Variantes', 'Técnicas relacionadas incluem: gelificação (com agar ou gellan), espessamento (com xantana), e emulsificação (como aires). A \"esferificação invertida\" é mais fácil para líquidos com cálcio natural (como leite), enquanto a básica funciona melhor com sucos ácidos.', NULL, 53, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(213, 'Uso Culinário', 'O nitrogênio líquido (-196°C) permite técnicas como: congelamento ultra-rápido (criando texturas cremosas sem cristais de gelo), \"fritura\" de sorvetes, e efeitos dramáticos de fumaça. Restaurantes como o Alinea usam para criar pratos performáticos, onde componentes são finalizados à mesa.', NULL, 54, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(214, 'Segurança', 'Manusear requer: luvas criogênicas, óculos de proteção, e ambientes ventilados (para evitar asfixia por deslocamento de oxigênio). Alimentos tratados devem \"descansar\" para que o nitrogênio residual evapore - nunca consumir imediatamente após contato. Treinamento adequado previne queimaduras graves.', NULL, 54, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(215, 'Aplicações', 'Além de sorvetes, cria: mousses aéreas, \"rocas\" de chocolate que quebram dramaticamente, e instantâneos como congelar ervas para esfarelar sobre pratos. Barmen usam para rapidamente resfriar copos ou criar coquetis com cascas congeladas que estouram ao beber.', NULL, 54, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(216, 'Alternativas', 'Para quem não tem acesso a nitrogênio, técnicas similares (menos extremas) usam: dry ice (gelo seco) para efeitos de fumaça, ou álcool isopropílico com gelo para congelamento rápido. Kits de cozinha molecular caseiros oferecem versões mais seguras de algumas técnicas.', NULL, 54, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(217, 'Processo', 'A fermentação natural de pães utiliza levain (massa mãe) - uma cultura simbiótica de leveduras (como Saccharomyces) e bactérias lácticas desenvolvida ao longo de dias. Diferente do fermento industrial, produz pães com sabor complexo (notas ácidas e frutadas), melhor digestibilidade, e maior shelf life.', NULL, 55, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(218, 'Técnicas', 'Manter um starter vivo requer: alimentação regular (farinha e água), temperaturas estáveis, e descartes periódicos. Padeiros ajustam variáveis como hidratação, temperatura de fermentação (bulk vs cold proof), e dobramentos para controlar acidez e estrutura da massa. Fermentações longas (até 24h) desenvolvem sabores profundos.', NULL, 55, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(219, 'Benefícios', 'Além de qualidades sensoriais, pães de fermentação natural têm: índice glicêmico mais baixo, maior disponibilidade de nutrientes (fitato reduzido), e diversidade microbiana potencialmente benéfica. Alguns portadores de sensibilidade ao glúten toleram melhor esses pães.', NULL, 55, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(220, 'Cultura', 'A arte do sourdough teve revival recente, com comunidades online trocando starters (alguns com décadas) e técnicas. Durante a pandemia, a escassez de fermento biológico levou muitos a experimentarem a fermentação natural caseira, documentando jornadas no Instagram.', NULL, 55, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(221, 'Criação', 'Uma massa madre (ou levain) inicia-se misturando farinha e água e deixando capturar leveduras ambientais. Nos primeiros dias, bactérias indesejáveis dominam (fase de \"falso crescimento\"), até leveduras benéficas estabelecerem-se. Sinais de saúde incluem bolhas regulares e aroma agradavelmente ácido (não putrefato).', NULL, 56, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(222, 'Manutenção', 'Massas madres ativas requerem: alimentação com farinha integral ou branca (ou mistura), água sem cloro, e descartes para renovar população microbiana. Guardadas na geladeira, podem ser alimentadas semanalmente; em temperatura ambiente, diariamente. Alguns starters especializam-se em farinhas específicas (centeio, espelta).', NULL, 56, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(223, 'Problemas', 'Issues comuns incluem: starter \"faminto\" (líquido por cima, cheiro alcoólico), excesso de acidez (requer alimentações mais frequentes), ou contaminação (cores anormais, mofo). A maioria pode ser recuperada com descartes e alimentações consistentes. Starters podem ser desidratados para armazenamento ou envio.', NULL, 56, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(224, 'Variedades', 'Diferentes regiões desenvolveram starters únicos: o levain francês (mais ácido), o biga italiano (mais hidratado), ou o poolish (pre-fermento líquido). Pesquisas com starters históricos (como de cervejarias antigas) buscam resgatar sabores perdidos.', NULL, 56, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(225, 'Fundamentos', 'Mixar é balancear elementos de uma música (vocais, instrumentos) no espaço estéreo e espectral. Começa com: balanceamento de volumes (faders), panning (posicionamento esquerdo-direito), e equalização (EQ) para evitar sobreposição frequencial. O objetivo é clareza - cada elemento deve ser ouvido distintamente.', NULL, 57, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(226, 'Técnicas Iniciais', 'Passos básicos incluem: cortar frequências baixas desnecessárias (high-pass filter), criar espaço para vocais com EQ (cortar mids em instrumentos), e usar compressão leve para controlar dinâmica. Reverb e delay são adicionados com moderação para profundidade, sem embolar o mix.', NULL, 57, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(227, 'Ferramentas', 'DAWs (Digital Audio Workstations) como Ableton Live, Logic Pro ou Pro Tools oferecem: equalizadores paramétricos, compressores, e visualizadores de espectro. Plugins como iZotope Neutron ajudam iniciantes com sugestões automáticas de balanceamento. Monitores de estúdio (não fones comuns) são essenciais.', NULL, 57, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(228, 'Erros Comuns', 'Iniciantes frequentemente: exageram em baixos e altos (mix \"sorridente\"), sobrecarregam o centro (panning tudo no meio), ou abusam de efeitos. Referenciar mixes profissionais em sistemas variados (carro, celular) ajuda a identificar problemas. Paciência é chave - ouvidos cansados perdem objetividade.', NULL, 57, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(229, 'Objetivo', 'Masterização é o polimento final que prepara uma mixagem para distribuição, garantindo consistência entre faixas e adequação a padrões de loudness (como -14 LUFS para streaming). Envolve: equalização sutil, compressão multibanda, limitação de pico, e ajustes estéreo, sem alterar drasticamente o balanceamento do mix.', NULL, 58, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(230, 'Processo', 'Engenheiros de masterização usam: equalizadores lineares (como Weiss), compressores vari-mu (tubo), e limitadores precisos (como FabFilter Pro-L 2). Analisadores (LUFS, espectro, fase) guiam decisões. O \"master bus\" recebe processamento leve, diferente da mixagem onde cada trilha é tratada individualmente.', NULL, 58, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(231, 'Formatos', 'Diferentes plataformas exigem masters específicos: vinil requer corte de baixos extremos e mono abaixo de 150Hz, streaming pede headroom (não maximizar a 0dB), e rádio solicita versões com menos compressão. Stem mastering (grupos de instrumentos) oferece mais flexibilidade que mixagem estéreo.', NULL, 58, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(232, 'DIY vs Profissional', 'Artistas independentes usam serviços como LANDR ou plugins como iZotope Ozone para auto-masterização, mas um engenheiro experiente traz: ouvidos treinados, ambiente acústico tratado, e equipamento de alta qualidade. Para lançamentos importantes, o investimento geralmente vale a pena.', NULL, 58, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(233, 'Tipos', 'Escalas são sequências de notas que formam a base de melodias e harmonias. Principais tipos: maior (alegre, estável), menor (triste, com variantes natural, harmônica e melódica), pentatônica (5 notas, comum no blues), e modais (dórico, frígio etc., cada um com \"personalidade\" distinta).', NULL, 59, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(234, 'Construção', 'Escalas são definidas por intervalos entre notas: a maior segue T-T-ST-T-T-T-ST (T=tom, ST=semitom). No piano, a escala de Dó maior usa apenas teclas brancas. Transpor para outras tonalidades exige sustenidos ou bemóis para manter a sequência intervalar. O círculo de quintas mostra relações entre tonalidades.', NULL, 59, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(235, 'Uso Prático', 'Compositores escolhem escalas para evocar emoções: lídio (sonho), mixolídio (rock/blues), ou escala cromática (tensão). Improvisadores aprendem \"formas\" de escalas no braço do violão. Produções eletrônicas frequentemente usam escalas sintéticas (como escala hexafônica) para timbres futuristas.', NULL, 59, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(236, 'Culturas', 'Diferentes tradições desenvolveram escalas únicas: maqam árabe (quartos de tom), raga indiano (microtonalidades), ou pelog javanês (5 notas assimétricas). A música ocidental contemporânea redescobre essas possibilidades através da world music e do jazz fusion.', NULL, 59, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(237, 'Acordes', 'Harmonia estuda como notas soam juntas. Acordes triádicos (3 notas) são classificados como: maior (fundamental+3ªM+5ªJ), menor (3ªm), aumentado (5ªA) ou diminuto (3ªm+5ªD). Tétrades adicionam a 7ª (como dominante7: 3ªM+5ªJ+7ªm). Progressões como I-V-vi-IV são onipresentes na pop music.', NULL, 60, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(238, 'Funções', 'Na tonalidade, acordes têm funções: tônica (repouso, grau I), dominante (tensão, V), e subdominante (ponte, IV). O ciclo V-I (cadência perfeita) cria forte sensação de resolução. Jazz expande com substituições (IIm7 no lugar de IV) e acordes estendidos (9ª, 11ª, 13ª).', NULL, 60, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(239, 'Voicing', 'Posicionamento das notas do acorde (voicing) afeta o som: posição feita (notas próximas) soam compactas, abertas (espaçadas) são mais ricas. Inversões (não-fundamental no baixo) suavizam progressões. Pianistas e arranjadores estudam voice leading (movimento suave entre vozes).', NULL, 60, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(240, 'Exercícios', 'Para praticar: tocar progressões em todas as 12 tonalidades, analisar harmonias de músicas conhecidas, e experimentar reharmonizações (trocar acordes mantendo a melodia). Apps como iReal Pro oferecem backing tracks para improvisação sobre diferentes progressões.', NULL, 60, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(241, 'Exercícios Básicos', 'O kettlebell permite movimentos balísticos e de força: swing (base para outros exercícios, trabalfa cadeia posterior), goblet squat (pernas e core), turkish get-up (coordenação total), e press militar (ombros). Técnica adequada previne lesões - iniciantes devem focar em hinge (dobrar quadril, não coluna) no swing.', NULL, 61, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(242, 'Benefícios', 'Treinos com kettlebell desenvolvem: força explosiva (devido ao centro de massa deslocado), resistência cardiovascular (circuitos elevam frequência cardíaca), e mobilidade (exercícios como halo melhoram amplitude articular). É eficiente para quem tem pouco tempo ou espaço.', NULL, 61, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL);
INSERT INTO `contents` (`id`, `name`, `description`, `image`, `item_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(243, 'Programação', 'Rotinas populares incluem: EMOM (Every Minute On the Minute), complexos (sequências sem soltar o peso), e protocolos como Simple & Sinister (100 swings + 10 get-ups). Peso inicial varia: homens 16-24kg, mulheres 8-16kg para swings; menos para exercícios overhead.', NULL, 61, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(244, 'Segurança', 'Precauções incluem: aquecimento articular (especialmente ombros e quadril), espaço livre para balançar, e atenção à fadiga (técnica degradada causa lesões). Kettlebells devem ser de aço fundido (não plástico com pesos ajustáveis) para dinâmica adequada.', NULL, 61, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(245, 'Metodologia', 'HIIT (High-Intensity Interval Training) alterna períodos curtos de esforço máximo (85-100% FCmax) com recuperação ativa ou passiva. Protocolos comuns: Tabata (20s on/10s off), Little-Gibbards (60s/60s), ou personalizados (ex: 30s sprint/90s caminhada). A vantagem é conseguir benefícios cardiovasculares em sessões curtas (15-30min).', NULL, 62, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(246, 'Variações', 'Pode ser adaptado para: corrida (esteira ou outdoor), ciclismo (spinning), bodyweight (burpees, mountain climbers), ou equipamentos (remo, battle ropes). CrossFit incorpora princípios HIIT em WODs (Workouts of the Day). Versões low-impact usam elíptico ou natação.', NULL, 62, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(247, 'Benefícios', 'Estudos mostram que HIIT: melhora VO2max mais que cardio estável, aumenta EPOC (consumo de oxigênio pós-treino, \"afterburn effect\"), e preserva massa muscular melhor que endurance tradicional. É eficiente para quem busca perda de gordura com tempo limitado.', NULL, 62, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(248, 'Precauções', 'HIIT não é para todos: iniciantes devem progredir de cardio moderado, e pessoas com condições cardíacas precisam de liberação médica. Sinais de excesso incluem fadiga prolongada, desempenho decrescente, ou distúrbios do sono. Recomenda-se 2-3 sessões semanais não consecutivas.', NULL, 62, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(249, 'Nutrientes', 'A nutrição pré-treino visa fornecer energia e prevenir catabolismo. Carboidratos de médio índice glicêmico (aveia, batata-doce) 1-2h antes sustentam performance. Proteínas (whey, ovos) ajudam a iniciar síntese proteica. Gorduras boas (abacate, oleaginosas) são melhores em treinos de endurance.', NULL, 63, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(250, 'Timing', 'Refeições maiores (500+ kcal) devem ser 2-3h antes, enquanto lanches leves (banana com pasta de amendoim) são ideais 30-60min antes. Treinos em jejum (apenas com água ou café preto) podem queimar mais gordura, mas reduzem intensidade possível - melhor para atividades leves/moderadas.', NULL, 63, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(251, 'Suplementos', 'Comuns incluem: cafeína (200-400mg para energia/foco), beta-alanina (reduz fadiga em exercícios anaeróbicos), e citrulina malato (melhora vasodilatação). Evitar excessos que causam dependência ou picos/crashes de energia. Novatos devem testar suplementos em treinos não-críticos.', NULL, 63, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(252, 'Hidratação', 'Começar exercícios já hidratado é crucial - urina clara é bom indicador. Bebidas eletrolíticas ajudam se suar muito. Evitar álcool 24h antes (desidrata) e excesso de fibras imediatamente antes (desconforto gastrointestinal).', NULL, 63, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(253, 'Pós-Treino', 'A \"janela anabólica\" ideal é até 2h após exercício. Consumir proteína (0.4g/kg peso) e carboidratos (3:1 ou 4:1 relação CHO:PRO para endurance) acelera recuperação muscular. Whey protein é absorvido rapidamente; caseína (queijo cottage) fornece aminoácidos sustentados para noite.', NULL, 64, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(254, 'Técnicas', 'Além de nutrição: sono de qualidade (hormônio do crescimento repara tecidos), foam rolling (liberação miofascial), e mobilidade ativa (alongamento dinâmico). Banhos de contraste (água quente/fria) reduzem dor muscular de início tardio (DMIT). Atividade leve (caminhada) no dia seguinte melhora circulação.', NULL, 64, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(255, 'Suplementos', 'Opções com evidência: creatina (recarrega ATP, reduz fadiga), BCAA (em treinos em jejum), tart cherry juice (anti-inflamatório), e magnésio (para relaxamento muscular). Cuidado com analgésicos - mascaram dor que é sinal importante.', NULL, 64, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(256, 'Monitoramento', 'Sinais de recuperação insuficiente incluem: frequência cardíaca elevada ao acordar, desempenho reduzido em treinos consecutivos, e irritabilidade. Apps como Whoop ou Oura Ring ajudam a rastrear readiness (prontidão) com base em variabilidade cardíaca e sono.', NULL, 64, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(257, 'Configurações', 'Iluminação de estúdio básica usa três pontos: key light (principal, 45º do assunto), fill light (preenche sombras, oposto à key), e back light (separa assunto do fundo). Modificadores como softboxes (luz difusa), beauty dishes (transição suave), ou grids (controle de spill) criam efeitos distintos.', NULL, 65, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(258, 'Equipamentos', 'Fotógrafos escolhem entre: strobes (flash de estúdio, potência ajustável), continuous lights (LED para vídeo), ou speedlites (flashes portáteis). Acessórios como refletores, flags (bloqueadores), e difusores moldam a luz. Medidores de luz garantem exposição precisa em sistemas manuais.', NULL, 65, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(259, 'Técnicas', 'Estilos variam: high-key (luz clara e aberta, poucas sombras), low-key (dramático, sombras profundas), Rembrandt lighting (triângulo de luz na bochecha), ou butterfly (sombra sob o nariz). Fotógrafos de beleza usam setups como clamshell (dois softboxes acima e abaixo) para pele lisa.', NULL, 65, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(260, 'Pós-Produção', 'Raw files permitem ajustar white balance e recuperar detalhes em highlights/shadows. Técnicas de dodge & burn refinam a iluminação. Plugins como Imagenomic Portraiture suavizam pele mantendo textura. A iluminação crua deve ser boa - edição só aprimora.', NULL, 65, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(261, 'Abordagens', 'Fotografia de retrato de rua varia entre: pedir permissão (conexão mais íntima), candid shots (autenticidade, mas questões éticas), ou mistas (iniciar interação após captura). Fotógrafos como Vivian Maier ou Bruce Gilden representam extremos desse espectro.', NULL, 66, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(262, 'Técnicas', 'Dicas práticas incluem: usar lentes 35mm ou 50mm para contexto ambiental, priorizar luz natural (golden hour ou sombras suaves), e buscar fundos não-distratores. Configurar câmera discretamente (pré-focar, modo silencioso) ajuda em cenas espontâneas. Predefinições manuais agilizam ajustes.', NULL, 66, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(263, 'Legalidade', 'Leis variam por país: locais públicos geralmente permitem fotos de pessoas (mas não uso comercial sem release). Boa prática incluir: ser transparente sobre intenções, respeitar recusas, e considerar contextos vulneráveis. Fotografar crianças exige especial cuidado.', NULL, 66, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(264, 'Edição', 'Retratos de rua frequentemente usam: preto e branco para atemporalidade, cortes apertados que destacam expressões, ou vignetting para direcionar olhar. Preservar imperfeições (rugas, texturas) mantém autenticidade. Série coesas contam histórias sobre comunidades.', NULL, 66, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(265, 'Seleções Complexas', 'Técnicas avançadas incluem: Select and Mask para cabelos, Color Range para isolamento por tom, e canais alpha para transparências. Seleções baseadas em luminosity masks permitem ajustes precisos em highlights/midtones/shadows. Plugins como TK8 automatizam processos complexos.', NULL, 67, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(266, 'Composição', 'Criar montagens realistas exige: matching de perspectiva (Vanishing Point), iluminação consistente (adicionar shadows/shine), e integração de texturas (blending modes como Overlay). Técnicas como displacement mapping fazem elementos seguirem superfícies irregulares.', NULL, 67, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(267, 'Retoque', 'Além do básico: frequency separation para pele (textura e cor em layers separados), dodge & burn não-destrutivo (50% gray layer em Overlay), e color grading com LUTs (Lookup Tables). O Content-Aware Fill moderno usa AI para preenchimentos convincentes.', NULL, 67, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(268, 'Automação', 'Actions registram sequências para aplicar em batches (redimensionar + sharpen + export). Scripts em JavaScript automatizam tarefas complexas. Integração com Bridge e Lightroom agiliza fluxos de trabalho fotográficos. O Generator exporta assets diretamente para web/mobile.', NULL, 67, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(269, 'Fluxo de Trabalho', 'Lightroom organiza fotos em: Library (seleção, keywords), Develop (ajustes), e módulos para output (print, web). Catálogos (não pastas físicas) mantêm referências a arquivos RAW. Coleções inteligentes filtram automaticamente por critérios como rating ou EXIF data.', NULL, 68, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(270, 'Ajustes', 'Ferramentas essenciais incluem: Basic panel (exposure, contrast), Tone Curve, HSL (ajuste seletivo de cores), e calibração de lente. O módulo Develop é não-destrutivo - ajustes são receitas aplicadas na exportação. Presets salvam combinações de ajustes para estilos consistentes.', NULL, 68, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(271, 'Gestão', 'Boas práticas: renomear arquivos na importação (data_nome), usar keywords e ratings, e estruturar em pastas por data/evento. Backup do catálogo é crucial. Smart Previews permitem editar sem HD externo conectado. Integração com Photoshop (Edit In) preserva não-destrutividade.', NULL, 68, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(272, 'Mobile', 'Lightroom CC sincroniza entre dispositivos via cloud. Versão mobile oferece: RAW editing, presets sincronizados, e captura em DNG. Fotógrafos usam para edição em campo (tablet + stylus) ou backup imediato via smartphone. Assinatura Creative Cloud é necessária para recursos completos.', NULL, 68, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(273, 'Técnicas', 'Meditação guiada utiliza instruções verbais para focar a mente: atenção na respiração, varredura corporal (body scan), ou visualizações (paisagens seguras). Diferente de práticas silenciosas, é acessível para iniciantes - apps como Headspace ou Calm oferecem centenas de sessões temáticas.', NULL, 69, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(274, 'Benefícios', 'Estudos mostram redução em: estresse (diminuição cortisol), ansiedade (modulação amígdala), e dor crônica (mudança percepção). Melhora foco (aumento matéria cinzenta pré-frontal) e regulação emocional. Sessões de 10-20min já produzem efeitos mensuráveis.', NULL, 69, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(275, 'Adaptações', 'Versões para necessidades específicas incluem: meditação para sono (indução theta waves), pré-competitiva (visualização de desempenho), ou dor (mindfulness-based pain management). Terapias como MBSR (Redução de Estresse Baseada em Mindfulness) estruturam programas de 8 semanas.', NULL, 69, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(276, 'Desafios', 'Iniciantes enfrentam: expectativas irreais (\"esvaziar a mente\"), frustração com pensamentos intrusivos (que são normais), e dificuldade em estabelecer rotina. Começar com sessões curtas (3-5min), usar âncoras físicas (sensação dos pés no chão), e não buscar \"performance\" ajudam.', NULL, 69, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(277, 'Padrões', 'Técnicas respiratórias produzem efeitos distintos: diafragmática (calmante, ativa sistema parassimpático), kapalabhati (energizante, rápida expiração), ou box breathing (4s inalar, 4s segurar, 4s exalar, 4s pausa) para foco. O simples \"5-5-5\" (inalar/segurar/exalar por 5s) reduz ansiedade aguda.', NULL, 70, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(278, 'Mecanismos', 'Respiração controlada influencia: pH sanguíneo (via retenção de CO2), variabilidade cardíaca (sincronização coração-pulmões), e atividade vagal (tono do nervo vago). Técnicas como a Coerência Cardíaca (6 respirações/min) otimizam esses efeitos fisiológicos.', NULL, 70, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(279, 'Aplicações', 'Práticas específicas ajudam em: desempenho esportivo (ritmo para nado ou corrida), manejo da raiva (respiração 4-7-8), ou preparação para falar em público (respiração abdominal). Cantores e atores usam exercícios para expandir capacidade pulmonar.', NULL, 70, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(280, 'Integração', 'A respiração consciente pode ser praticada em micro-momentos: antes de responder emails, em filas, ou ao acordar. Dispositivos como Spire ou Apple Watch dão feedback em tempo real. Apps como Breathwrk oferecem treinos personalizados por objetivo.', NULL, 70, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(281, 'Fundamentos', 'Asanas (posturas) de yoga para iniciantes incluem: mountain (Tadasana, alinhamento postural), downward dog (Adho Mukha Svanasana, alongamento cadeia posterior), warrior I e II (Virabhadrasana, fortalecimento pernas), e childs pose (Balasana, repouso). A ênfase está em alinhamento, não profundidade.', NULL, 71, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(282, 'Benefícios', 'Prática regular melhora: flexibilidade (alongamento fascial), força isométrica (especialmente core), equilíbrio (propriocepção), e consciência corporal. Posturas invertidas leves (como legs-up-the-wall) auxiliam drenagem linfática e relaxamento.', NULL, 71, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(283, 'Sequências', 'Vinyasas básicas conectam posturas com respiração: sun salutation (Surya Namaskar) é a sequência clássica para aquecer. Aulas para iniciantes focam em repetição para construir memória muscular, com modificações (blocos, cintos) para diferentes corpos.', NULL, 71, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(284, 'Precauções', 'Contraindicações incluem: hipertensão (evitar inversões), problemas lombares (modificar flexões à frente), ou gravidez (adaptar posturas compressivas). O mantra \"sem dor, sem ganho\" não se aplica - desconforto leve é normal, dor aguda é sinal de parar.', NULL, 71, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(285, 'Abordagens', 'Yoga terapêutico para dor crônica combina: posturas suaves (restorative yoga), respiração consciente (pranayama), e meditação. Sequências personalizadas aliviam lombalgia (posturas como cat-cow), dor no pescoço (alongamentos cervicais), ou fibromialgia (yin yoga passivo).', NULL, 72, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(286, 'Mecanismos', 'Estudos sugerem que yoga reduz dor através de: aumento de GABA (neurotransmissor inibitório), modulação da percepção dolorosa (córtex insular), e melhora na propriocepção (evitando movimentos prejudiciais). A atenção plena rompe o ciclo medo-tensão-dor.', NULL, 72, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(287, 'Protocolos', 'Programas como Yoga for Back Pain (Dr. Loren Fishman) prescrevem: posturas específicas para hérnias discais, osteoporose ou artrite. Ajustes com props (almofadas, cadeiras) tornam a prática acessível. Sessões curtas (15-20min) diárias superem aulas longas ocasionais.', NULL, 72, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(288, 'Evidências', 'Revisões sistemáticas mostram eficácia para: dor lombar (equivalente a fisioterapia), osteoartrite (melhora mobilidade), e enxaquecas (redução frequência). O Yoga Alliance mantém listas de professores certificados em yoga terapêutico.', NULL, 72, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(289, 'Conceito', 'Minimum Viable Product (MVP) é a versão mais simples de um produto que valida hipóteses centrais com o mínimo de esforço. Exemplos: Dropbox começou com vídeo demonstrando a funcionalidade, Zappos com site básico fotografando sapatos de lojas físicas. O foco está em aprender, não em perfeição.', NULL, 73, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(290, 'Construção', 'Para definir um MVP: identificar hipótese de valor principal (ex: \"usuários pagariam por entrega rápida de comida saudável\"), selecionar métricas de validação (taxa de conversão, retenção), e construir apenas features essenciais para testá-la. Landing pages, protótipos no Figma, ou concierge MVP (serviço manual por trás de fachada automatizada) são alternativas rápidas.', NULL, 73, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(291, 'Armadilhas', 'Erros comuns incluem: adicionar \"só mais uma feature\" antes de lançar, confundir MVP com produto low-quality, ou testar com público errado (early adopters vs mercado massivo). Um bom MVP deve ser descartável - muitas startups falham ao tentar escalar código escrito rapidamente para validação.', NULL, 73, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(292, 'Evolução', 'Após validação, o produto evolui através de feedback loops: medir comportamento real (não apenas pesquisas), priorizar melhorias (framework ICE: Impact, Confidence, Ease), e iterar rapidamente. O MVP do Facebook era diretório de faculdades; do Airbnb, aluguel de colchões em conferências.', NULL, 73, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(293, 'Definição', 'Pivotar é mudar fundamentalmente o modelo de negócios após evidências de que o caminho atual não é sustentável. Pode envolver: novo público-alvo (Slack começou como ferramenta interna para game developers), proposta de valor (Instagram pivotou de check-ins para fotos), ou canal de distribuição (Nintendo passou de cartas para videogames).', NULL, 74, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(294, 'Sinais', 'Indicadores para pivotar incluem: métricas estagnadas apesar de otimizações, feedback consistente sobre um diferencial não-planejado, ou mudanças no mercado (regulatórias, tecnológicas). Startups que falharam em pivotar (como Blockbuster rejeitando streaming) tornam-se estudos de caso.', NULL, 74, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(295, 'Tipos', 'Classificações comuns: zoom-in (uma feature torna-se o produto principal), zoom-out (produto atual vira feature de algo maior), ou mudança de arquitetura (YouTube começou como dating site com vídeos). Pivots devem preservar aprendizados e ativos anteriores, não ser reinícios totais.', NULL, 74, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(296, 'Execução', 'Pivotar com sucesso requer: comunicação clara à equipe/investidores, testes rápidos da nova direção (MVP do pivot), e corte limpo com operações não-alinhadas. O livro \"The Lean Startup\" de Eric Ries detalhe estratégias para pivotar com base em métricas, não apenas intuição.', NULL, 74, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(297, 'Estrutura', 'Pitchs eficazes contam histórias com: herói (cliente com problema), guia (sua empresa), plano (solução), chamado à ação (investimento/parceria), e visão de sucesso (futuro possível). O framework \"StoryBrand\" de Donald Miller ajuda a simplificar mensagens nessa estrutura.', NULL, 75, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(298, 'Técnicas', 'Táticas poderosas incluem: começar com dados surpreendentes (\"A cada 8 segundos, um negócio fecha por...\"), usar analogias (\"Uber para pet-sitters\"), e criar suspense (\"Há uma solução que 90% das empresas ignoram\"). O storytelling visual (uma imagem por slide) supera textos densos.', NULL, 75, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(299, 'Adaptação', 'Diferentes audiências exigem ênfases distintas: investidores querem tração e TAM (mercado total endereçável), clientes querem benefícios concretos, e talentos querem propósito. Versões de 1 minuto (elevator pitch), 5min e 15min devem estar preparadas.', NULL, 75, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(300, 'Erros', 'Armadilhas comuns: jargão excessivo, muita informação sobre \"como\" em vez de \"por que\", e não antecipar objeções (\"Você deve pensar que...\"). Gravar em vídeo e analisar postura, tom de voz e ritmo é tão importante quanto o conteúdo verbal.', NULL, 75, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(301, 'Design', 'Slides eficazes seguem: 1 ideia por slide, contraste alto (texto escuro em fundo claro), mínimo 30pt font size, e elementos visuais que complementam (não repetem) a fala. Templates como Guy Kawasaki 10/20/30 (10 slides, 20min, 30pt) ou Pitch Deck do Sequoia Capital oferecem estruturas testadas.', NULL, 76, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(302, 'Sequência', 'Ordem clássica: problema (dor aguda), solução (seu produto), mercado (TAM/SAM), tração (métricas), tecnologia (diferencial), equipe, competição (posicionamento único), modelo de negócio, projeções, e uso dos fundos. O slide de competição deve mostrar vantagem clara em 2-3 eixos.', NULL, 76, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(303, 'Visual', 'Elementos gráficos poderosos incluem: gráficos de adoção (hockey stick), antes/depois da solução, fluxos de usuário simplificados, e fotos reais de clientes (não stock). Ferramentas como Canva, Beautiful.ai ou Pitch.com oferecem templates profissionais para não-designers.', NULL, 76, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(304, 'Alternativas', 'Para contextos informais: demos ao vivo (mostrar, não contar), protótipos interativos (Figma, InVision), ou até abandonar slides (conversa com whiteboard). O princípio é adaptar ao público - VCs esperam certa estrutura, enquanto clientes B2B podem preferir casos de uso específicos.', NULL, 76, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(305, 'Tecnologia', 'Vasos inteligentes integram: sensores de umidade/PH/luz, reservatórios de água automáticos, e conectividade Wi-Fi para alertas. Modelos como Parrot Pot ou Xiaomi Flower Care usam baterias de longa duração e apps com recomendações específicas para cada espécie vegetal.', NULL, 77, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(306, 'Benefícios', 'Para usuários urbanos: reduz falhas na rega (principal causa de morte de plantas), indica momento ideal para adubar, e ensina sobre necessidades de cada planta. Jardins internos com vasos inteligentes podem ter taxa de sucesso 80% maior que métodos tradicionais.', NULL, 77, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(307, 'Limitações', 'Desafios incluem: custo alto por vaso (US$50-200), necessidade de recargas periódicas (água, nutrientes), e incompatibilidade com algumas espécies (como cactos que preferem secagem completa). Sistemas não substituem totalmente a observação humana para pragas ou doenças.', NULL, 77, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(308, 'Futuro', 'Próximas gerações prometem: integração com assistentes de voz (\"Alexa, regar a samambaia\"), reconhecimento de plantas por câmera para diagnósticos, e automação completa em jardins modulares. Startups exploram hidroponia doméstica conectada.', NULL, 77, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(309, 'Métodos', 'Compostar em pequenos espaços pode ser feito: vermicompostagem (minhocas processam resíduos em caixas empilháveis), composteiras elétricas (como Lomi, que acelera o processo), ou bokashi (fermentação anaeróbica em baldes). Apartamentos podem compostar até 70% de seus resíduos orgânicos.', NULL, 78, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(310, 'Benefícios', 'Além de reduzir lixo: produz adubo rico para plantas caseiras, evita emissões de metano (de aterros), e educa sobre ciclos naturais. Famílias médias geram ~150kg de resíduos compostáveis anualmente - transformados em 30-40kg de composto.', NULL, 78, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(311, 'Desafios', 'Barreiras comuns: odor (controlado com balanceamento de materiais secos/úmidos), insetos (usar tela fina), e aprendizado do que pode/não pode compostar (evitar carnes, laticínios). Inverno reduz atividade microbiana, alongando o processo.', NULL, 78, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(312, 'Comunidade', 'Alternativas coletivas incluem: pontos de entrega de orgânicos (transformados em compostos comunitários), apps como ShareWaste que conectam doadores a composteiras próximas, ou programas municipais de coleta seletiva de orgânicos.', NULL, 78, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(313, 'Tipos', 'Jardins verticais variam entre: painéis modulares (feltro ou plástico reciclado), estruturas treliçadas com vasos, ou paredes vivas (sistemas hidropônicos integrados). Soluções DIY usam paletes, garrafas PET ou canos PVC. Escolha depende de espaço, orçamento e plantas desejadas (suculentas vs folhagens).', NULL, 79, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(314, 'Plantas Ideais', 'Para iniciantes: samambaias (como Nephrolepis), herbáceas (peperômias, jiboia), ou suculentas resistentes (Sedum). Varandas ensolaradas permitem ervas (manjericão, alecrim). Sistemas automatizados expandem opções para morangos ou pequenos vegetais.', NULL, 79, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(315, 'Manutenção', 'Cuidados básicos incluem: irrigação por gotejamento (manual ou automatizada), poda regular para evitar sobrecarga, e fertilização quinzenal (soluções líquidas). Jardins hidropônicos requerem monitoramento de pH e nutrientes. Telas à prova dágua protegem paredes.', NULL, 79, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(316, 'Vantagens', 'Além da beleza: melhora qualidade do ar (filtragem de VOCS), reduz temperatura interna (evapotranspiração), e amplia espaços pequenos. Escritórios usam para bem-estar ocupacional - plantas aumentam produtividade em 15% segundo estudos.', NULL, 79, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(317, 'Importância', 'Plantas nativas estão adaptadas ao clima e solo locais, requerendo menos água, pesticidas e fertilizantes que espécies exóticas. Elas sustentam polinizadores e fauna regional - um jardim com 70% de nativas tem 10x mais diversidade de vida selvagem que um gramado tradicional.', NULL, 80, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(318, 'Seleção', 'No Brasil: árvores como ipê ou jabuticabeira, arbustos como quaresmeira ou pitanga, e herbáceas como trapoeraba ou clúsia. Projetos como \"Jardim de Mel\" da USP catalogam espécies atrativas para abelhas nativas. Viveiros especializados garantem procedência ética (não extrativismo).', NULL, 80, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(319, 'Desafios', 'Barreiras incluem: menor disponibilidade em garden centers convencionais, desconhecimento sobre cuidados específicos, e competição com plantas invasoras (como braquiária). Iniciativas como \"Semente Livre\" distribuem mudas de nativas ameaçadas.', NULL, 80, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(320, 'Tendências', 'Movimentos como \"Jardins de Apoio\" conectam quintais com corredores verdes para fauna. Arquitetura paisagística incorpora biomas locais em projetos comerciais. Legislações municipais começam a exigir porcentagem de nativas em novos loteamentos.', NULL, 80, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(321, 'Ervas Tradicionais', 'Plantas brasileiras com propriedades medicinais: boldo (digestivo), guaco (expectorante), capim-santo (calmante), e carqueja (hepática). Preparo adequado (infusão vs decocção) preserva princípios ativos - geralmente 1 colher de folhas secas por xícara de água, 5-10min de repouso.', NULL, 81, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(322, 'Evidências', 'Estudos validam: camomila (ansiolítica leve), hortelã-pimenta (alívio de IBS), e gengibre (anti-náusea). Chá verde (ECGC) tem efeitos neuroprotetores. Atenção: interações medicamentosas existem (erva-de-são-joão reduz efeito de anticoncepcionais). Fitoterapia deve ser orientada.', NULL, 81, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(323, 'Cultivo', 'Ervas medicinais prosperam em: vasos com boa drenagem (argila expandida no fundo), sol pleno (4-6h/dia), e colheita matinal (óleos essenciais mais concentrados). Secagem em feixes pendurados em local arejado preserva propriedades. Evitar pesticidas químicos.', NULL, 81, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(324, 'Precauções', 'Gestantes devem evitar: poejo, arruda e sene. Chás diuréticos (cavalinha) podem desequilibrar eletrólitos. \"Naturais\" não significa inócuos - doses excessivas de confrei (hepatotóxico) ou chapéu-de-napoleão (cardiotóxico) são perigosas. Consultar profissional qualificado.', NULL, 81, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(325, 'Culinária', 'Principais ervas e usos: manjericão (molho pesto, tomate), alecrim (carnes assadas, pães), tomilho (caldos, legumes), e salsinha (finalização). Combinações clássicas como \"bouquet garni\" (louro, tomilho, salsinha) aromatizam ensopados. Folhas frescas geralmente adicionadas no final para preservar sabor.', NULL, 82, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(326, 'Cultivo', 'Dicas para vasos: terra bem drenada (misturar areia), podas frequentes para estimular ramificação, e colheita regular (evitar floração, que amarga folhas). Janelas ensolaradas (4h sol/dia) sustentam a maioria. Hortelã é invasiva - plantar sozinha ou com barreira física.', NULL, 82, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(327, 'Preservação', 'Métodos caseiros: congelar em azeite (forminhas de gelo), secar em microondas (folhas entre papéis, 30s), ou fazer \"óleos aromáticos\" (ervas em azeite por 2 semanas). Sal de ervas (mistura seca com sal grosso) é tempero versátil.', NULL, 82, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL),
(328, 'Variedades', 'Além das tradicionais: experimentar estévia (adoçante natural), stevia (adocicante), ou microgreens (ervas colhidas jovens, com nutrição concentrada). Feiras de mudas oferecem variedades como manjericão-limão ou tomilho-laranja para explorar sabores.', NULL, 82, '2025-07-30 23:34:27', '2025-07-30 23:34:27', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `firsttimes`
--

CREATE TABLE `firsttimes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `editor` int(11) NOT NULL,
  `generic` int(11) NOT NULL,
  `index` int(11) NOT NULL,
  `indexcreator` int(11) NOT NULL,
  `main` int(11) NOT NULL,
  `veja` int(11) NOT NULL,
  `vejaeditor` int(11) NOT NULL,
  `base_create` int(11) NOT NULL,
  `base_edit` int(11) NOT NULL,
  `block_create` int(11) NOT NULL,
  `block_edit` int(11) NOT NULL,
  `generic_create` int(11) NOT NULL,
  `generic_edit` int(11) NOT NULL,
  `indexeditor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `firsttimes`
--

INSERT INTO `firsttimes` (`id`, `created_at`, `updated_at`, `user_id`, `editor`, `generic`, `index`, `indexcreator`, `main`, `veja`, `vejaeditor`, `base_create`, `base_edit`, `block_create`, `block_edit`, `generic_create`, `generic_edit`, `indexeditor`) VALUES
(1, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, '2025-07-30 22:52:46', '2025-07-30 22:52:46', 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, '2025-07-31 03:23:13', '2025-07-31 03:43:32', 24, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_creator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `followers`
--

INSERT INTO `followers` (`id`, `created_at`, `updated_at`, `id_user`, `id_creator`) VALUES
(1, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 1),
(2, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 1),
(3, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 1),
(4, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 1),
(5, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 1),
(6, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 1),
(7, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 8, 1),
(8, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 9, 1),
(9, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 10, 1),
(10, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 2),
(11, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 2),
(12, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 2),
(13, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 2),
(14, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 2),
(15, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 2),
(16, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 8, 2),
(17, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 9, 2),
(18, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 10, 2),
(19, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 3),
(20, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 3),
(21, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 3),
(22, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 3),
(23, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 3),
(24, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 3),
(25, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 8, 3),
(26, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 9, 3),
(27, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 10, 3),
(28, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 4),
(29, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 4),
(30, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 4),
(31, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 4),
(32, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 4),
(33, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 4),
(34, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 8, 4),
(35, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 9, 4),
(36, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 10, 4),
(37, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 5),
(38, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 5),
(39, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 5),
(40, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 5),
(41, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 5),
(42, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 5),
(43, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 8, 5),
(44, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 9, 5),
(45, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 10, 5),
(46, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 6),
(47, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 6),
(48, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 6),
(49, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 6),
(50, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 6),
(51, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 6),
(52, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 8, 6),
(53, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 9, 6),
(54, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 10, 6),
(55, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 7),
(56, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 7),
(57, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 7),
(58, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 7),
(59, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 7),
(60, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 7),
(61, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 8, 7),
(62, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 9, 7),
(63, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 10, 7),
(64, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 8),
(65, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 8),
(66, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 8),
(67, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 8),
(68, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 8),
(69, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 8),
(70, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 8),
(71, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 9, 8),
(72, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 10, 8),
(73, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 9),
(74, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 9),
(75, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 9),
(76, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 9),
(77, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 9),
(78, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 9),
(79, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 9),
(80, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 8, 9),
(81, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 10, 9),
(82, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 10),
(83, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 10),
(84, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 10),
(85, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 10),
(86, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 10),
(87, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 10),
(88, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 10),
(89, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 8, 10),
(90, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 9, 10),
(91, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 12, 11),
(92, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 13, 11),
(93, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 14, 11),
(94, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 15, 11),
(95, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 16, 11),
(96, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 17, 11),
(97, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 18, 11),
(98, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 19, 11),
(99, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 20, 11),
(100, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 11, 12),
(101, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 13, 12),
(102, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 14, 12),
(103, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 15, 12),
(104, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 16, 12),
(105, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 17, 12),
(106, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 18, 12),
(107, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 19, 12),
(108, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 20, 12),
(109, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 11, 13),
(110, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 12, 13),
(111, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 14, 13),
(112, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 15, 13),
(113, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 16, 13),
(114, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 17, 13),
(115, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 18, 13),
(116, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 19, 13),
(117, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 20, 13),
(118, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 11, 14),
(119, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 12, 14),
(120, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 13, 14),
(121, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 15, 14),
(122, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 16, 14),
(123, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 17, 14),
(124, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 18, 14),
(125, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 19, 14),
(126, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 20, 14),
(127, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 11, 15),
(128, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 12, 15),
(129, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 13, 15),
(130, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 14, 15),
(131, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 16, 15),
(132, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 17, 15),
(133, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 18, 15),
(134, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 19, 15),
(135, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 20, 15),
(136, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 11, 16),
(137, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 12, 16),
(138, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 13, 16),
(139, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 14, 16),
(140, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 15, 16),
(141, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 17, 16),
(142, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 18, 16),
(143, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 19, 16),
(144, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 20, 16),
(145, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 11, 17),
(146, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 12, 17),
(147, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 13, 17),
(148, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 14, 17),
(149, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 15, 17),
(150, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 16, 17),
(151, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 18, 17),
(152, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 19, 17),
(153, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 20, 17),
(154, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 11, 18),
(155, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 12, 18),
(156, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 13, 18),
(157, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 14, 18),
(158, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 15, 18),
(159, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 16, 18),
(160, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 17, 18),
(161, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 19, 18),
(162, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 20, 18),
(163, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 11, 19),
(164, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 12, 19),
(165, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 13, 19),
(166, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 14, 19),
(167, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 15, 19),
(168, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 16, 19),
(169, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 17, 19),
(170, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 18, 19),
(171, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 20, 19),
(172, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 11, 20),
(173, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 12, 20),
(174, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 13, 20),
(175, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 14, 20),
(176, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 15, 20),
(177, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 16, 20),
(178, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 17, 20),
(179, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 18, 20),
(180, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 19, 20),
(181, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 22, 21),
(182, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 23, 21),
(183, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 21),
(184, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 21),
(185, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 21),
(186, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 21),
(187, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 21),
(188, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 21),
(189, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 21),
(190, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 21, 22),
(191, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 23, 22),
(192, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 22),
(193, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 22),
(194, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 22),
(195, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 22),
(196, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 22),
(197, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 22),
(198, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 22),
(199, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 21, 23),
(200, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 22, 23),
(201, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 1, 23),
(202, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 2, 23),
(203, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 3, 23),
(204, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 4, 23),
(205, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 5, 23),
(206, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 6, 23),
(207, '2025-07-31 00:15:09', '2025-07-31 00:15:09', 7, 23);

-- --------------------------------------------------------

--
-- Estrutura para tabela `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name_slug` varchar(255) NOT NULL,
  `views` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`views`)),
  `likes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`likes`)),
  `dislikes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dislikes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `image`, `category_id`, `created_at`, `updated_at`, `deleted_at`, `name_slug`, `views`, `likes`, `dislikes`) VALUES
(1, 'Teoria Ator-Rede', 'Análise das redes sociais contemporâneas', 'ea571676ce9b75b0730a5d56350ae93e_1753957999.jpeg', 1, '2025-07-30 23:07:22', '2025-07-31 13:33:19', NULL, 'teoria-ator-rede', '[]', '[1,2,3,4,5,6,7,8,9,10,11,12,13]', '[14,15,24]'),
(2, 'Pós-modernidade', 'Crítica às estruturas sociais modernas', '10fb15c77258a991b0028080a64fb42d_1753958029.png', 1, '2025-07-30 23:07:22', '2025-07-31 13:33:49', NULL, 'pos-modernidade', '[]', '[1,2,3,4,5,6,7,8,9,10,11,24]', '[12,13]'),
(3, 'Ativismo Digital', 'Novas formas de protesto online', NULL, 2, '2025-07-30 23:07:22', '2025-07-31 14:38:50', NULL, 'ativismo-digital', '[]', '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,24,22]', '[15,16]'),
(4, 'Feminismo 4.0', 'Evolução do movimento feminista', NULL, 2, '2025-07-30 23:07:22', '2025-07-31 03:42:09', NULL, 'feminismo-4', '[]', '[1,2,3,4,5,6,7,8,9,10,11,12]', '[13,14,24]'),
(5, 'Durkheim e Fato', 'O conceito de fato social', NULL, 3, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'durkheim-fato', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]', '[11, 12]'),
(6, 'Marx e Alienação', 'Teoria da alienação marxista', NULL, 3, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'marx-alienacao', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(7, 'Grafite como Arte', 'Expressão cultural nas cidades', NULL, 4, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'grafite-arte', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12]'),
(8, 'Tribos Urbanas', 'Identidade e comportamento jovem', NULL, 4, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'tribos-urbanas', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(9, 'LGBTQ+ Hoje', 'Desafios contemporâneos', NULL, 5, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'lgbtq-hoje', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]', '[16, 17]'),
(10, 'Feminismo Negro', 'Interseccionalidade de gênero', NULL, 5, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'feminismo-negro', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(11, 'Privilégio Branco', 'Estruturas de desigualdade racial', NULL, 6, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'privilegio-branco', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15, 16]'),
(12, 'Mobilidade Social', 'Fatores que influenciam', NULL, 6, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'mobilidade-social', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]', '[16, 17]'),
(13, 'VPNs Avançadas', 'Proteção de dados online', '9d854dbc2ce0ee3b812399f89cd2725f_1753958384.jpg', 7, '2025-07-30 23:07:22', '2025-07-31 13:39:44', NULL, 'vpns-avancadas', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]', '[19, 20]'),
(14, '2FA Eficaz', 'Autenticação em dois fatores', '71c155491c879ef37e3e8cf58132347f_1753958410.jpeg', 7, '2025-07-30 23:07:22', '2025-07-31 13:40:10', NULL, '2fa-eficaz', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]', '[17, 18]'),
(15, 'Teste de Invasão', 'Metodologias básicas', '101b34148a5a9722aea3155f8c918d56_1753958474.jpg', 8, '2025-07-30 23:07:22', '2025-07-31 13:44:27', NULL, 'teste-de-invasao', '[]', '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]', '[20,21]'),
(16, 'OWASP Top 10', 'Principais vulnerabilidades', '05caa736f2e41f518adb804494ef2252_1753958645.jpg', 8, '2025-07-30 23:07:22', '2025-07-31 13:44:05', NULL, 'owasp-top-10', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]', '[18, 19]'),
(17, 'Clean Code', 'Boas práticas de codificação', NULL, 9, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'clean-code', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]', '[21, 22]'),
(18, 'Python Moderno', 'Recursos da linguagem', NULL, 9, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'python-moderno', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]', '[19, 20]'),
(19, 'AWS Básico', 'Introdução aos serviços', NULL, 10, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'aws-basico', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]', '[18, 19]'),
(20, 'Serverless', 'Arquitetura sem servidor', NULL, 10, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'serverless', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]', '[20, 21]'),
(21, 'SD-WAN', 'Redes definidas por software', NULL, 11, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'sd-wan', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]', '[17, 18]'),
(22, 'Zero Trust', 'Modelo de segurança', NULL, 11, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'zero-trust', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]', '[18, 19]'),
(23, 'Smart Home', 'Segurança em dispositivos', NULL, 12, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'smart-home', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]', '[16, 17]'),
(24, 'IoT Protocols', 'Protocolos de comunicação', NULL, 12, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'iot-protocols', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]', '[17, 18]'),
(25, 'Metasploit', 'Framework de testes', NULL, 13, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'metasploit', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]', '[19, 20]'),
(26, 'Burp Suite', 'Ferramenta para web apps', NULL, 13, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'burp-suite', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]', '[17, 18]'),
(27, 'Memory Dump', 'Análise de memória RAM', NULL, 14, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'memory-dump', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]', '[16, 17]'),
(28, 'Chain of Custody', 'Procedimentos forenses', NULL, 14, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'chain-custody', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]', '[17, 18]'),
(29, 'AES-256', 'Padrão de criptografia', NULL, 15, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'aes-256', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]', '[17, 18]'),
(30, 'RSA Basics', 'Criptografia assimétrica', NULL, 15, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'rsa-basics', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]', '[16, 17]'),
(31, 'SAST Tools', 'Análise estática de código', NULL, 16, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'sast-tools', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]', '[17, 18]'),
(32, 'CI/CD Secure', 'Pipeline seguro', NULL, 16, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'ci-cd-secure', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]', '[16, 17]'),
(33, 'Regência Verbal', 'Uso correto de verbos', 'ee771a78a367d98e7f318fc8bf506cda_1753959608.jpg', 17, '2025-07-30 23:07:22', '2025-07-31 14:00:08', NULL, 'regencia-verbal', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(34, 'Crase', 'Emprego do acento', 'ac2e9e98d9374eb4a4f500e7bee3ad40_1753959644.jpg', 17, '2025-07-30 23:07:22', '2025-07-31 14:00:44', NULL, 'crase', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12, 13]'),
(35, 'Machado de Assis', 'Análise de obras', NULL, 18, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'machado-assis', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(36, 'Clarice Lispector', 'Estilo literário', NULL, 18, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'clarice-lispector', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12, 13]'),
(37, 'Show, Dont Tell', 'Técnica narrativa', NULL, 19, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'show-dont-tell', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(38, 'Fluxo de Consciência', 'Estilo literário', NULL, 19, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'fluxo-consciencia', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12, 13]'),
(39, 'Intertextualidade', 'Relação entre textos', NULL, 20, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'intertextualidade', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(40, 'Narratologia', 'Estrutura de narrativas', NULL, 20, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'narratologia', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12, 13]'),
(41, 'Sociolinguística', 'Língua e sociedade', NULL, 21, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'sociolinguistica', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(42, 'Fonética', 'Estudo dos sons', NULL, 21, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'fonetica', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12, 13]'),
(43, 'Nova Ortografia', 'Regras atualizadas', NULL, 22, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'nova-ortografia', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(44, 'Estrangeirismos', 'Uso de palavras', NULL, 22, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'estrangeirismos', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12, 13]'),
(45, 'Photoshop', 'Técnicas básicas', NULL, 23, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'photoshop', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(46, 'Pixel Art', 'Arte com pixels', NULL, 23, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'pixel-art', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(47, 'Regra dos Terços', 'Composição fotográfica', NULL, 24, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'regra-tercos', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(48, 'Longa Exposição', 'Técnica avançada', NULL, 24, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'longa-exposicao', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(49, 'Turismo Sustentável', 'Práticas ecológicas', NULL, 25, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'turismo-sustentavel', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(50, 'Biomas Brasileiros', 'Diversidade natural', NULL, 25, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'biomas-brasileiros', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(51, 'Comida de Rua', 'Cultura alimentar', NULL, 26, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'comida-rua', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(52, 'Fusion Food', 'Combinação de culturas', NULL, 26, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'fusion-food', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(53, 'Esferificação', 'Técnica básica', NULL, 27, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'esferificacao', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(54, 'Nitrogênio Líquido', 'Uso na gastronomia', NULL, 27, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'nitrogenio-liquido', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(55, 'Fermentação Natural', 'Técnicas tradicionais', NULL, 28, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'fermentacao-natural', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(56, 'Massas Madre', 'Preparo e manutenção', NULL, 28, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'massas-madre', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(57, 'Mixagem Básica', 'Primeiros passos', NULL, 29, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'mixagem-basica', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(58, 'Masterização', 'Processo final', NULL, 29, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'masterizacao', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(59, 'Escalas Musicais', 'Tipos e usos', NULL, 30, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'escalas-musicais', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(60, 'Harmonia Básica', 'Acordes e progressões', NULL, 30, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'harmonia-basica', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(61, 'Kettlebell', 'Exercícios básicos', NULL, 31, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'kettlebell', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(62, 'HIIT', 'Treino intervalado', NULL, 31, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'hiit', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(63, 'Pré-Treino', 'Alimentação adequada', NULL, 32, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'pre-treino', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(64, 'Recuperação', 'Nutrientes pós-treino', NULL, 32, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'recuperacao', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(65, 'Iluminação Studio', 'Técnicas profissionais', NULL, 33, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'iluminacao-studio', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(66, 'Retrato Rua', 'Fotos espontâneas', NULL, 33, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'retrato-rua', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(67, 'Photoshop Avançado', 'Técnicas de edição', NULL, 34, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'photoshop-avancado', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(68, 'Lightroom', 'Edição não destrutiva', NULL, 34, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'lightroom', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(69, 'Meditação Guiada', 'Técnicas iniciais', NULL, 35, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'meditacao-guiada', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(70, 'Respiração', 'Exercícios básicos', NULL, 35, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'respiração', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(71, 'Posturas Básicas', 'Para iniciantes', NULL, 36, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'posturas-basicas', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(72, 'Yoga para Dor', 'Alívio de dores', NULL, 36, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'yoga-dor', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(73, 'MVP', 'Produto mínimo viável', NULL, 37, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'mvp', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(74, 'Pivotar', 'Mudança de direção', NULL, 37, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'pivotar', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(75, 'Storytelling', 'Narrativa eficaz', NULL, 38, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'storytelling', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(76, 'Slide Ideal', 'Elementos essenciais', NULL, 38, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'slide-ideal', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(77, 'Vasos Inteligentes', 'Cultivo em espaços', NULL, 39, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'vasos-inteligentes', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(78, 'Compostagem', 'Adubo caseiro', NULL, 39, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'compostagem', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(79, 'Jardim Vertical', 'Soluções urbanas', NULL, 40, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'jardim-vertical', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(80, 'Plantas Nativas', 'Espécies locais', NULL, 40, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'plantas-nativas', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(81, 'Chás Curativos', 'Preparo e uso', NULL, 41, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'chas-curativos', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(82, 'Ervas Aromáticas', 'Cultivo doméstico', NULL, 41, '2025-07-30 23:07:22', '2025-07-30 23:07:22', NULL, 'ervas-aromaticas', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(83, 'Análise de Disco', 'Técnicas de recuperação de dados em HDs', NULL, 14, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'analise-disco', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(84, 'Evidências Digitais', 'Preservação e documentação de provas', NULL, 14, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'evidencias-digitais', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(85, 'Criptografia Quântica', 'Futuro da segurança digital', NULL, 15, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'criptografia-quantica', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(86, 'Hash Functions', 'Algoritmos e aplicações', NULL, 15, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'hash-functions', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(87, 'Segurança em Containers', 'Protegendo ambientes Docker/Kubernetes', NULL, 16, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'seguranca-containers', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]', '[15, 16]'),
(88, 'Infra as Code', 'Gerenciamento seguro de infraestrutura', NULL, 16, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'infra-as-code', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]', '[14, 15]'),
(89, 'Concordância Verbal', 'Regras e exceções', '106cc9eee05e5b71b9009fb6e5190117_1753959653.jpg', 17, '2025-07-30 23:21:09', '2025-07-31 14:00:53', NULL, 'concordancia-verbal', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]', '[11, 12]'),
(90, 'Vícios de Linguagem', 'Erros comuns a serem evitados', 'c58210e02e6e52005ea8a5ebe804c12a_1753959667.jpg', 17, '2025-07-30 23:21:09', '2025-07-31 14:01:07', NULL, 'vicios-de-linguagem', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12]'),
(91, 'Literatura Barroca', 'Características e autores', NULL, 18, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'literatura-barroca', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9]', '[10, 11]'),
(92, 'Modernismo Brasileiro', 'Fases e representantes', NULL, 18, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'modernismo-brasileiro', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12]'),
(93, 'Desenvolvimento de Personagens', 'Técnicas para criação', NULL, 19, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'desenvolvimento-personagens', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]', '[11, 12]'),
(94, 'Diálogos Eficazes', 'Como escrever conversas realistas', NULL, 19, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'dialogos-eficazes', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12]'),
(95, 'Teoria da Recepção', 'O papel do leitor na construção de sentido', NULL, 20, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'teoria-recepcao', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9]', '[10, 11]'),
(96, 'Crítica Literária', 'Escolas e métodos de análise', NULL, 20, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'critica-literaria', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12]'),
(97, 'Aquisição de Linguagem', 'Como aprendemos a falar', NULL, 21, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'aquisição-linguagem', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]', '[11, 12]'),
(98, 'Pragmática', 'Uso da linguagem em contexto', NULL, 21, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'pragmatica', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12]'),
(99, 'Acentuação Gráfica', 'Regras atualizadas', NULL, 22, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'acentuacao-grafica', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9]', '[10, 11]'),
(100, 'Hífen', 'Casos de uso do hífen', NULL, 22, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'hifen', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12]'),
(101, 'Ilustração Digital', 'Técnicas com tablet', NULL, 23, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'ilustracao-digital', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(102, '3D Básico', 'Introdução ao Blender', NULL, 23, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, '3d-basico', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12, 13]'),
(103, 'Fotografia Noturna', 'Configurações e técnicas', NULL, 24, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'fotografia-noturna', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '[13, 14]'),
(104, 'Retrato em Preto e Branco', 'Composição e iluminação', NULL, 24, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'retrato-pb', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12, 13]'),
(105, 'Trilhas Sustentáveis', 'Como minimizar impactos', NULL, 25, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'trilhas-sustentaveis', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]', '[12, 13]'),
(106, 'Turismo Comunitário', 'Benefícios para populações locais', NULL, 25, '2025-07-30 23:21:09', '2025-07-30 23:21:09', NULL, 'turismo-comunitario', '[]', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]', '[11, 12]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mains`
--

CREATE TABLE `mains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `subtitle` text DEFAULT NULL,
  `description` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_nickname` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `mains`
--

INSERT INTO `mains` (`id`, `created_at`, `updated_at`, `name`, `subtitle`, `description`, `user_id`, `user_nickname`, `deleted_at`) VALUES
(1, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Reflexões Sociais', 'Pensando a sociedade contemporânea', 'Bem-vindo ao meu espaço de análise social! Aqui exploramos desde as teorias clássicas de Durkheim até os desafios da sociedade digital. Vamos discutir desigualdades estruturais, movimentos sociais emergentes e as transformações culturais do nosso tempo, com artigos semanais que conectam teoria e prática.', 22, 'jpbandeira', NULL),
(2, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Diálogos Sociológicos', 'Por uma compreensão crítica da realidade', 'Este é um espaço dedicado à análise sociológica das relações humanas, onde exploramos desde microinterações cotidianas até macroestruturas sociais. Com abordagens que vão da fenomenologia à teoria crítica, oferecemos ferramentas para desnaturalizar o mundo social e compreender seus mecanismos ocultos.', 2, 'cadu', NULL),
(3, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Sociedade em Foco', 'Análises e debates contemporâneos', 'Neste ambiente virtual, mergulhamos nos fenômenos sociais mais relevantes do século XXI. Desde a crise das democracias liberais até os impactos sociais da inteligência artificial, nossa abordagem interdisciplinar conecta sociologia, antropologia e ciência política para entender os complexos desafios de nossa era.', 7, 'mary', NULL),
(4, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Segurança Digital', 'Protegendo seu espaço online', 'Como especialista em segurança cibernética, compartilho conhecimentos avançados sobre proteção de dados, ethical hacking e compliance digital. Aqui você encontrará desde tutoriais para iniciantes até análises técnicas profundas sobre as últimas vulnerabilidades e tendências em cybersecurity.', 21, 'mjaborandy', NULL),
(5, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Código e Criptografia', 'Desenvolvimento seguro na era digital', 'Neste espaço exploramos a interseção entre programação e segurança da informação. Abordamos desde fundamentos de criptografia aplicada até arquiteturas de sistemas seguros, com estudos de caso reais e análises de frameworks de proteção de dados.', 10, 'thi', NULL),
(6, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Tecnologia em Foco', 'Do hardware ao firewall', 'Como profissional de TI com 10 anos de experiência, ofereço análises técnicas detalhadas sobre infraestrutura de redes, arquitetura de sistemas e gestão de vulnerabilidades. Nosso conteúdo vai desde reviews de equipamentos até metodologias de pentesting avançado.', 12, 'brunim', NULL),
(7, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Bytes e Firewalls', 'Segurança desde o primeiro bit', 'Este é um espaço dedicado à cultura de segurança digital, onde discutimos desde princípios básicos de hardening até técnicas avançadas de forensic analysis. Nosso objetivo é formar profissionais capazes de pensar como hackers para construir sistemas verdadeiramente seguros.', 14, 'dieguito', NULL),
(8, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Cyber Security', 'Proteção em primeiro lugar', 'Especializado em segurança ofensiva, compartilho conhecimentos sobre penetration testing, análise de malware e gestão de riscos cibernéticos. Aqui você encontra laboratórios práticos, walkthroughs de CTFs e análises aprofundadas de vulnerabilidades zero-day.', 6, 'luquinhas', NULL),
(9, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Língua Portuguesa', 'A beleza das palavras', 'Como mestre em linguística, convido você a explorar conosco as riquezas e peculiaridades do idioma português. Desde variações dialetais até análises sintáticas profundas, nosso conteúdo abrange tanto a norma culta quanto as vibrantes manifestações do português popular.', 23, 'eug', NULL),
(10, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Literatura e Gramática', 'A arte da linguagem', 'Neste espaço conjugamos o rigor gramatical com a sensibilidade literária. Analisamos obras clássicas e contemporâneas, explorando como os recursos linguísticos constroem sentido, enquanto oferecemos dicas práticas para dominar a norma culta sem perder a expressividade.', 3, 'nanda', NULL),
(11, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Palavras em Foco', 'A arte de bem escrever', 'Como redatora profissional com 15 anos de experiência, compartilho técnicas avançadas de escrita criativa, estruturação textual e estilo. Nosso conteúdo vai desde fundamentos de coesão textual até análises estilísticas de grandes autores, sempre com exercícios práticos.', 19, 'lau', NULL),
(12, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Arte Contemporânea', 'Expressões modernas', 'Como curadora independente, apresento análises críticas das principais tendências artísticas globais. Exploramos desde instalações imersivas até street art, discutindo como a arte contemporânea reflete e questiona as complexidades do mundo atual.', 1, 'aninha', NULL),
(13, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Viagens pelo Mundo', 'Descubra novos lugares', 'Com mais de 40 países visitados, compartilho guias detalhados, rotas alternativas e dicas culturais essenciais. Nosso foco são experiências autênticas que vão além do turismo convencional, com ênfase em intercâmbio cultural e viagens sustentáveis.', 4, 'gabi', NULL),
(14, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Culinária Criativa', 'Receitas e técnicas inovadoras', 'Como chef especializada em fusão gastronômica, ensino a combinar sabores tradicionais com técnicas modernas. Nossos conteúdos incluem desde fundamentos de cozinha profissional até experimentações ousadas, sempre com explicações científicas sobre os processos culinários.', 5, 'ju', NULL),
(15, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Música Indie', 'Som alternativo', 'Produtor musical e caçador de novidades, apresento análises aprofundadas de álbuns, entrevistas exclusivas com artistas emergentes e crônicas sobre a cena musical independente global. Nosso foco é descobrir talentos antes que explodam no mainstream.', 9, 'rafa', NULL),
(16, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Fitness em Casa', 'Saúde prática', 'Como educador físico especializado em treinamento funcional, desenvolvo programas adaptáveis para todos os níveis. Nossos conteúdos incluem desde rotinas básicas até protocolos avançados, sempre com ênfase em biomecânica correta e periodização inteligente.', 11, 'ali', NULL),
(17, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Fotografia Urbana', 'Capturando cidades', 'Fotógrafo profissional especializado em paisagens urbanas, ensino a ver a cidade com novos olhos. Compartilho técnicas avançadas de composição, edição não-destrutiva e narrativa visual, além de análises críticas de trabalhos referenciais na área.', 13, 'camilinha', NULL),
(18, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Meditação Guiada', 'Encontre seu centro', 'Instrutor de mindfulness com formação em psicologia, ofereço programas estruturados para redução de estresse. Nossas práticas combinam técnicas ancestrais com abordagens científicas modernas, adaptadas para desafios contemporâneos como a hiperconexão digital.', 15, 'lis', NULL),
(19, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Startups Inovadoras', 'Empreendedorismo digital', 'Consultor especializado em scale-ups, analiso cases reais de modelos de negócio disruptivos. Nosso conteúdo cobre desde validação de ideias até estratégias de growth hacking, com entrevistas exclusivas com fundadores de unicórnios brasileiros.', 16, 'fabim', NULL),
(20, '2025-07-30 22:41:32', '2025-07-30 22:41:32', 'Jardinagem Urbana', 'Verde na cidade', 'Engenheira agrônoma especializada em paisagismo urbano, ensino a criar oásis verdes em pequenos espaços. Compartilho técnicas de cultivo orgânico, seleção de espécies resilientes e designs funcionais que transformam varandas em jardins produtivos.', 18, 'igorzin', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_05_194434_create_categories_table', 1),
(5, '2025_03_05_194524_create_items_table', 1),
(6, '2025_03_05_194552_create_contents_table', 1),
(7, '2025_03_05_200831_create_mains_table', 1),
(8, '2025_03_15_173727_add_name_slug_to_categories_table', 1),
(9, '2025_03_15_175139_add_name_slug_to_items_table', 1),
(10, '2025_05_25_160454_add_follow_to_users_table', 1),
(11, '2025_05_25_160737_add_likes_to_items_table', 1),
(12, '2025_05_29_214033_create_comments_table', 1),
(13, '2025_06_17_132042_create_followers_table', 1),
(14, '2025_07_16_005746_create_firsttimes_table', 1),
(15, '2025_07_17_225638_add_indexeditor_to_firsttimes_table', 1),
(16, '2025_07_20_134350_create_notifications_table', 1),
(17, '2025_07_21_010951_add_status_to_notifications_table', 1),
(18, '2025_07_21_012910_add_responser_id__to_notifications_table', 1),
(19, '2025_07_21_014723_add_route__to_notifications_table', 1),
(20, '2025_07_21_023555_add_theme_name_to_notifications_table', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `text` text NOT NULL,
  `status` text DEFAULT NULL,
  `responser_id` int(11) DEFAULT NULL,
  `route` text DEFAULT NULL,
  `theme_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `notifications`
--

INSERT INTO `notifications` (`id`, `created_at`, `updated_at`, `user_id`, `name`, `text`, `status`, `responser_id`, `route`, `theme_name`) VALUES
(2, '2025-07-31 03:48:17', '2025-07-31 03:48:17', 3, '213', 'corna', 'new_comment_2', 24, 'http://127.0.0.1:8000/jpbandeira/sociologia-moderna/teoria-ator-rede', 'http://127.0.0.1:8000/jpbandeira/sociologia-moderna/teoria-ator-rede/add_comment_2'),
(3, '2025-07-31 03:48:26', '2025-07-31 03:48:26', 24, '214', 'ksksksks', 'new_comment_3', 24, 'http://127.0.0.1:8000/jpbandeira/sociologia-moderna/teoria-ator-rede', NULL),
(4, '2025-07-31 13:29:57', '2025-07-31 13:29:57', 1, '', '', 'new_follower', 22, '', ''),
(5, '2025-07-31 14:02:34', '2025-07-31 14:02:34', 19, '215', 'traiu kkkkkk', 'new_comment_2', 23, 'http://127.0.0.1:8000/eug/literatura-classica/machado-assis', 'http://127.0.0.1:8000/eug/literatura-classica/machado-assis/add_comment_2'),
(6, '2025-07-31 14:09:54', '2025-07-31 14:09:54', 5, '216', 'eu tenho, dps te passo', 'new_comment_2', 23, 'http://127.0.0.1:8000/eug/gramatica-avancada/regencia-verbal', 'http://127.0.0.1:8000/eug/gramatica-avancada/regencia-verbal/add_comment_2'),
(7, '2025-07-31 14:10:13', '2025-07-31 14:10:13', 7, '217', 'kkkkkkkk pior', 'new_comment_2', 23, 'http://127.0.0.1:8000/eug/gramatica-avancada/regencia-verbal', 'http://127.0.0.1:8000/eug/gramatica-avancada/regencia-verbal/add_comment_2'),
(8, '2025-07-31 14:13:05', '2025-07-31 14:13:05', 23, '218', 'blz chapa', 'new_comment_3', 5, 'http://127.0.0.1:8000/eug/gramatica-avancada/regencia-verbal', NULL),
(9, '2025-07-31 14:32:13', '2025-07-31 14:32:13', 16, '219', 'recomendo a Kaspersky (sei la como se escreve)', 'new_comment_2', 21, 'http://127.0.0.1:8000/mjaborandy/seguranca-digital/vpns-avancadas', 'http://127.0.0.1:8000/mjaborandy/seguranca-digital/vpns-avancadas/add_comment_2'),
(10, '2025-07-31 14:33:11', '2025-07-31 14:33:11', 20, '220', 'eu nao gosto muito de vpn nao, e nao acho essencial. tipo sei la, acho que meio que roubam seus dados ou algo do tipo', 'new_comment_2', 21, 'http://127.0.0.1:8000/mjaborandy/seguranca-digital/vpns-avancadas', 'http://127.0.0.1:8000/mjaborandy/seguranca-digital/vpns-avancadas/add_comment_2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ggyo14h5TNPO9LOzSWQczEdo0jo1chZUiOsTeG5S', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiT0diQUhwaG9LdjFZUmNOWDdVRDgwcWt1NnY1OVkzaENQQmVlRk1JVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9qdS9jb3ppbmhhLW1vbGVjdWxhciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjU7czoxMToiY291bnRfdGhlbWUiO2k6MjtzOjE1OiJjb3VudF9mb2xsb3dlcnMiO2k6OTtzOjE1OiJjb3VudF9mb2xsb3dpbmciO2k6MTI7czoxODoibm90aWZpY2F0aW9uc191c2VyIjtpOjE7fQ==', 1753960464),
('HYA3HcLJH1qPmic7VJpyNbqwYuEns4UIZftaYX7t', 22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiRk05WUlROFRVMmtrcFFoVjQ1aE5VSjAxSlZpVTVIazdWYTVsTE1TbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjIyO3M6MTE6ImNvdW50X3RoZW1lIjtpOjI7czoxNToiY291bnRfZm9sbG93ZXJzIjtpOjk7czoxNToiY291bnRfZm9sbG93aW5nIjtpOjI7czoxODoibm90aWZpY2F0aW9uc191c2VyIjtpOjA7fQ==', 1753961950);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `visitors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`visitors`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `nickname`, `remember_token`, `created_at`, `updated_at`, `visitors`) VALUES
(1, 'Ana Beatriz Silva', 'ana.bsilva@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'aninha', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(2, 'Carlos Eduardo', 'carlos.edu@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'cadu', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(3, 'Fernanda Lima', 'fernanda.lima@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'nanda', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(4, 'Gabriel Torres', 'gabriel.torres@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'gabi', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(5, 'Juliana Mendes', 'juliana.mendes@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'ju', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(6, 'Lucas Rocha', 'lucas.rocha@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'luquinhas', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(7, 'Mariana Souza', 'mariana.souza@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'mary', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(8, 'Pedro Henrique', 'pedro.henrique@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'ph', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(9, 'Rafaela Castro', 'rafaela.castro@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'rafa', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(10, 'Thiago Nunes', 'thiago.nunes@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'thi', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(11, 'Aline Ferreira', 'aline.ferreira@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'ali', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(12, 'Bruno Machado', 'bruno.machado@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'brunim', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(13, 'Camila Dias', 'camila.dias@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'camilinha', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(14, 'Diego Ramos', 'diego.ramos@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'dieguito', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(15, 'Elisa Gomes', 'elisa.gomes@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'lis', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(16, 'Fábio Cunha', 'fabio.cunha@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'fabim', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(17, 'Helena Brito', 'helena.brito@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'lena', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(18, 'Igor Santana', 'igor.santana@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'igorzin', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(19, 'Laura Martins', 'laura.martins@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'lau', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(20, 'Vinícius Teixeira', 'vinicius.teixeira@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'vini', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(21, 'Mauricio Jaborandy', 'mauricio.jaborandy@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'mjaborandy', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(22, 'Joao Paulo Bandeira', 'joao.bandeira@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'jpbandeira', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(23, 'Eugenia', 'eugenia@example.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'eug', NULL, '2025-07-30 22:16:51', '2025-07-30 22:16:51', NULL),
(24, 'kelwin', 'kelwin@email.com', NULL, '$2y$12$aBmi9E78tGK4/dvOl0MT/uAc12UIkM.nyqwGyf7Z2Dalxhi4yPS6.', 'kelwin123', NULL, '2025-07-31 03:23:13', '2025-07-31 03:23:13', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Índices de tabela `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`),
  ADD KEY `categories_user_nickname_foreign` (`user_nickname`);

--
-- Índices de tabela `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contents_item_id_foreign` (`item_id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices de tabela `firsttimes`
--
ALTER TABLE `firsttimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `firsttimes_user_id_foreign` (`user_id`);

--
-- Índices de tabela `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Índices de tabela `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Índices de tabela `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mains`
--
ALTER TABLE `mains`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mains_user_id_foreign` (`user_id`),
  ADD KEY `mains_user_nickname_foreign` (`user_nickname`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nickname_unique` (`nickname`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT de tabela `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `firsttimes`
--
ALTER TABLE `firsttimes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT de tabela `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de tabela `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mains`
--
ALTER TABLE `mains`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_user_nickname_foreign` FOREIGN KEY (`user_nickname`) REFERENCES `users` (`nickname`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `firsttimes`
--
ALTER TABLE `firsttimes`
  ADD CONSTRAINT `firsttimes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `mains`
--
ALTER TABLE `mains`
  ADD CONSTRAINT `mains_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mains_user_nickname_foreign` FOREIGN KEY (`user_nickname`) REFERENCES `users` (`nickname`) ON DELETE CASCADE;

--
-- Restrições para tabelas `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
