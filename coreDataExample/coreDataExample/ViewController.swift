//
//  ViewController.swift
//  coreDataExample
//
//  Created by student on 10/31/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource {
    
    var items = [NSManagedObject]() /*จะใช้ได้ต้อง import CoreData*/

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func additem(sender: AnyObject) {
        var alert = UIAlertController(title: "New item", message: "Add a new item", preferredStyle: .Alert)
        
        //สร้างปุ่ม save ในAlert
        
        let saveAction = UIAlertAction(title: "Save", style: .Default){
            (action: UIAlertAction!) -> Void in
                let textField = alert.textFields![0] as UITextField
            
                self.saveName(textField.text)
                self.tableView.reloadData()
        }
        //สร้างปุ่ม cancel ในAlert
        let cancelAcion = UIAlertAction(title: "Cancel", style: .Default){
            (action: UIAlertAction!) -> Void in
        }
            
            
            
            
        //เพิ่ม textfield ใน alert
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAcion)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func deletebut(sender: AnyObject) {
        println("delete...................")
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Item")
        
        
        context.executeFetchRequest(request, error: nil)
        
        
        if let tv = tableView {
            
            var bas: NSManagedObject!
            
            
            for bas: AnyObject in items
            {
                context.deleteObject(bas as NSManagedObject)
            }
            
            items.removeAll(keepCapacity: false)
            
            
            tv.reloadData()
        }
        
        
    }
    
    
    func saveName(name: String){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        item.setValue(name, forKey: "name")
        
        var error:NSError?
        if !managedContext.save(&error){
            print("Cloud not savee \(error),\(error?.userInfo)")
        }
        items.append(item)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest=NSFetchRequest(entityName:"Item")
        var error: NSError?
        
        let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let results = fetchResults{
            items = results
        }else {
            print("Cloud not savee \(error),\(error?.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"Shopping List\""
        tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item.valueForKey("name") as String?
        
        return cell
    }
    
  /* override func tableView(tableView: UITableView?, commitEditingStyle editingStyle:UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            if let tv = tableView{
                context.deletedObjectseletedObjects(items[indexPath!.row] as NSManagedObjectContext)
                items.removeAtIndex(indexPath!.row)
                tv.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
            }
            
            var error: NSError? = nil
            if !context.save(&error){
                abort()
            }
        }
        
    }*/


}

