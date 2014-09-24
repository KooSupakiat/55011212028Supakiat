//
//  ViewController.swift
//  IOSBSwiftPrototypeCellsTutorial
//
//  Created by Supakait Jangpungsir on 9/24/2557 BE.
//  Copyright (c) 2557 Supakait Jangpungsir. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource {
    let cellIdentifer = "cellIdentifer"
    var tableData = ["bus", "Helicopter", "Truck"]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerClass(UICollectionViewCell.self, forCellReuseIdentifier: self.cellIdentifer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



// UITableVirwDataSource methods

func numberOfSectionInTableView(tableView: UITableView!) -> Int{
    return 1
}

func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
    return tableData.count
}

func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    
    var cell = tableView!.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
    
    cell.textLabel!.text = self.tableData[indexPath.row]
    var imageName = UIImage(named: tableData[indexPath.row])
    cell.imageView!.image = imageName
    return cell
}
func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
    
}

//UITableViewDalegate methods

func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    
    let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
    
    alert.addAction(UIAlertAction(title: "OK",
                                  style: UIAlertActionStyle.Default,
                       handler:{ (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped")
        }))
    self.presentViewController(alert, true, completion: nil)
}









