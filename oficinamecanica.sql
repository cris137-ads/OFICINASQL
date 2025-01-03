-- Criação do banco de dados
CREATE DATABASE OficinaMecanica;
USE OficinaMecanica;

-- Tabela de Clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    Endereco VARCHAR(200)
);

-- Tabela de Veículos
CREATE TABLE Veiculos (
    VeiculoID INT AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(10) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Ano INT NOT NULL,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Tabela de Serviços
CREATE TABLE Servicos (
    ServicoID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(200) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);

-- Tabela de Ordens de Serviço
CREATE TABLE OrdensServico (
    OrdemID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    VeiculoID INT,
    DataEntrada DATE NOT NULL,
    DataSaida DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculos(VeiculoID)
);

-- Tabela de Itens da Ordem de Serviço
CREATE TABLE ItensOrdemServico (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrdemID INT,
    ServicoID INT,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrdemID) REFERENCES OrdensServico(OrdemID),
    FOREIGN KEY (ServicoID) REFERENCES Servicos(ServicoID)
);
