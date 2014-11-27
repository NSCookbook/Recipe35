//
//  ViewController.m
//  Recipe35
//
//  Created by Joseph Hoffman on 11/18/14.
//  Copyright (c) 2014 NSCookbok. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@property (strong, nonatomic) NSArray *pickerViewData;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation PickerViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.pickerView.dataSource = self;
	self.pickerView.delegate = self;
	self.pickerViewData = @[@"Row 1",@"Row 2",@"Row 3",@"Row 4",@"Row 5",@"Row 6"];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Data Source Methods
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	
	return 1;
	
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	
	return self.pickerViewData.count;
}

#pragma mark - Delegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	
	return [self.pickerViewData objectAtIndex:row];
	
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	
	UIViewController *tmpViewController = [[UIViewController alloc] init];
	tmpViewController.title = [self.pickerViewData objectAtIndex:row];
	
	[self.navigationController pushViewController:tmpViewController animated:YES];
	
}

@end
