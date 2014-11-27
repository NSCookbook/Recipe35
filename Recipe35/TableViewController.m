//
//  TableViewController.m
//  Recipe35
//
//  Created by Joseph Hoffman on 11/18/14.
//  Copyright (c) 2014 NSCookbok. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSArray *tableViewData;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	self.tableViewData = @[@"Row 1",@"Row 2",@"Row 3",@"Row 4",@"Row 5",@"Row 6"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	
	return self.tableViewData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
	}
	
	cell.textLabel.text = [self.tableViewData objectAtIndex:indexPath.row];
	return cell;
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	UIViewController *tmpViewController = [[UIViewController alloc] init];
	tmpViewController.title = [self.tableViewData objectAtIndex:indexPath.row];
	tmpViewController.view.backgroundColor = [UIColor blackColor];
	
	[self.navigationController pushViewController:tmpViewController animated:YES];
}

@end
