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
airports["LHR"] = "London Heathrow"
// the airport dictionary now contains 3 item
airports

if let oldValue = airports.updateValue("Dublin Tnternational", forKey: "DUB"){
    println("THe old value for DUB was \(oldValue).")
}//เป็นการเปลี่ยนค่าแล้วบอกค่าเดิม
airports


//ลบข้อมูลใน dictionary
airports["APL"] = "Apple International"

airports["APL"] = nil
//คำสั่งในการลบ

if let removedValue = airports.removeValueForKey("DUB"){
    println("The removed airport's name is \(removedValue).")
}else{
    println("The airports dictionary dose not contain a value for DUB.")
}//ลบข้อมูลจากkey





