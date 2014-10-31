//
//  ViewController.swift
//  coreDataExample
//
//  Created by student on 10/31/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    var item = [String]()

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func additem(sender: AnyObject) {
        var alert = UIAlertController(title: "New item", message: "Add a new item", preferredStyle: .Alert)
        
        //สร้างปุ่ม save ในAlert
        
        let saveAction = UIAlertAction(title: "Save", style: .Default){
            (action: UIAlertAction!) -> Void in
                let textField = alert.textFields![0] as UITextField
                self.item.append(textField.text)
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
        return item.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        cell.textLabel!.text = item[indexPath.row]
        return cell
    }


}

