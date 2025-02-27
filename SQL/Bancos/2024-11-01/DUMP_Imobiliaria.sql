/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.5.27 : Database - imobiliaria
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`imobiliaria` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `imobiliaria`;

/*Table structure for table `imoveis` */

DROP TABLE IF EXISTS `imoveis`;

CREATE TABLE `imoveis` (
  `id_imovel` int(11) NOT NULL AUTO_INCREMENT,
  `descritivo` varchar(50) NOT NULL,
  `aluguel` decimal(8,2) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_proprietario` int(11) NOT NULL,
  `data_cad` date NOT NULL,
  PRIMARY KEY (`id_imovel`),
  KEY `id_tipo` (`id_tipo`),
  KEY `id_proprietario` (`id_proprietario`),
  CONSTRAINT `imoveis_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos` (`id_tipo`),
  CONSTRAINT `imoveis_ibfk_2` FOREIGN KEY (`id_proprietario`) REFERENCES `proprietarios` (`id_proprietario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `imoveis` */

insert  into `imoveis`(`id_imovel`,`descritivo`,`aluguel`,`id_tipo`,`id_proprietario`,`data_cad`) values (1,'Apartamento no Centro','1200.00',1,1,'2023-01-01'),(2,'Casa no Bairro Alto','1500.00',2,8,'2023-02-01'),(3,'Estúdio na Vila Madalena','1000.00',3,3,'2023-03-01'),(4,'Cobertura na Zona Sul','2000.00',4,4,'2023-04-01'),(5,'Loft no Centro','1100.00',1,5,'2023-05-01'),(6,'Casa com Piscina','2500.00',2,6,'2023-06-01'),(7,'Apartamento com Vista','1300.00',1,7,'2023-07-01'),(8,'Kitnet Estudantil','900.00',3,1,'2023-08-01'),(9,'Sítio na Serra','3000.00',2,9,'2023-09-01'),(10,'Cobertura Duplex','2200.00',4,2,'2023-10-01');

/*Table structure for table `inquilinos` */

DROP TABLE IF EXISTS `inquilinos`;

CREATE TABLE `inquilinos` (
  `id_inquilino` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `sexo` enum('F','M') DEFAULT NULL,
  PRIMARY KEY (`id_inquilino`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `inquilinos` */

insert  into `inquilinos`(`id_inquilino`,`nome`,`telefone`,`sexo`) values (1,'João Silva','11987654321','M'),(2,'Maria Souza','11987654322','F'),(3,'Carlos Lima','11987654323','M'),(4,'Ana Oliveira','11987654324','F'),(5,'Pedro Santos','11987654325','M'),(6,'Mariana Almeida','11987654326','F'),(7,'José Costa','11987654327','M'),(8,'Paula Ribeiro','11987654328','F');

/*Table structure for table `locacao` */

DROP TABLE IF EXISTS `locacao`;

CREATE TABLE `locacao` (
  `id_locacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_imovel` int(11) NOT NULL,
  `id_inquilino` int(11) NOT NULL,
  `data_locacao` date NOT NULL,
  PRIMARY KEY (`id_locacao`),
  KEY `id_imovel` (`id_imovel`),
  KEY `id_inquilino` (`id_inquilino`),
  CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`id_imovel`) REFERENCES `imoveis` (`id_imovel`),
  CONSTRAINT `locacao_ibfk_2` FOREIGN KEY (`id_inquilino`) REFERENCES `inquilinos` (`id_inquilino`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `locacao` */

insert  into `locacao`(`id_locacao`,`id_imovel`,`id_inquilino`,`data_locacao`) values (1,9,1,'2024-01-10'),(2,2,2,'2024-02-15'),(3,3,3,'2024-03-20'),(4,4,4,'2024-04-25'),(5,5,5,'2024-05-30'),(6,6,6,'2024-06-05'),(7,7,7,'2023-07-10'),(8,8,8,'2023-08-15'),(10,1,3,'2024-09-17');

/*Table structure for table `proprietarios` */

DROP TABLE IF EXISTS `proprietarios`;

CREATE TABLE `proprietarios` (
  `id_proprietario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sexo` enum('F','M') DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  `cidade` varchar(80) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_proprietario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `proprietarios` */

insert  into `proprietarios`(`id_proprietario`,`nome`,`sexo`,`logradouro`,`bairro`,`cidade`,`uf`) values (1,'Ricardo OLiveira','M','Rua das Flores','Centro','Porto Alegre','RS'),(2,'Fernanda Luz','F','Avenida Paulista','Bairro Alto','São Paulo','SP'),(3,'Juliana Silva','F','Rua Augusta','Vila Madalena','São Paulo','SP'),(4,'Marcelo Braga','M','Avenida das Nações','Zona Sul','São Paulo','SP'),(5,'Lucas Ramos','M','Rua Central','Centro','São Paulo','SP'),(6,'Patrícia Duarte','F','Rua da Lagoa','Zona Norte','São Paulo','SP'),(7,'Gustavo Nunes','M','Avenida do Estado','Zona Leste','São Paulo','SP'),(8,'Rafaela Alves','F','Rua do Comércio','Centro','Belo Horizonte','MG'),(9,'André Costa','M','Estrada Velha','Zona Rural','São Paulo','SP');

/*Table structure for table `tipos` */

DROP TABLE IF EXISTS `tipos`;

CREATE TABLE `tipos` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `descritivo` varchar(40) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tipos` */

insert  into `tipos`(`id_tipo`,`descritivo`) values (1,'Apartamento'),(2,'Casa'),(3,'Kitnet'),(4,'Cobertura');

/* Procedure structure for procedure `proc_aluguel_proprietario` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_aluguel_proprietario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_aluguel_proprietario`(in codp int)
begin
  if (codp in (select id_proprietario from proprietarios)) then
   if (codp in (select id_proprietario from
                imoveis i inner join locacao l
                on (i.id_imovel=l.id_imovel))) then
    select p.id_proprietario "Codigo", p.nome "Nome",
      format(sum(i.aluguel*0.94),2,"de_DE") "ValoraReceber" 
    from proprietarios p inner join imoveis i
    on (p.id_proprietario=i.id_proprietario)
    inner join locacao l on (l.id_imovel=i.id_imovel)
    where p.id_proprietario = codp
    group by p.id_proprietario;
   else
    select "Proprietario não possui imoveis locados" as msg;
   end if;
  else
    select "Proprietario não cadastrado" as msg;
  end if;
end */$$
DELIMITER ;

/*Table structure for table `vw_pagto_prop` */

DROP TABLE IF EXISTS `vw_pagto_prop`;

/*!50001 DROP VIEW IF EXISTS `vw_pagto_prop` */;
/*!50001 DROP TABLE IF EXISTS `vw_pagto_prop` */;

/*!50001 CREATE TABLE `vw_pagto_prop` (
  `Codigo` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL,
  `Valor_Receber` decimal(33,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*View structure for view vw_pagto_prop */

/*!50001 DROP TABLE IF EXISTS `vw_pagto_prop` */;
/*!50001 DROP VIEW IF EXISTS `vw_pagto_prop` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pagto_prop` AS select `p`.`id_proprietario` AS `Codigo`,`p`.`nome` AS `nome`,(sum(`i`.`aluguel`) * 0.94) AS `Valor_Receber` from ((`proprietarios` `p` join `imoveis` `i` on((`p`.`id_proprietario` = `i`.`id_proprietario`))) join `locacao` `l` on((`l`.`id_imovel` = `i`.`id_imovel`))) group by `p`.`id_proprietario` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
