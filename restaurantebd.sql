-- MySQL Script generated by MySQL Workbench
-- 09/12/15 11:50:28
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tblTipoDoc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblTipoDoc` (
  `idTipoDoc` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoDoc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoDoc`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblClientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblClientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombreCliente` VARCHAR(45) NOT NULL,
  `apellidoCliente` VARCHAR(45) NOT NULL,
  `nroTipoDoc` INT NOT NULL,
  `idTipoDoc` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_tblClientes_tblTipoDoc_idx` (`idTipoDoc` ASC),
  CONSTRAINT `fk_tblClientes_tblTipoDoc`
    FOREIGN KEY (`idTipoDoc`)
    REFERENCES `mydb`.`tblTipoDoc` (`idTipoDoc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblReserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblReserva` (
  `idReserva` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `tblClientes_idCliente` INT NOT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_tblReserva_tblClientes1_idx` (`tblClientes_idCliente` ASC),
  CONSTRAINT `fk_tblReserva_tblClientes1`
    FOREIGN KEY (`tblClientes_idCliente`)
    REFERENCES `mydb`.`tblClientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblMesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblMesa` (
  `idMesa` INT NOT NULL AUTO_INCREMENT,
  `nroMesa` INT NOT NULL,
  PRIMARY KEY (`idMesa`),
  UNIQUE INDEX `nroMesa_UNIQUE` (`nroMesa` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblDetalleReserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblDetalleReserva` (
  `idReserva` INT NOT NULL,
  `idMesa` INT NOT NULL,
  INDEX `fk_table2_tblReserva1_idx` (`idReserva` ASC),
  INDEX `fk_table2_tblMesa1_idx` (`idMesa` ASC),
  CONSTRAINT `fk_table2_tblReserva1`
    FOREIGN KEY (`idReserva`)
    REFERENCES `mydb`.`tblReserva` (`idReserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table2_tblMesa1`
    FOREIGN KEY (`idMesa`)
    REFERENCES `mydb`.`tblMesa` (`idMesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblPlato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblPlato` (
  `idPlato` INT NOT NULL AUTO_INCREMENT,
  `nombrePlato` VARCHAR(45) NOT NULL,
  `precioPlato` INT NOT NULL,
  PRIMARY KEY (`idPlato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblDetallePlato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblDetallePlato` (
  `tblReserva_idReserva` INT NOT NULL,
  `cantidadPlato` VARCHAR(45) NOT NULL,
  `precioPlato` VARCHAR(45) NOT NULL,
  `tblPlato_idPlato` INT NOT NULL,
  `total` INT NOT NULL,
  INDEX `fk_table1_tblReserva1_idx` (`tblReserva_idReserva` ASC),
  INDEX `fk_table1_tblPlato1_idx` (`tblPlato_idPlato` ASC),
  CONSTRAINT `fk_table1_tblReserva1`
    FOREIGN KEY (`tblReserva_idReserva`)
    REFERENCES `mydb`.`tblReserva` (`idReserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_tblPlato1`
    FOREIGN KEY (`tblPlato_idPlato`)
    REFERENCES `mydb`.`tblPlato` (`idPlato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Data for table `mydb`.`tblTipoDoc`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`tblTipoDoc` (`idTipoDoc`, `nombreTipoDoc`) VALUES (NULL, 'Tarjeta de identidad');
INSERT INTO `mydb`.`tblTipoDoc` (`idTipoDoc`, `nombreTipoDoc`) VALUES (NULL, 'Cedula');
INSERT INTO `mydb`.`tblTipoDoc` (`idTipoDoc`, `nombreTipoDoc`) VALUES (NULL, 'Pasaporte');
INSERT INTO `mydb`.`tblTipoDoc` (`idTipoDoc`, `nombreTipoDoc`) VALUES (NULL, 'Registro civil');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`tblClientes`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`tblClientes` (`idCliente`, `nombreCliente`, `apellidoCliente`, `nroTipoDoc`, `idTipoDoc`) VALUES (NULL, 'Alejandro', 'Sanchez', 97043006510, 1);
INSERT INTO `mydb`.`tblClientes` (`idCliente`, `nombreCliente`, `apellidoCliente`, `nroTipoDoc`, `idTipoDoc`) VALUES (NULL, 'Julian', 'Arboleda', 1035876184, 2);
INSERT INTO `mydb`.`tblClientes` (`idCliente`, `nombreCliente`, `apellidoCliente`, `nroTipoDoc`, `idTipoDoc`) VALUES (NULL, 'Manuela', 'Perez', 98065048512, 1);
INSERT INTO `mydb`.`tblClientes` (`idCliente`, `nombreCliente`, `apellidoCliente`, `nroTipoDoc`, `idTipoDoc`) VALUES (NULL, 'Carlos', 'Morales', 584622458, 3);
INSERT INTO `mydb`.`tblClientes` (`idCliente`, `nombreCliente`, `apellidoCliente`, `nroTipoDoc`, `idTipoDoc`) VALUES (NULL, 'Camila', 'Florez', 94256014520, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`tblMesa`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`tblMesa` (`idMesa`, `nroMesa`) VALUES (NULL, 10);
INSERT INTO `mydb`.`tblMesa` (`idMesa`, `nroMesa`) VALUES (NULL, 15);
INSERT INTO `mydb`.`tblMesa` (`idMesa`, `nroMesa`) VALUES (NULL, 20);
INSERT INTO `mydb`.`tblMesa` (`idMesa`, `nroMesa`) VALUES (NULL, 25);
INSERT INTO `mydb`.`tblMesa` (`idMesa`, `nroMesa`) VALUES (NULL, 30);
INSERT INTO `mydb`.`tblMesa` (`idMesa`, `nroMesa`) VALUES (NULL, 35);
INSERT INTO `mydb`.`tblMesa` (`idMesa`, `nroMesa`) VALUES (NULL, 40);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`tblPlato`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`tblPlato` (`idPlato`, `nombrePlato`, `precioPlato`) VALUES (NULL, 'Arroz con pollo', 15000);
INSERT INTO `mydb`.`tblPlato` (`idPlato`, `nombrePlato`, `precioPlato`) VALUES (NULL, 'Espaguetis a la boloñesa', 25000);
INSERT INTO `mydb`.`tblPlato` (`idPlato`, `nombrePlato`, `precioPlato`) VALUES (NULL, 'Fresco', 1500);
INSERT INTO `mydb`.`tblPlato` (`idPlato`, `nombrePlato`, `precioPlato`) VALUES (NULL, 'Gaseosa', 2000);
INSERT INTO `mydb`.`tblPlato` (`idPlato`, `nombrePlato`, `precioPlato`) VALUES (NULL, 'Frijoles', 8000);
INSERT INTO `mydb`.`tblPlato` (`idPlato`, `nombrePlato`, `precioPlato`) VALUES (NULL, 'Caldo de pescado', 11000);
INSERT INTO `mydb`.`tblPlato` (`idPlato`, `nombrePlato`, `precioPlato`) VALUES (NULL, 'Carne', 4000);

COMMIT;

