/*
* Author: Nikhil Shah
* Project: Cocktails
* Create and Populate Tables
*/

-- -----------------------------------------------------
-- Schema CocktailProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CocktailProject` DEFAULT CHARACTER SET utf8 ;
USE `CocktailProject` ;

-- -----------------------------------------------------
-- Table `CocktailProject`.`Ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CocktailProject`.`Ingredients` (
  `IngredientID` INT NOT NULL AUTO_INCREMENT,
  `IngredientName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IngredientID`),
  UNIQUE INDEX `idIngredients_UNIQUE` (`IngredientID` ASC) VISIBLE
  );

INSERT INTO `Ingredients` (`IngredientName`) VALUES
  ('Water'),
  ('Vodka'),
  ('Gin'),
  ('White Rum'),
  ('Dark Rum'),
  ('Dry Vermouth'),
  ('Sweet Vermouth'),
  ('Whisky'),
  ('Scotch'),
  ('Bourbon'),
  ('Cranberry Juice'),
  ('Grapefruit Juice'),
  ('Orange Juice'),
  ('Lime Juice'),
  ('Lemon Juice'),
  ('Ginger Beer'),
  ('Tonic Water'),
  ('Club Soda'),
  ('Aromatic Bitters'),
  ('Tequila'),
  ('Cointreau'),
  ('Strawberry Liqueur'),
  ('Elderflower Liqueur');


-- -----------------------------------------------------
-- Table `CocktailProject`.`Flavor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CocktailProject`.`Flavor` (
  `FlavorID` INT NOT NULL AUTO_INCREMENT,
  `Flavor` VARCHAR(45) NULL,
  PRIMARY KEY (`FlavorID`),
  UNIQUE INDEX `FlavorID_UNIQUE` (`FlavorID` ASC) VISIBLE
  );

INSERT INTO `Flavor`(`Flavor`) VALUES
  ('Fruity'),
  ('Strong'),
  ('Sweet'),
  ('Bitter'),
  ('Spicy'),
  ('Sour'),
  ('Salty'),
  ('Tangy'),
  ('Bubbly'),
  ('Earthy');


-- -----------------------------------------------------
-- Table `CocktailProject`.`ProcessToMake`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CocktailProject`.`ProcessToMake` (
  `ProcessToMake` VARCHAR(20) NOT NULL,
  `ProcessNotes` VARCHAR(100) NULL,
  PRIMARY KEY (`ProcessToMake`)
  );

INSERT INTO `ProcessToMake` (`ProcessToMake`, `ProcessNotes`) VALUES
  ('Stir', NULL),
  ('Stir Lightly', 'Stir for no longer than 10 seconds'),
  ('Shake', 'Shake vigorously for 15 seconds'),
  ('Pour', 'Pour ingredients directly into glass'),
  ('Layer', 'Slowly add each ingredient according to density'),
  ('Blend', 'Add ice and ingredients to a blender and blend until frothy'),
  ('Muddle', 'Put garnish and main alcohol into the serving glass and mash before adding other ingredients');

-- -----------------------------------------------------
-- Table `CocktailProject`.`Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CocktailProject`.`Glasses` (
  `GlassName` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`GlassName`)
  );

INSERT INTO `Glasses` (`GlassName`) VALUES
  ('Highball'),
  ('Collins'),
  ('Martini'),
  ('Coupe'),
  ('Champagne Flute'),
  ('Margarita'),
  ('Copper Mug');

-- -----------------------------------------------------
-- Table `CocktailProject`.`Garnish`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CocktailProject`.`Garnish` (
  `GarnishID` INT NOT NULL AUTO_INCREMENT,
  `GarnishName` VARCHAR(45) NULL,
  `GarnishPrepNotes` VARCHAR(120) NULL,
  PRIMARY KEY (`GarnishID`)
  );

INSERT INTO `Garnish` (`GarnishName`, `GarnishPrepNotes`) VALUES
  ('Lime Wedge', 'Cut lime into wedge and remove all white strings'),
  ('Lemon Wedge', 'Cut lime into wedge and remove all white strings'),
  ('Olive', NULL),
  ('Lime Peel', 'Peel off the skin of a lime and twist over the glass'),
  ('Lemon Peel', 'Peel off the skin of a lemon and twist over the glass'),
  ('Candied Ginger', NULL),
  ('Salted Rim', 'Rub lemon or lime wedge around rim and dip rim into glass with coarse salt. Add wedge to drink if not a frozen drink'),
  ('Maraschino Cherry', NULL),
  ('Mint Leaves', 'Keep whole and only bruise slightly to muddle');

-- -----------------------------------------------------
-- Table `CocktailProject`.`Cocktails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CocktailProject`.`Cocktails` (
  `CocktailID` INT NOT NULL AUTO_INCREMENT,
  `CocktailName` VARCHAR(45) NOT NULL,
  `CocktailAlias` VARCHAR(45) NULL,
  `CocktailNotes` VARCHAR(120) NULL,
  `CocktailHistory` VARCHAR(120) NULL,
  `GlassName` VARCHAR(20) NOT NULL,
  `FlavorID` INT NOT NULL,
  `GarnishID` INT NULL,
  `ProcessToMake` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`CocktailID`, `GlassName`),
  UNIQUE INDEX `CocktailID_UNIQUE` (`CocktailID` ASC) VISIBLE,
  INDEX `fk_Cocktails_Flavor1_idx` (`FlavorID` ASC) VISIBLE,
  INDEX `fk_Cocktails_Garnish1_idx` (`GarnishID` ASC) VISIBLE,
  INDEX `fk_Cocktails_ProcessToMake1_idx` (`ProcessToMake` ASC) VISIBLE,
  INDEX `fk_Cocktails_Glasses1_idx` (`GlassName` ASC) VISIBLE,
  CONSTRAINT `fk_Cocktails_Flavor1`
    FOREIGN KEY (`FlavorID`)
    REFERENCES `CocktailProject`.`Flavor` (`FlavorID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cocktails_Garnish1`
    FOREIGN KEY (`GarnishID`)
    REFERENCES `CocktailProject`.`Garnish` (`GarnishID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cocktails_ProcessToMake1`
    FOREIGN KEY (`ProcessToMake`)
    REFERENCES `CocktailProject`.`ProcessToMake` (`ProcessToMake`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cocktails_Glasses1`
    FOREIGN KEY (`GlassName`)
    REFERENCES `CocktailProject`.`Glasses` (`GlassName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

INSERT INTO `Cocktails` (`CocktailID`, `CocktailName`, `CocktailAlias`, `CocktailNotes`, `CocktailHistory`, `GlassName`, `FlavorID`, `GarnishID`, `ProcessToMake`) VALUES
  (200, 'Martini', 'Gin Martini', NULL, NULL, 'Martini', 2, 3, 'Stir'),
  (NULL, 'Vodka Martini', 'Vesper Martini', NULL, 'Made popular by James Bond books and movies', 'Martini', 2, 3, 'Stir'),
  (NULL, 'Manhattan', 'Queens Cocktail', NULL, NULL, 'Martini', 2, 8, 'Stir'),
  (NULL, 'Whisky and Water', NULL, 'Use harder ice to minimize melting', NULL, 'Highball', 2, NULL, 'Stir Lightly'),
  (NULL, 'Vodka Tonic', NULL, NULL, NULL, 'Collins', 6, 1, 'Stir Lightly'),
  (NULL, 'Margarita', NULL, NULL, NULL, 'Margarita', 5, 7, 'Blend'),
  (NULL, 'Moscow Mule', NULL, 'Chill mug beforehand for crisper taste', NULL, 'Copper Mug', 6, 6, 'Pour'),
  (NULL, 'Cosmopolitan', NULL, NULL, 'Martini',1, NULL, 'Shake'),
  (NULL, 'Mojito', NULL, NULL, 'Collins', 8, 9, 'Muddle'),
  (NULL, 'Strawberry Flower', 'Strawberry Gin', NULL, NULL, 'Highball', 10, 4, 'Shake');
  

-- -----------------------------------------------------
-- Table `CocktailProject`.`Recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CocktailProject`.`Recipe` (
  `CocktailID` INT NOT NULL,
  `IngredientID` INT NOT NULL,
  `IngredientAmount` INT NOT NULL,
  PRIMARY KEY (`CocktailID`, `IngredientID`),
  INDEX `fk_Cocktail_Ingredients_Cocktails1_idx` (`CocktailID` ASC) VISIBLE,
  CONSTRAINT `fk_Cocktail_Ingredients_Ingredients`
    FOREIGN KEY (`IngredientID`)
    REFERENCES `CocktailProject`.`Ingredients` (`IngredientID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cocktail_Ingredients_Cocktails1`
    FOREIGN KEY (`CocktailID`)
    REFERENCES `CocktailProject`.`Cocktails` (`CocktailID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

INSERT INTO `Recipe` (`CocktailID`, `IngredientID`, `IngredientAmount`) VALUES
  (200, 3, 45),
  (200, 6, 15),
  (201, 2, 45),
  (201, 6, 15),
  (202, 8, 45),
  (202, 7, 15),
  (203, 1, 90),
  (203, 8, 45),
  (204, 2, 45),
  (204, 17, 100),
  (205, 20, 35),
  (205, 21, 20),
  (205, 14, 35),
  (206, 2, 45),
  (206, 14, 15),
  (206, 16, 60)
  (207, 2, 60),
  (207, 11, 100),
  (208, 4, 60),
  (208, 14, 15),
  (209, 3, 30),
  (209, 14, 15),
  (209, 19, 5),
  (209, 22, 10),
  (209, 23, 5);
  

-- -----------------------------------------------------
-- Testing Queries (not to be run for normal build)
-- -----------------------------------------------------
#SELECT * FROM `Ingredients` WHERE `IngredientID` > 2;
#SELECT * FROM `Garnish`;
#DELETE from `Cocktails` where `CocktailID` >= 1; #Delete all rows
#SELECT * FROM `Cocktails`;
#SELECT * FROM `Flavor`;
#SELECT * FROM `Glasses`;
#SELECT * FROM `Ingredients`;
#SELECT * FROM `ProcessToMake`;
#SELECT * FROM `Recipe`;
