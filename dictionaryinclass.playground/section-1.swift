let dictionary: Dictionary<String, Int> = ["dog": 1,"elephant":2]

    //dictionary["dog"] = 3 คำสั่งนี้errorเพราะ let เปลี่ยนแปลงค่าไม่ได้

    
//สนามบิน

var airports: [String :String] = ["TYO": "TYO","DUB":"Dublin"]

if airports.isEmpty{
    println("The airport dictionary is empty.")
    
    
}else{
    println("The airport dictionary is not empty.")
    println(airports)
}

airports["BKK"] = "Bangkok"


if let oldValue = airports.updateValue("Dublin Tnternational", forKey: "DUB"){
    println("THe old value for DUB was \(oldValue).")
}




