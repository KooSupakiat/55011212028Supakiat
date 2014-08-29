class foodanimal{
    let animal: String
//    let status: Int
    let change: String
    var food: [String: String] = ["lion":"meat","cow":"grass","tiger":"mest","Elephant":"sugarcane"]

    
    init(animal:String, change: String){
        self.animal = animal
//        self.status = status
        self.change = change
    }
    
    
    func findfood(animal: String) -> String{
        var namefood = food[animal]
        return namefood!
    }
    
    func changefood(animal: String,change: String){
        food[animal] = change
        
    }
}
let inputanimal = foodanimal(animal: "lion", change: "milk")
inputanimal.findfood("lion")
inputanimal.changefood("lion", change: "milk")








//func foodzoo(animal: String) ->String{
//    var food: [String: String] = ["lion":"meat","cow":"grass","tiger":"mest","Elephant":"sugarcane"]
//   
//    var foodani=food[animal]
//return foodani!
//}
//
//println(foodzoo("lion"))
//println(foodzoo("cow"))


//var food: [String: String] = ["lion":"meat","cow":"grass"]
//food
//
//key = food["lion"]
//food["human"] = "rice"


//เอาไว้ดูค่าทั้งหมด
//for x in food.values {
//    x
//}

