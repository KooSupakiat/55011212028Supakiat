//ออกแบบเองโปรแกรมเก็บเกรด
class Inputrusume{
    let name: String
    let id: String
    let point: Int
    var dicUser: [String: String]
    var dicpoint: Dictionary<String,Int>
    var dicgrade: Dictionary<String,String>
    
    init(name: String, id:String, point:Int){
        self.name = name
        self.id = id
        self.point = point
        dicUser=[id:name]
        dicpoint=[id:point]
        self.dicgrade=[String:String]()
    }
    
    func createUser(name:String, id:String){
        dicUser[id] = name
    }
    func countUser()->Int{
        var sum = dicUser.count
        return sum
    }
    func pointUser(id:String, point:Int){
        dicpoint[id] = point
    }
    func processgrade(id:String){
        var grade:String
        

        let propoint = dicpoint[id]
        println("//////pro \(propoint)")
        
        if propoint<50{
            grade = "F"
        }
        if propoint<60{
            grade = "D"
        }
        if propoint<70{
            grade = "C"
        }
        if propoint<80{
            grade = "B"
        }
        else{
            grade = "A"
        }
        
        dicgrade[id] = grade
    }
    func show
   
}
    
    

    

let inputdata = Inputrusume(name: "kookee", id: "001", point:80)
inputdata.createUser("koo", id: "002")
inputdata.countUser()
inputdata.pointUser("002", point:75)
inputdata.processgrade("001")




/////








