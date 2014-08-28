

func foodzoo(animal: String) ->String{
    var food: [String: String] = ["lion":"meat","cow":"grass","tiger":"mest","Elephant":"sugarcane"]
   
    var foodani=food[animal]
return foodani!
}

println(foodzoo("lion"))
println(foodzoo("cow"))


//var food: [String: String] = ["lion":"meat","cow":"grass"]
//food
//
//key = food["lion"]
//food["human"] = "rice"


//เอาไว้ดูค่าทั้งหมด
//for x in food.values {
//    x
//}

