//
//  data.swift
//  testideainclass
//
//  Created by student on 10/24/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import Foundation
class data {
    
    var username: String
    var userpassword: String
    var arraydata = Dictionary<String, String>()
    
    
    
    init (username:String , userpassword:String){
        self.username = username
        self.userpassword = userpassword
    }
    
    func dataToArray (username:String, userpassword:String){
        
        arraydata.updateValue(userpassword  , forKey: username)
        println("data : \(arraydata)")
        println(" count : \(arraydata.count)")
        
    }

    
    
    
    
}
