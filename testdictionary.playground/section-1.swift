let array: Array<Int> = [1,2,3,4]
let dictionary: Dictionary<String,Int> = ["dog":1, "elephant":2]
var airports: [String :String] = ["TYO": "TYO","DUB":"Dublin"]

if airports.isEmpty{
    println("The airport dictionary is empty.")
}else{
    println("The airport dictionary is not empty.")
}
//เช็คว่าว่างมั้ย

println("The airports dictionary contains\(airports.count) item")

//update ค่า
airports["LHR"] = "London"
// the airport dictionary now contains 3 item
airports



