USE `CocktailProject`;

#Join of Cocktails and Ingredients into Recipe table -- Join Function
SELECT *
FROM Cocktails
INNER JOIN Recipe
ON Cocktails.CocktailID = Recipe.CocktailID
INNER JOIN Ingredients
ON Recipe.IngredientID = Ingredients.IngredientID;


#Insert new Cocktail and Recipe -- Insert Functions
INSERT INTO Cocktails (CocktailID, CocktailName, GlassName, FlavorID, GarnishID, ProcessToMake) VALUE
(207, 'Highball', 'Highball', 2, 5, 'Stir Lightly');
SELECT * FROM Cocktails;
INSERT INTO Recipe (CocktailID, IngredientID, IngredientAmount) VALUES
(207, 9, 45),
(207, 18, 60);


#Full view of Cocktails and their ingredients without ids -- Multi-Table Query
SELECT c.CocktailName AS 'Cocktail Name', c.CocktailAlias AS 'Other Name', c.CocktailNotes AS 'Notes', i.IngredientName AS 'Ingredient', r.IngredientAmount AS 'Ingredient Amount (ml)'
FROM Cocktails AS c, Ingredients AS i, Recipe AS r
WHERE c.CocktailID = r.CocktailID AND i.IngredientID = r.IngredientID
ORDER BY c.CocktailID;


#Uncluttered view of Cocktails and their ingredients
SELECT c.CocktailName AS 'Cocktail Name', i.IngredientName AS 'Ingredient', r.IngredientAmount AS 'Ingredient Amount (ml)'
FROM Cocktails AS c, Ingredients AS i, Recipe AS r
WHERE c.CocktailID = r.CocktailID AND i.IngredientID = r.IngredientID
ORDER BY c.CocktailName;


#Total amount of liquid in each cocktail -- Aggregate Function
SELECT c.CocktailName AS 'Cocktail Name', SUM(r.IngredientAmount) AS 'Total Liquid (without ice)'
FROM  Cocktails AS c, Recipe AS r
WHERE c.CocktailID = r.CocktailID
GROUP BY r.CocktailID;


#Lookup Cocktail by ingredient (vodka) -- Group by Function
SELECT c.CocktailID AS 'Cocktail ID', c.CocktailName AS 'Cocktail Name'
FROM  Cocktails AS c, Recipe AS r, Ingredients AS i
WHERE c.CocktailID = r.CocktailID AND r.IngredientID = i.IngredientID AND i.IngredientName = 'Vodka'
GROUP BY c.CocktailID;


#Get all pertinent info about a cocktail
SELECT c.CocktailName AS 'Cocktail', i.IngredientName AS 'Ingredient', r.IngredientAmount AS 'Amount (in ml)', c.ProcessToMake AS 'Method', g.GarnishName AS 'Garnish', c.GlassName AS 'Glass Type', f.Flavor
FROM Cocktails AS c, Ingredients AS i, Recipe AS r, Garnish AS g, Flavor AS f
WHERE c.CocktailName = 'Margarita' AND c.CocktailID = r.CocktailID AND i.IngredientID = r.IngredientID AND c.GarnishID = g.GarnishID AND c.FlavorID = f.FlavorID;


#Delete a Cocktail -- Delete Function
DELETE
FROM Cocktails AS c
WHERE c.CocktailID = 207;
#show Cocktails table
SELECT c.CocktailName AS 'Cocktail Name', i.IngredientName AS 'Ingredient', r.IngredientAmount AS 'Ingredient Amount (ml)'
FROM Cocktails AS c, Ingredients AS i, Recipe AS r
WHERE c.CocktailID = r.CocktailID AND i.IngredientID = r.IngredientID;


#Update quantity on a recipe -- Update Function
UPDATE Recipe 
SET IngredientAmount = 80
WHERE IngredientID = 1 AND CocktailID = 203;

