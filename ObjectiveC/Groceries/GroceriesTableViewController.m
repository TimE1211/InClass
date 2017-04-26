//
//  GroceriesTableViewController.m
//  Groceries
//
//  Created by Timothy Hang on 4/24/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "GroceriesTableViewController.h"
#import "GroceryItem.h"
#import "GroceryDetailViewController.h"

@interface GroceriesTableViewController ()

@property (nonatomic) NSMutableArray *groceries;

@end

@implementation GroceriesTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.groceries = [[NSMutableArray alloc] init];         //make memory and initialize object
  
//  [self.groceries addObject:@"Carrots"];
//  [self.groceries addObject:@"Poptarts"];
  [self loadGroceries];
}
- (void)loadGroceries
{
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"groceries" ofType:@"json"];
  
  NSArray * groceriesJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:0 error:nil];
  
  for (NSDictionary *aDictionary in groceriesJSON)
  {
    GroceryItem *anItem = [GroceryItem groceryItemWithDictionary:aDictionary];
    [self.groceries addObject:anItem];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//return type//name                       //argument type//argument
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//return type//name                       //argument type//argument
{
  return self.groceries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//return type      //name      //argument type//argument                      //argument type//argument
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroceryItemCell" forIndexPath:indexPath];
  
  // Configure the cell...
  GroceryItem *groceryItem = self.groceries[indexPath.row];
  cell.textLabel.text = groceryItem.name;
  cell.detailTextLabel.text = groceryItem.category;
  
  return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"ShowDetailViewSegue"])
  {
    GroceryDetailViewController *detailVC = [segue destinationViewController];
    
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    GroceryItem *selectedGroceryItem = self.groceries[indexPath.row];
    
    detailVC.groceryItem = selectedGroceryItem;
  }
}


@end
