//
//  ViewController.swift
//  nameboxtotable
//
//  Created by Student on 9/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    let cellIdentifier = "cellIdentifier"
//    var ListStudent = [Student]()
    var ListStudent = ["kookee"]
    
    @IBOutlet weak var lableName: UILabel!
    
    @IBOutlet weak var nameInput: UITextField!
    
   
    @IBAction func okButton(sender: UIButton) {
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //UITableViewDataSource
    
    func numberOfSectionInTableView(tableView: UITableView!) -> Int{
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return ListStudent.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        
            cell.textLabel!.text = ListStudent[indexPath.row]
            return cell
    
    }


}

