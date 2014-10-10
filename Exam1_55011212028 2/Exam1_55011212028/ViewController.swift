//
//  ViewController.swift
//  Exam1_55011212028
//
//  Created by student on 10/10/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate {

    @IBOutlet var name: UITextField!
    @IBOutlet var volume: UITextField!
    @IBOutlet var price: UITextField!
    @IBOutlet var showmoney: UILabel!
    @IBOutlet var tableview: UITableView!
    
    let cellIdentifier = "cellIdentifier"
    var money = 0.00
    var tabledata:[String] = []
    var numvolume = 0.00
    var numprice = 0.00
    let imstring = ["stock"]
    //คำนวณราคา
    @IBAction func butprice(sender: AnyObject) {
        numvolume = Double((volume.text as NSString).doubleValue)
        numprice = Double((price.text as NSString).doubleValue)
        
        money = numprice * numvolume
        
        showmoney.text = "\(money) Bath"
    }
    //คำนวณกำไร
    @IBAction func butprofit(sender: AnyObject) {
        let three = numvolume * (numprice * (3/100))
        let five = numvolume * (numprice * (5/100))
        let ten = numvolume * (numprice * (10/100))
       
        tabledata.append("ราคาหุ้นขึ้น 3% : กำไร \(three) บาท")
        tabledata.append("ราคาหุ้นขึ้น 5% : กำไร \(five) บาท")
        tabledata.append("ราคาหุ้นขึ้น 10% : กำไร \(ten) บาท")
        print("....\(tabledata)")
        tableview.reloadData()
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tabledata.count
    }
    
    func tableView(tableView: UITableView,  didselectRowIndexPath indexPath: NSIndexPath){
        
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //var cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        //let show = tabledata[indexPath.row]
        
       var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
       
        var imageName = UIImage(named: imstring[0])
        cell.imageView!.image = imageName
        cell.textLabel!.text = tabledata[indexPath.row]
        return cell
        
    }
    

}

