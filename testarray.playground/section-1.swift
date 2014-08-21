var shoppingListExplicit = [String]()
shoppingListExplicit = ["Eggs","Milk"]
//var shoppingListExplicit: [String] = ["Eggs","Milk"]

var shoppingList = ["Eggs","Milk"]
println("The shopping list contains\(shoppingList.count) items.")
//นับ
shoppingList.append("Flour")
shoppingList += ["Baking Power"]
shoppingList += ["Chocolate Spreed","Cheese","Butter"]
//เพิ่มข้อมมูล
var firstItem = shoppingList[1]
shoppingList[0] = "Six eggs"
//เปลี่ยนข้อมูล

// เปลี่ยน var เป็น let จะไม่สามารถเปลี่ยนแปลงค่าได้

//นับจำนวณข้อมูลในarray
let possibleTipsInferred = [0.5, 0.18, 0.20]
let possibleTipExlicit:[Double] = [0.5, 0.18, 0.20]
var numberOhItem = possibleTipsInferred.count

possibleTipsInferred.isEmpty
//ถ้าไม่มีข้อมูลฝน array จะเป็นค่า false

//เพิ่มค่าใน array
shoppingList.insert("pizza", atIndex: 0)
shoppingList

shoppingList.append("Flour")
shoppingList

shoppingList[1...3] = ["Banana","Apple"]
shoppingList

//ลบข้อมูล
let Flour = shoppingList.removeLast()
let Apple = shoppingList.removeAtIndex(2)
shoppingList

shoppingList.removeLast()



