/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.5.27 : Database - empresa_sa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`empresa_sa` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `empresa_sa`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `descritivo` varchar(40) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `categorias` */

insert  into `categorias`(`id_categoria`,`descritivo`) values (1,'Discos rigidos'),(2,'Notebook'),(3,'Placas-Mães'),(4,'Mouses'),(5,'Gabinetes'),(6,'Pendrives'),(7,'Teclados');

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `sexo` enum('F','M') DEFAULT NULL,
  `datan` date NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

insert  into `clientes`(`id_cliente`,`nome`,`sexo`,`datan`) values (1,'Wdson de Oliveira','M','1970-04-01'),(2,'Cação','M','1966-06-06'),(3,'Anderson','M','1990-03-01'),(4,'Jose','M','1985-01-01'),(5,'Patricia','F','1970-03-22'),(6,'Lucas','M','1994-02-07'),(7,'Gabriel','M','1996-03-27'),(8,'Roberta','F','2000-01-01'),(9,'Raquel','F','1998-10-10'),(10,'Carla','F','1989-03-10');

/*Table structure for table `forma_pagto` */

DROP TABLE IF EXISTS `forma_pagto`;

CREATE TABLE `forma_pagto` (
  `id_fp` int(11) NOT NULL AUTO_INCREMENT,
  `descritivo` varchar(40) NOT NULL,
  PRIMARY KEY (`id_fp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `forma_pagto` */

insert  into `forma_pagto`(`id_fp`,`descritivo`) values (1,'dinheiro'),(2,'cartão credito');

/*Table structure for table `fornecedores` */

DROP TABLE IF EXISTS `fornecedores`;

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(80) NOT NULL,
  `e_mail` varchar(80) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `fornecedores` */

insert  into `fornecedores`(`id_fornecedor`,`razao_social`,`e_mail`) values (1,'Vende tudo SA','vende.tudo@gmail.com'),(2,'Mercado facil','mercado.facil@hotmail.com'),(3,'CompraAqui','compraaqui@hotmail.com'),(4,'EmpresaFox','fox@gmail.com');

/*Table structure for table `itens_nfc` */

DROP TABLE IF EXISTS `itens_nfc`;

CREATE TABLE `itens_nfc` (
  `id_infc` int(11) NOT NULL AUTO_INCREMENT,
  `id_nfc` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `custo` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_infc`),
  KEY `id_nfc` (`id_nfc`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `itens_nfc_ibfk_1` FOREIGN KEY (`id_nfc`) REFERENCES `nf_compras` (`id_nfc`),
  CONSTRAINT `itens_nfc_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `itens_nfc` */

insert  into `itens_nfc`(`id_infc`,`id_nfc`,`id_produto`,`quantidade`,`custo`) values (1,1001,1,1,'350.00'),(2,2001,6,1,'1500.00'),(3,3001,9,1,'500.00'),(4,4001,2,1,'200.00'),(5,5001,6,2,'1500.00');

/*Table structure for table `itens_nfv` */

DROP TABLE IF EXISTS `itens_nfv`;

CREATE TABLE `itens_nfv` (
  `id_infv` int(11) NOT NULL AUTO_INCREMENT,
  `id_nfv` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `venda` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_infv`),
  KEY `id_produto` (`id_produto`),
  KEY `id_nfv` (`id_nfv`),
  CONSTRAINT `itens_nfv_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`),
  CONSTRAINT `itens_nfv_ibfk_2` FOREIGN KEY (`id_nfv`) REFERENCES `nf_vendas` (`id_nfv`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `itens_nfv` */

insert  into `itens_nfv`(`id_infv`,`id_nfv`,`id_produto`,`quantidade`,`venda`) values (1,1,1,1,'525.00'),(2,1,6,1,'2100.00'),(4,2,8,2,'3500.00'),(6,4,6,1,'2100.00'),(7,4,11,2,'980.00'),(8,5,12,2,'140.00'),(9,6,15,2,'560.00'),(10,1,10,1,'840.00'),(12,3,10,3,'840.00'),(13,7,1,2,'525.00'),(14,7,2,2,'280.00'),(15,9,4,1,'350.00'),(16,9,8,1,'3500.00'),(17,10,1,1,'525.00'),(18,10,15,2,'560.00'),(19,11,9,1,'980.00'),(20,11,10,2,'840.00');

/*Table structure for table `nf_compras` */

DROP TABLE IF EXISTS `nf_compras`;

CREATE TABLE `nf_compras` (
  `id_nfc` int(11) NOT NULL,
  `emissao` date NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `id_fp` int(11) NOT NULL,
  PRIMARY KEY (`id_nfc`),
  KEY `id_fornecedor` (`id_fornecedor`),
  KEY `id_fp` (`id_fp`),
  CONSTRAINT `nf_compras_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`),
  CONSTRAINT `nf_compras_ibfk_2` FOREIGN KEY (`id_fp`) REFERENCES `forma_pagto` (`id_fp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `nf_compras` */

insert  into `nf_compras`(`id_nfc`,`emissao`,`valor`,`id_fornecedor`,`id_fp`) values (1001,'2024-05-10','350.00',1,1),(2001,'2024-04-10','1500.00',2,2),(3001,'2024-06-01','500.00',1,1),(4001,'2024-03-22','200.00',1,1),(5001,'2024-02-10','3000.00',3,2);

/*Table structure for table `nf_vendas` */

DROP TABLE IF EXISTS `nf_vendas`;

CREATE TABLE `nf_vendas` (
  `id_nfv` int(11) NOT NULL AUTO_INCREMENT,
  `emissao` date NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_fp` int(11) NOT NULL,
  PRIMARY KEY (`id_nfv`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_fp` (`id_fp`),
  CONSTRAINT `nf_vendas_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`),
  CONSTRAINT `nf_vendas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `nf_vendas_ibfk_3` FOREIGN KEY (`id_fp`) REFERENCES `forma_pagto` (`id_fp`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `nf_vendas` */

insert  into `nf_vendas`(`id_nfv`,`emissao`,`valor`,`id_vendedor`,`id_cliente`,`id_fp`) values (1,'2024-02-12','3465.00',2,1,1),(2,'2024-03-10','7000.00',1,1,2),(3,'2024-04-12','2520.00',2,2,1),(4,'2024-04-05','4060.00',3,3,2),(5,'2024-05-06','280.00',3,3,1),(6,'2024-06-07','1120.00',1,3,2),(7,'2024-09-10','1610.00',2,4,1),(8,'2024-06-21','920.00',1,1,1),(9,'2024-06-10','3850.00',4,5,2),(10,'2024-08-01','2170.00',5,8,1),(11,'2024-10-01','2660.00',4,6,2);

/*Table structure for table `produtos` */

DROP TABLE IF EXISTS `produtos`;

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `descritivo` varchar(40) NOT NULL,
  `custo` decimal(8,2) NOT NULL,
  `lucro` int(11) NOT NULL,
  `venda` decimal(8,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `produtos` */

insert  into `produtos`(`id_produto`,`descritivo`,`custo`,`lucro`,`venda`,`estoque`,`id_categoria`) values (1,'HD externo 2TB','1000.00',50,'525.00',80,1),(2,'HD externo 1TB','200.00',40,'280.00',140,1),(3,'HD externo 4TB','450.00',40,'630.00',130,1),(4,'HD interno SSD 480Gb','250.00',40,'350.00',120,1),(5,'HD interno SSD 250Gb','150.00',40,'210.00',90,1),(6,'Notebook intel core i3','1500.00',40,'2100.00',70,2),(7,'Notebook intel core i5','2000.00',40,'2800.00',130,2),(8,'Notebook intel core i7','2500.00',40,'3500.00',200,2),(9,'Placa-Mãe Gigabyte H410M S2','500.00',40,'700.00',85,3),(10,'Placa-Mãe Gigabyte C621 AORUS XTREME','600.00',40,'840.00',145,3),(11,'Placa-Mãe Gigabyte, GA-E6010N','700.00',40,'980.00',200,3),(12,'Mouse Gamer BLACK HAWK OM-703','100.00',40,'140.00',50,4),(13,'Mouse Gamer SPIDER VENOM OM-704','200.00',40,'280.00',4,4),(14,'Mouse Gamer SPIDER TARANTULA OM-702','300.00',40,'420.00',350,4),(15,'Mouse Gamer PRO M7','400.00',40,'560.00',250,4);

/*Table structure for table `vendedores` */

DROP TABLE IF EXISTS `vendedores`;

CREATE TABLE `vendedores` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `comissao` int(11) NOT NULL,
  `salario_fixo` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `vendedores` */

insert  into `vendedores`(`id_vendedor`,`nome`,`comissao`,`salario_fixo`) values (1,'Vera',5,1200.00),(2,'Celinho',10,1200.00),(3,'Busca',15,1200.00),(4,'Valeria',10,1200.00),(5,'Ciccone',10,1200.00),(6,'Leonardo',15,1200.00),(7,'Humberto',5,1200.00);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
