//ออกแบบเองโปรแกรมเก็บเกรด
class Inputrusume{
    let name: String
    let id: String
    let point: Int
    var dicUser: [String: String]
    var dicpoint: Dictionary<String,Int>
    
    
    init(name: String, id:String, point:Int){
        self.name = name
        self.id = id
        self.point = point
        dicUser=[id:name]
        dicpoint=[id:point]
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
        var
        let propoint = dicpoint[id]
        switch propoint{
            case <50
            
        }
        
    }
    
    
    
    
    
    
}
let inputdata = Inputrusume(name: "kookee", id: "001", point:80)
inputdata.createUser("koo", id: "002")
inputdata.countUser()
inputdata.pointUser("002", point:75)
/////








