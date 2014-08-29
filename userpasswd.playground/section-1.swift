class adduser{
    let user: String
    let passwd: String
    var dataUser:[String: String]
    
    init(user: String, passwd: String){
        self.user = user
        self.passwd = passwd
        dataUser=[user:passwd].self
        
    }
  
    //เพิ่ม user
    func creatuser(user: String, passwd: String){
        dataUser[user] = passwd
    }
    //เปลี่ยนpassword
    func changepass(user: String, passwd: String){
        if (dataUser.updateValue(passwd , forKey: user) != nil){
            println("change password succesful ")
        }
    }
    //ลบUser
    func removeuser(user: String){
        dataUser[user] = nil
        
    }
    


}
//เรียกใช้
let inputuser = adduser(user: "koo", passwd: "1234")
inputuser.creatuser("koo", passwd: "1234")
inputuser.creatuser("supakiat", passwd: "250")
inputuser.changepass("koo", passwd: "4321")
inputuser.creatuser("duke", passwd: "1290")
inputuser.removeuser("koo")







