-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: portalaluno
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `Data_Nascimeto` varchar(20) DEFAULT NULL,
  `RG` varchar(45) DEFAULT NULL,
  `CPF` varchar(45) DEFAULT NULL,
  `Telefone` varchar(45) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Id_Cidade` int DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Cidade_idx` (`Id_Cidade`),
  CONSTRAINT `fk_Cidade` FOREIGN KEY (`Id_Cidade`) REFERENCES `cidade` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codigos_alteracao_senha`
--

DROP TABLE IF EXISTS `codigos_alteracao_senha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigos_alteracao_senha` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int DEFAULT NULL,
  `Codigo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `Fk_Id_Usuario_idx` (`Id_Usuario`),
  CONSTRAINT `Fk_Id_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `tb_users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome_Curso` varchar(45) DEFAULT NULL,
  `Objetivo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disciplinas`
--

DROP TABLE IF EXISTS `disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplinas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome_Disciplina` varchar(45) DEFAULT NULL,
  `Id_Professor` int DEFAULT NULL,
  `Id_Curso` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_Id_Curso_idx` (`Id_Curso`),
  KEY `Fk_Id_Professor_idx` (`Id_Professor`),
  CONSTRAINT `Fk_Id_Curso` FOREIGN KEY (`Id_Curso`) REFERENCES `curso` (`Id`),
  CONSTRAINT `Fk_Id_Professor` FOREIGN KEY (`Id_Professor`) REFERENCES `professor` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequencia`
--

DROP TABLE IF EXISTS `frequencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequencia` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Disciplina` int DEFAULT NULL,
  `Id_Matricula` int DEFAULT NULL,
  `Presenca` char(1) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_Id_Disciplina_idx` (`Id_Disciplina`),
  KEY `Fk_Id_Aluno_Presenca_idx` (`Id_Matricula`),
  CONSTRAINT `Fk_Id_Aluno_Presenca` FOREIGN KEY (`Id_Matricula`) REFERENCES `matricula` (`Id`),
  CONSTRAINT `Fk_Id_Disciplina` FOREIGN KEY (`Id_Disciplina`) REFERENCES `disciplinas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hora`
--

DROP TABLE IF EXISTS `hora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hora` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Hora` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`,`Hora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Aluno` int DEFAULT NULL,
  `Id_Curso` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_Id_Aluno_Matricula_idx` (`Id_Aluno`),
  KEY `Fk_Id_Curso_Matricula_idx` (`Id_Curso`),
  CONSTRAINT `Fk_Id_Aluno_Matricula` FOREIGN KEY (`Id_Aluno`) REFERENCES `alunos` (`Id`),
  CONSTRAINT `Fk_Id_Curso_Matricula` FOREIGN KEY (`Id_Curso`) REFERENCES `curso` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Matricula` int DEFAULT NULL,
  `Id_Disciplina` int DEFAULT NULL,
  `AV1` varchar(45) DEFAULT NULL,
  `AV2` varchar(45) DEFAULT NULL,
  `AV3` varchar(45) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_Id_Materia_Nota_idx` (`Id_Disciplina`),
  KEY `Fk_Id_Matricula_idx` (`Id_Matricula`),
  CONSTRAINT `Fk_Id_Disciplina_Nota` FOREIGN KEY (`Id_Disciplina`) REFERENCES `disciplinas` (`Id`),
  CONSTRAINT `Fk_Id_Matricula` FOREIGN KEY (`Id_Matricula`) REFERENCES `matricula` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(250) DEFAULT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  `RG` varchar(45) DEFAULT NULL,
  `CPF` varchar(45) DEFAULT NULL,
  `Telefone` varchar(45) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Id_Cidade` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_cidadep_idx` (`Id_Cidade`),
  CONSTRAINT `fk_cidadep` FOREIGN KEY (`Id_Cidade`) REFERENCES `cidade` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quadro_horarios`
--

DROP TABLE IF EXISTS `quadro_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quadro_horarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Horario` int DEFAULT NULL,
  `Id_Curso` int DEFAULT NULL,
  `Segunda` int DEFAULT NULL,
  `Terca` int DEFAULT NULL,
  `Quarta` int DEFAULT NULL,
  `Quinta` int DEFAULT NULL,
  `Sexta` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_horario_idx` (`Horario`),
  KEY `fk_id_Curso_idx` (`Id_Curso`),
  KEY `fk_segunda_idx` (`Segunda`),
  KEY `fk_sexta_idx` (`Sexta`),
  KEY `fk_quinta_idx` (`Quinta`),
  KEY `fk_quarta_idx` (`Quarta`),
  KEY `fk_terca_idx` (`Terca`),
  CONSTRAINT `fk_horario` FOREIGN KEY (`Horario`) REFERENCES `hora` (`Id`),
  CONSTRAINT `fk_IdCurso` FOREIGN KEY (`Id_Curso`) REFERENCES `curso` (`Id`),
  CONSTRAINT `fk_quarta` FOREIGN KEY (`Quarta`) REFERENCES `disciplinas` (`Id`),
  CONSTRAINT `fk_quinta` FOREIGN KEY (`Quinta`) REFERENCES `disciplinas` (`Id`),
  CONSTRAINT `fk_segunda` FOREIGN KEY (`Segunda`) REFERENCES `disciplinas` (`Id`),
  CONSTRAINT `fk_sexta` FOREIGN KEY (`Sexta`) REFERENCES `disciplinas` (`Id`),
  CONSTRAINT `fk_terca` FOREIGN KEY (`Terca`) REFERENCES `disciplinas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ID_Aluno` int DEFAULT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Password` varchar(155) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Qntd_Acesso` int DEFAULT '0',
  `Ultimo_Acesso` varchar(45) DEFAULT NULL,
  `Foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  UNIQUE KEY `Usuario_UNIQUE` (`Usuario`),
  KEY `Fk_Id_Aluno_idx` (`ID_Aluno`),
  CONSTRAINT `Fk_Id_Aluno` FOREIGN KEY (`ID_Aluno`) REFERENCES `alunos` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_dadosaluno`
--

DROP TABLE IF EXISTS `vw_dadosaluno`;
/*!50001 DROP VIEW IF EXISTS `vw_dadosaluno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dadosaluno` AS SELECT 
 1 AS `Id`,
 1 AS `id_aluno`,
 1 AS `email`,
 1 AS `Nome`,
 1 AS `Data_Nascimeto`,
 1 AS `Rg`,
 1 AS `Cpf`,
 1 AS `Telefone`,
 1 AS `Endereco`,
 1 AS `Cidade`,
 1 AS `Estado`,
 1 AS `Nome_Curso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_disciplinas`
--

DROP TABLE IF EXISTS `vw_disciplinas`;
/*!50001 DROP VIEW IF EXISTS `vw_disciplinas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_disciplinas` AS SELECT 
 1 AS `Nome_Disciplina`,
 1 AS `Nome`,
 1 AS `id_aluno`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_frequencias`
--

DROP TABLE IF EXISTS `vw_frequencias`;
/*!50001 DROP VIEW IF EXISTS `vw_frequencias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_frequencias` AS SELECT 
 1 AS `id_aluno`,
 1 AS `Disciplina`,
 1 AS `Faltas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_horarios`
--

DROP TABLE IF EXISTS `vw_horarios`;
/*!50001 DROP VIEW IF EXISTS `vw_horarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_horarios` AS SELECT 
 1 AS `Horario`,
 1 AS `Segunda`,
 1 AS `Terca`,
 1 AS `Quarta`,
 1 AS `Quinta`,
 1 AS `Sexta`,
 1 AS `Id_Aluno`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_login`
--

DROP TABLE IF EXISTS `vw_login`;
/*!50001 DROP VIEW IF EXISTS `vw_login`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_login` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `Id_Usuario`,
 1 AS `usuario`,
 1 AS `password`,
 1 AS `Qntd_Acesso`,
 1 AS `Foto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_notas`
--

DROP TABLE IF EXISTS `vw_notas`;
/*!50001 DROP VIEW IF EXISTS `vw_notas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_notas` AS SELECT 
 1 AS `disciplina`,
 1 AS `AV1`,
 1 AS `AV2`,
 1 AS `AV3`,
 1 AS `id_aluno`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_dadosaluno`
--

/*!50001 DROP VIEW IF EXISTS `vw_dadosaluno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dadosaluno` AS select `m`.`Id` AS `Id`,`a`.`Id` AS `id_aluno`,`a`.`email` AS `email`,`a`.`Nome` AS `Nome`,`a`.`Data_Nascimeto` AS `Data_Nascimeto`,`a`.`RG` AS `Rg`,`a`.`CPF` AS `Cpf`,`a`.`Telefone` AS `Telefone`,`a`.`Endereco` AS `Endereco`,`c`.`Nome` AS `Cidade`,`c`.`Estado` AS `Estado`,`cs`.`Nome_Curso` AS `Nome_Curso` from (((`matricula` `m` left join `alunos` `a` on((`a`.`Id` = `m`.`Id_Aluno`))) left join `cidade` `c` on((`c`.`Id` = `a`.`Id_Cidade`))) left join `curso` `cs` on((`cs`.`Id` = `m`.`Id_Curso`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_disciplinas`
--

/*!50001 DROP VIEW IF EXISTS `vw_disciplinas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_disciplinas` AS select `d`.`Nome_Disciplina` AS `Nome_Disciplina`,`p`.`Nome` AS `Nome`,`m`.`Id_Aluno` AS `id_aluno` from ((`disciplinas` `d` join `matricula` `m` on((`m`.`Id_Aluno` = `m`.`Id_Aluno`))) join `professor` `p` on((`p`.`Id` = `d`.`Id_Professor`))) where (`d`.`Id_Curso` = `m`.`Id_Curso`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_frequencias`
--

/*!50001 DROP VIEW IF EXISTS `vw_frequencias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_frequencias` AS select `m`.`Id_Aluno` AS `id_aluno`,`d`.`Nome_Disciplina` AS `Disciplina`,(select count(0) AS `Faltas` from `frequencia` `f` where ((`f`.`Presenca` = 'F') and (`f`.`Id_Matricula` = `m`.`Id`) and (`f`.`Id_Disciplina` = `d`.`Id`))) AS `Faltas` from (`disciplinas` `d` join `matricula` `m` on((`m`.`Id_Aluno` = `m`.`Id_Aluno`))) where (`d`.`Id_Curso` = `m`.`Id_Curso`) group by `d`.`Nome_Disciplina`,`m`.`Id_Aluno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_horarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_horarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_horarios` AS select `h`.`Hora` AS `Horario`,(select `d`.`Nome_Disciplina` from `disciplinas` `d` where (`d`.`Id` = `qh`.`Segunda`)) AS `Segunda`,(select `d`.`Nome_Disciplina` from `disciplinas` `d` where (`d`.`Id` = `qh`.`Terca`)) AS `Terca`,(select `d`.`Nome_Disciplina` from `disciplinas` `d` where (`d`.`Id` = `qh`.`Quarta`)) AS `Quarta`,(select `d`.`Nome_Disciplina` from `disciplinas` `d` where (`d`.`Id` = `qh`.`Quinta`)) AS `Quinta`,(select `d`.`Nome_Disciplina` from `disciplinas` `d` where (`d`.`Id` = `qh`.`Sexta`)) AS `Sexta`,`m`.`Id_Aluno` AS `Id_Aluno` from ((`hora` `h` join `matricula` `m` on((`m`.`Id_Aluno` = `m`.`Id_Aluno`))) left join `quadro_horarios` `qh` on(((`qh`.`Horario` = `h`.`Id`) and (`qh`.`Id_Curso` = `m`.`Id_Curso`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_login`
--

/*!50001 DROP VIEW IF EXISTS `vw_login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_login` AS select `a`.`Id` AS `id`,`a`.`Nome` AS `nome`,`u`.`Id` AS `Id_Usuario`,`u`.`Usuario` AS `usuario`,`u`.`Password` AS `password`,`u`.`Qntd_Acesso` AS `Qntd_Acesso`,`u`.`Foto` AS `Foto` from (`tb_users` `u` join `alunos` `a` on((`a`.`Id` = `u`.`ID_Aluno`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_notas`
--

/*!50001 DROP VIEW IF EXISTS `vw_notas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_notas` AS select `d`.`Nome_Disciplina` AS `disciplina`,`n`.`AV1` AS `AV1`,`n`.`AV2` AS `AV2`,`n`.`AV3` AS `AV3`,`m`.`Id_Aluno` AS `id_aluno` from ((`disciplinas` `d` join `matricula` `m` on((`m`.`Id_Aluno` = `m`.`Id_Aluno`))) left join `notas` `n` on(((`n`.`Id_Disciplina` = `d`.`Id`) and (`n`.`Id_Matricula` = `m`.`Id`)))) where (`d`.`Id_Curso` = `m`.`Id_Curso`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-01 20:06:15
