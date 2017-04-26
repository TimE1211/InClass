//
//  DetailViewController.m
//  CollectEmAll
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = self.characterName;
  self.characterImageView.image = [UIImage imageNamed:self.characterImageName];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
