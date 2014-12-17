//
//  ViewController.swift
//  Exam1_55011212028
//
//  Created by student on 12/17/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate{
    
    var items = [NSManagedObject]()
    //var items : Array<AnyObject> = []
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addItem(sender: AnyObject) {
        var alert = UIAlertController(title: "New Stocks", message: "Add a new Stocks (name,amount,price)", preferredStyle: .Alert)
        
        //สร้างปุ่ม save ในAlert
        
        let saveAction = UIAlertAction(title: "Save", style: .Default){
            (action: UIAlertAction!) -> Void in
            let nametextField = alert.textFields![0] as UITextField
            let amounttextField = alert.textFields![1] as UITextField
            let pricetextField = alert.textFields![2] as UITextField
            
            
            self.saveName(nametextField.text , amount: amounttextField.text , price: pricetextField.text)
            self.tableView.reloadData()
        }
        //สร้างปุ่ม cancel ในAlert
        let cancelAcion = UIAlertAction(title: "Cancel", style: .Default){
            (action: UIAlertAction!) -> Void in
        }
        
        
        
        
        //เพิ่ม textfield ใน alert
        
        alert.addTextFieldWithConfigurationHandler{
            (nametextField: UITextField!) -> Void in
        
            
        }
        alert.addTextFieldWithConfigurationHandler{
            (amounttextField: UITextField!) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler{
            (pricetextField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAcion)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteItem(sender: AnyObject) {
        println("delete...................")
        var alertdel = UIAlertController(title: "Delete Data", message: "Are you sure delete data", preferredStyle: .Alert)
        
        let delAction = UIAlertAction(title: "OK", style: .Default){
            (action: UIAlertAction!) -> Void in
            let ok = true
            
            
            /*let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            let context: NSManagedObjectContext = appDel.managedObjectContext!
            
            let request = NSFetchRequest(entityName: "Stocks")
            
            
            context.executeFetchRequest(request, error: nil)
            
            
            if let tv = self.tableView {
                
                var bas: NSManagedObject!
                
                
                for bas: AnyObject in self.items
                {
                    context.deleteObject(bas as NSManagedObject)
                }
                
           self.items.removeAll(keepCapacity: false)
                
                
                
                tv.reloadData()
                context.save(nil)
            }*/
    
            
            self.deletedata(ok)
            self.tableView.reloadData()
        }
        
        let cancelAcion = UIAlertAction(title: "Cancel", style: .Default){
            (action: UIAlertAction!) -> Void in
        }
        
        alertdel.addAction(delAction)
        alertdel.addAction(cancelAcion)
        presentViewController(alertdel, animated: true, completion: nil)
        
    }
    
    
    
    
    //////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"Stocks List\""
        tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest=NSFetchRequest(entityName:"Stocks")
        var error: NSError?
        
        let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let results = fetchResults{
            items = results
        }else {
            print("Cloud not savee \(error),\(error?.userInfo)")
        }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func saveName(name: String , amount: String , price : String){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Stocks", inManagedObjectContext: managedContext)
        
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        let amountin = amount.toInt()
        let pricein:Float  = (price as NSString).floatValue
        
        item.setValue(name, forKey: "name")
        item.setValue(amountin, forKey: "amount")
        item.setValue(pricein, forKey: "price")
        
        
        var error:NSError?
        if !managedContext.save(&error){
            print("Cloud not savee \(error),\(error?.userInfo)")
        }
        items.append(item)
        
        println(item)
    }
    
    
    func deletedata(ok : Bool){
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Stocks")
        
        
        context.executeFetchRequest(request, error: nil)
        
        
        if let tv = tableView {
            
            var bas: NSManagedObject!
            
            
            for bas: AnyObject in items
            {
                context.deleteObject(bas as NSManagedObject)
            }
            
            items.removeAll(keepCapacity: false)
            
            
            
            tv.reloadData()
            context.save(nil)
        }
        
    }
    
    func numberOfSectionInTableView(tableView: UITableView!) -> Int{
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item.valueForKey("name") as String?
        
        
        
        var imageName = UIImage(named: "stock.png")
        cell.imageView!.image = imageName
        
        return cell
        
        
        /*var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        var item = items[indexPath.row]
        
        if item = indexPath as NS{
        
            var data: NSManagedObject = items[item.row] as NSManagedObject
           cell.detailTextLabel?.text = data.valueForKeyPath("name") as? String
            
            
            var qnt = data.valueForKeyPath("amount") as? String
            
            var inf = data.valueForKeyPath("price") as? String
            
            
            //////
            println(cell.detailTextLabel?.text = data.valueForKeyPath("name") as? String)
            
            println("\(qnt)----\(inf)")
        
        cell.detailTextLabel?.text = "\(qnt)item/s -\(inf)"
        }
        
        return cell*/
        
       
        
    }
    
    /////UITableViewDalegate methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    
    let alertsel = UIAlertController(title: "Item selected", message: "You selected item \(items[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
    
    alertsel.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default, handler:{ (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped")
    }))
    self.presentViewController(alertsel, animated:  true, completion: nil)
}

}

