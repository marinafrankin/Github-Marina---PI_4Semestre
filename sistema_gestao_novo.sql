-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/06/2026 às 22:39
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
-- Banco de dados: `sistema_gestao_novo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `id` int(11) NOT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  `horario` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `duracao` time DEFAULT NULL,
  `foco` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atendimentos`
--

INSERT INTO `atendimentos` (`id`, `funcionario_id`, `cliente_id`, `servico_id`, `horario`, `duracao`, `foco`) VALUES
(1, 1, 2, 2, '2026-06-03 14:00:00', NULL, NULL),
(2, NULL, 4, 3, '2026-06-09 10:29:06', NULL, NULL),
(3, NULL, 5, 3, '2026-06-09 10:29:06', NULL, NULL),
(4, 5, 6, 1, '2026-06-08 13:00:00', NULL, NULL),
(5, 5, 7, 1, '2026-06-09 12:00:00', NULL, NULL),
(6, 5, 2, 1, '2026-06-09 12:30:00', NULL, NULL),
(7, 5, 1, 1, '2026-06-09 13:00:00', NULL, NULL),
(8, 3, 2, 4, '2026-06-09 12:00:00', NULL, NULL),
(9, 6, 8, 2, '2026-06-09 12:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento_produto`
--

CREATE TABLE `atendimento_produto` (
  `id` int(11) NOT NULL,
  `atendimento_id` int(11) DEFAULT NULL,
  `produtos_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `contato` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `preferencia_1` tinyint(1) DEFAULT NULL,
  `preferencia_2` tinyint(1) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `endereco`, `contato`, `email`, `data_nascimento`, `preferencia_1`, `preferencia_2`, `descricao`) VALUES
(1, 'tamires oliveira', NULL, '14996305484', NULL, NULL, NULL, NULL, 'talier741@gmail.com'),
(2, 'Tamires', NULL, '14-996305484', NULL, NULL, NULL, NULL, 'nenhuma'),
(4, 'Marina Frankin', NULL, '14-998488890', NULL, NULL, NULL, NULL, 'Tenho alergia a acetona '),
(5, 'Laura Bella', NULL, '14 996936628', NULL, NULL, NULL, NULL, ''),
(6, 'Vinicius', NULL, '14 99887744', NULL, NULL, NULL, NULL, ''),
(7, 'Vinicius', NULL, '14 99999999 ', NULL, NULL, NULL, NULL, ''),
(8, 'Yasmin', NULL, '14-991711771', 'yasmin.yas@gmail.com', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `fornecedor_id` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `quantidade` float DEFAULT NULL,
  `data_compra` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra_produto`
--

CREATE TABLE `compra_produto` (
  `id` int(11) NOT NULL,
  `compra_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `nome_fantasia` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT NULL,
  `data_cancelamento` date DEFAULT NULL,
  `usuario_cadastrou` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `contato` varchar(50) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `funcao` varchar(100) DEFAULT NULL,
  `disponibilidade` text DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `endereco`, `contato`, `cpf`, `data_nascimento`, `funcao`, `disponibilidade`, `email`, `senha`, `observacoes`) VALUES
(1, 'Antônio Silva', NULL, '(11) 99999-9999', '123.456.789-00', NULL, 'Gerente', NULL, 'antonio@sistema.com', '$2b$10$MnJsceSb7u.HJi5cHpx1C.MXoZ4t0N4x.pggXEfcWZWlVbNWaMXZu', NULL),
(3, 'Marina Frankin', NULL, '14-998488890', NULL, '2005-03-29', 'Maquiador(a)', NULL, 'marina@gmail.com', '$2b$10$TK6HrGAFN.1IR19kDFzfT.epJioVqNkyEmCoq2t.gQJhpQR1E86AK', NULL),
(4, 'Leandro', NULL, '14-997715789', NULL, NULL, 'Gerente', NULL, 'leandro@gmail.com', '$2b$10$iaN74gwVz5/ee92gfyUPser6FmJbPC4FTtMp0ISuISFcU5hnil1Mm', NULL),
(5, 'Caio', NULL, '14 988875960', NULL, '2000-08-03', 'Barbeiro(a)', NULL, 'caio@gmail.com', '$2b$10$4vtOJrakAMj/W5na8q8qnu2TcUftN8VPJkaSKodSnCF5AM/L4bvSi', NULL),
(6, 'Jaqueline', NULL, '1499999999', NULL, '1999-06-02', 'Cabeleireiro(a)', NULL, 'jaque.line@gmail.com', '$2b$10$aVBHu8QtAGIocwPJiI2KBefn77ChrfletLahHAtTzFS26E7Qxnnii', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historicos`
--

CREATE TABLE `historicos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `data_atendimento` date DEFAULT NULL,
  `profissional` varchar(255) DEFAULT NULL,
  `tipo_servico` varchar(255) DEFAULT NULL,
  `produtos_utilizados` text DEFAULT NULL,
  `marca_tinta` varchar(255) DEFAULT NULL,
  `formula_coloracao` text DEFAULT NULL,
  `tempo_pausa` int(11) DEFAULT NULL,
  `corte_realizado` text DEFAULT NULL,
  `preferencias` text DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `proxima_recomendacao` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `descricao` text DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `qtd_estoque` float DEFAULT NULL,
  `qtd_minima` float DEFAULT NULL,
  `qtd_maxima` float DEFAULT NULL,
  `vlr_venda` float DEFAULT NULL,
  `data_inclusao` date DEFAULT NULL,
  `data_ultima_venda` date DEFAULT NULL,
  `data_alteracao` date DEFAULT NULL,
  `usuario_alterou` int(11) DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT NULL,
  `data_cancelamento` date DEFAULT NULL,
  `usuario_cadastrou` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `descricao`, `marca`, `qtd_estoque`, `qtd_minima`, `qtd_maxima`, `vlr_venda`, `data_inclusao`, `data_ultima_venda`, `data_alteracao`, `usuario_alterou`, `STATUS`, `data_cancelamento`, `usuario_cadastrou`) VALUES
(2, 'Condicionador Vella', 'Antonio', 20, NULL, NULL, NULL, '2026-06-08', NULL, NULL, NULL, 1, NULL, NULL),
(3, 'Shampoo Vella', 'Antonio', 10, NULL, NULL, NULL, '2026-06-08', NULL, NULL, NULL, 1, NULL, NULL),
(4, 'Mascara Vella', 'Antonio', 0, NULL, NULL, NULL, '2026-06-08', NULL, NULL, NULL, 1, NULL, NULL),
(5, 'Reparador de pontas ', 'Leandro', 5, NULL, NULL, NULL, '2026-06-08', NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `duracao_estimada` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`, `descricao`, `preco`, `duracao_estimada`) VALUES
(1, 'Corte de Cabelo Masculino', 'Corte moderno ou clássico com lavagem', 40.00, '00:30:00'),
(2, 'Corte de Cabelo Feminino', 'Corte de cabelo feminino personalizado com escova', 80.00, '01:00:00'),
(3, 'Manicure Completa', 'Cuidado completo das unhas das mãos com esmaltação', 35.00, '00:45:00'),
(4, 'Limpeza de Pele', 'Limpeza profunda facial com extração e hidratação', 120.00, '01:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `qtd_produto` float DEFAULT NULL,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda_produto`
--

CREATE TABLE `venda_produto` (
  `id` int(11) NOT NULL,
  `venda_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionario_id` (`funcionario_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `servico_id` (`servico_id`);

--
-- Índices de tabela `atendimento_produto`
--
ALTER TABLE `atendimento_produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `atendimento_id` (`atendimento_id`),
  ADD KEY `produtos_id` (`produtos_id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fornecedor_id` (`fornecedor_id`);

--
-- Índices de tabela `compra_produto`
--
ALTER TABLE `compra_produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_id` (`compra_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_cadastrou` (`usuario_cadastrou`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `historicos`
--
ALTER TABLE `historicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historico_cliente_id` (`cliente_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_cadastrou` (`usuario_cadastrou`),
  ADD KEY `usuario_alterou` (`usuario_alterou`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `funcionario_id` (`funcionario_id`);

--
-- Índices de tabela `venda_produto`
--
ALTER TABLE `venda_produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venda_id` (`venda_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `atendimento_produto`
--
ALTER TABLE `atendimento_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compra_produto`
--
ALTER TABLE `compra_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `historicos`
--
ALTER TABLE `historicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `venda_produto`
--
ALTER TABLE `venda_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD CONSTRAINT `atendimentos_ibfk_1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  ADD CONSTRAINT `atendimentos_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `atendimentos_ibfk_3` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`);

--
-- Restrições para tabelas `atendimento_produto`
--
ALTER TABLE `atendimento_produto`
  ADD CONSTRAINT `atendimento_produto_ibfk_1` FOREIGN KEY (`atendimento_id`) REFERENCES `atendimentos` (`id`),
  ADD CONSTRAINT `atendimento_produto_ibfk_2` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`);

--
-- Restrições para tabelas `compra_produto`
--
ALTER TABLE `compra_produto`
  ADD CONSTRAINT `compra_produto_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `compra_produto_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD CONSTRAINT `fornecedores_ibfk_1` FOREIGN KEY (`usuario_cadastrou`) REFERENCES `funcionarios` (`id`);

--
-- Restrições para tabelas `historicos`
--
ALTER TABLE `historicos`
  ADD CONSTRAINT `historicos_cliente_id_fkey` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`usuario_cadastrou`) REFERENCES `funcionarios` (`id`),
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`usuario_alterou`) REFERENCES `funcionarios` (`id`);

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

--
-- Restrições para tabelas `venda_produto`
--
ALTER TABLE `venda_produto`
  ADD CONSTRAINT `venda_produto_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`),
  ADD CONSTRAINT `venda_produto_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
