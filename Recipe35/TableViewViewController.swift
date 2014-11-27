//
//  TableViewViewController.swift
//  Recipe35
//
//  Created by Joseph Hoffman on 11/18/14.
//  Copyright (c) 2014 NSCookbok. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
	
	@IBOutlet var tableView: UITableView!
	var tableViewData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.dataSource = self
		tableView.delegate = self
		
		tableViewData = ["Row 1","Row 2","Row 3","Row 4","Row 5","Row 6"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: DataSource Methods
    
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
		return tableViewData.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
		var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
		
		if cell == nil {
			cell = UITableViewCell(style:.Default, reuseIdentifier: "Cell")
		}
		
		cell!.textLabel.text = tableViewData[indexPath.row]
		
		return cell as UITableViewCell!
	}
	
	// MARK: Delegate Methods
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
		
		let tmpViewController = UIViewController()
		tmpViewController.title = tableViewData[indexPath.row]
		tmpViewController.view.backgroundColor = UIColor.blackColor()
		
		self.navigationController?.pushViewController(tmpViewController, animated: true)
	}

}
