//
//  PhasesTableViewController.m
//  MoonPhase
//
//  Created by Timothy Hang on 4/27/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "PhasesTableViewController.h"
#import "MoonPhase-Swift.h"

@interface PhasesTableViewController ()

@property (nonatomic) NSMutableArray *phases;

@end

@implementation PhasesTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.phases = [[Phase loadPhases] mutableCopy];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.phases.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  PhaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhaseCell" forIndexPath:indexPath];
  
  Phase *aPhase = self.phases[indexPath.row];
  cell.phaseImageView.image = [UIImage imageNamed:aPhase.imageName];
  cell.phaseNameLabel.text = aPhase.phase;
  cell.illuminationLabel.text = [NSString stringWithFormat:@"%ld%%",(long)aPhase.illumination];
  cell.dateLabel.text = aPhase.date;
  
  
  return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"ShowPhaseDetailSegue"])
  {
    PhaseDetailViewController *detailVC = [segue destinationViewController];
    NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];
    Phase *aPhase = self.phases[indexpath.row];
    detailVC.aPhase = aPhase;
  }
}

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue
{
  
}

@end
