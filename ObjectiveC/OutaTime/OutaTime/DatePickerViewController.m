//
//  DatePickerViewController.m
//  OutaTime
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DatePickerViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - Action Handlers

- (IBAction)cancelButtonTapped:(UIButton *)sender
{
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonTapped:(UIButton *)sender
{
  NSDate *dateChosen = self.datePicker.date;
  [self.delegate dateWasChosen:dateChosen];
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
