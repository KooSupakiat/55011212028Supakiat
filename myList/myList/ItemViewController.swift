//
//  ItemViewController.swift
//  myList
//
//  Created by Supakait Jangpungsir on 12/11/2557 BE.
//  Copyright (c) 2557 Supakait Jangpungsir. All rights reserved.
//

import UIKit
import CoreData

class ItemViewController: UIViewController {
    
    var items = [NSManagedObject]()

    @IBOutlet var textFieldItem: UITextField!
    @IBOutlet var textFieldIQuanlity: UITextField!
    @IBOutlet var textFieldInfo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveTapped(sender: AnyObject) {
        
    
    
    }
    
    func saveName(item: String, quanlity:String, info: String){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("List", inManagedObjectContext: managedContext)
        
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        let quanlity = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        let info = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        item.setValue(item, forKey: "item")
        quanlity.setValue(item, forKey: "quanlity")
        info.setValue(item, forKey: "info")
        
        var error:NSError?
        if !managedContext.save(&error){
            print("Cloud not savee \(error),\(error?.userInfo)")
        }
        items.append(item)
    }
    
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
