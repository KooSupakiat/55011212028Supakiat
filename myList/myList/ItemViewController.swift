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
    
    

    @IBOutlet var textFieldItem: UITextField!
    @IBOutlet var textFieldIQuanlity: UITextField!
    @IBOutlet var textFieldInfo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveTapped(sender: AnyObject) {
        
    
        //
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        //
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("List", inManagedObjectContext: contxt)
        
        var newItem = Model(entity: en!, insertIntoManagedObjectContext: contxt)
        
        newItem.item = textFieldItem.text
        newItem.quanlity = textFieldIQuanlity.text
        newItem.info = textFieldInfo.text
        
        //save our contxt
        contxt.save(nil)
        
        println(newItem)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
                
    }
    
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
