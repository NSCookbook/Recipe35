//
//  PickerViewControllerSwift.swift
//  Recipe35
//
//  Created by Joseph Hoffman on 11/18/14.
//  Copyright (c) 2014 NSCookbok. All rights reserved.
//

import UIKit

class PickerViewControllerSwift: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
	
	var pickerViewData = [String]()
	@IBOutlet var pickerView: UIPickerView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		pickerView.delegate = self
		pickerView.dataSource = self

		pickerViewData = ["Row 1","Row 2","Row 3","Row 4","Row 5","Row 6"]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: - Data Source Methods
	
	// returns the number of 'columns' to display.
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
		return 1
	}
	
	// returns the # of rows in each component..
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
		return pickerViewData.count
	}
	
	// MARK: - Delegate Methods
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
		
		return pickerViewData[row]
		
	}
	
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
		
		let tmpViewController = UIViewController()
		tmpViewController.title = pickerViewData[row]
		tmpViewController.view.backgroundColor = UIColor.blackColor()
		
		self.navigationController?.pushViewController(tmpViewController, animated: true)
		
	}

}
