var shoppingListExplicit = [String]()
shoppingListExplicit = ["Eggs","Milk"]
//var shoppingListExplicit: [String] = ["Eggs","Milk"]

var shoppingList = ["Eggs","Milk"]
println("The shopping list contains\(shoppingList.count) items.")
shoppingList.append("Flour")
shoppingList += ["Baking Power"]
shoppingList += ["Chocolate Spreed","Cheese","Butter"]
var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"



