//
//  CollectionViewController.m
//  Recipe35
//
//  Created by Joseph Hoffman on 11/18/14.
//  Copyright (c) 2014 NSCookbok. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@property (strong, nonatomic) NSArray *collectionViewImagesData;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.collectionView.dataSource = self;
	self.collectionView.delegate = self;
	
	[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
	self.collectionViewImagesData = @[@"smallImg1.jpg",@"smallImg2.jpg",@"smallImg3.jpg",@"smallImg4.jpg",@"smallImg5.jpg",@"smallImg6.jpg",@"smallImg7.jpg",@"smallImg8.jpg",@"smallImg9.jpg",@"smallImg10.jpg",@"smallImg11.jpg",@"smallImg12.jpg"];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView DataSource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	
	return self.collectionViewImagesData.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

	
	UIImage *tmpImage = [UIImage imageNamed:[self.collectionViewImagesData objectAtIndex:indexPath.item]];
	UIImageView *tmpImageView = [[UIImageView alloc] initWithImage:tmpImage];
	tmpImageView.frame = CGRectMake(0, 0, 100, 100);
	[cell addSubview:tmpImageView];
	cell.clipsToBounds = YES;
	
	return cell;
	
}

#pragma mark - UICollectionView DelegateMethods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return CGSizeMake(100, 100);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
	
	UIViewController *tmpViewController = [[UIViewController alloc] init];
	UIImage *tmpImage = [UIImage imageNamed:[self.collectionViewImagesData objectAtIndex:indexPath.item]];
	UIImageView *tmpImageView = [[UIImageView alloc] initWithImage:tmpImage];
	tmpImageView.frame = CGRectMake(10, 84, 100, 100);
	[tmpViewController.view addSubview:tmpImageView];
	tmpViewController.title = [self.collectionViewImagesData objectAtIndex:indexPath.item];
	
	[self.navigationController pushViewController:tmpViewController animated:YES];
}


@end
