//
//  GroceryDetailViewController.m
//  Groceries
//
//  Created by Timothy Hang on 4/24/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "GroceryDetailViewController.h"

@interface GroceryDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;      //{
@property (weak, nonatomic) IBOutlet UILabel * categoryLabel;//
@property (weak, nonatomic) IBOutlet UILabel* aisleLabel;   // 3 different styles for pointers}

@end

@implementation GroceryDetailViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.nameLabel.text = self.groceryItem.name;
  self.categoryLabel.text = self.groceryItem.category;
  self.aisleLabel.text = [NSString stringWithFormat:@"Aisle %ld", (long)self.groceryItem.aisle];  //%d integer
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
}
*/

@end
