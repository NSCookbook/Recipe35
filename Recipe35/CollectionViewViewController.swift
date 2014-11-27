//
//  CollectionViewViewController.swift
//  Recipe35
//
//  Created by Joseph Hoffman on 11/18/14.
//  Copyright (c) 2014 NSCookbok. All rights reserved.
//

import UIKit

class CollectionViewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	var collectionViewImagesData = [String]()
	@IBOutlet var collectionView: UICollectionView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		collectionViewImagesData = ["smallImg1.jpg","smallImg2.jpg","smallImg3.jpg","smallImg4.jpg","smallImg5.jpg","smallImg6.jpg","smallImg7.jpg","smallImg8.jpg","smallImg9.jpg","smallImg10.jpg","smallImg11.jpg","smallImg12.jpg"]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
		return collectionViewImagesData.count
	}
	

	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
		
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
		
		let tmpImage = UIImage(named: collectionViewImagesData[indexPath.item])
		let tmpImageView = UIImageView(image:tmpImage)
		tmpImageView.frame = CGRectMake(0,0,100,100)
		cell.addSubview(tmpImageView)
		return cell
		
	}
	
	func collectionView(collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
			
			return CGSizeMake(100, 100)
	}
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
		
		let tmpViewController = UIViewController()
		let tmpImage = UIImage(named: collectionViewImagesData[indexPath.item])
		let tmpImageView = UIImageView(image:tmpImage)
		tmpImageView.frame = CGRectMake(10,84,100,100)
		tmpViewController.view.addSubview(tmpImageView)
		tmpViewController.title = collectionViewImagesData[indexPath.item]
		tmpViewController.view.backgroundColor = UIColor.blackColor()
		
		self.navigationController?.pushViewController(tmpViewController, animated: true)
	}


}
