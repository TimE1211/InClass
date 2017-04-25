//
//  ViewController.m
//  OutaTime
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "TimeCircuitsViewController.h"
#import "DatePickerViewController.h"

@interface TimeCircuitsViewController () <DatePickerDelegate>
{
  //instance variables
  NSTimer *timer;
  NSDateFormatter *dateFormatter;
  int currentSpeed;
}

@property (weak, nonatomic) IBOutlet UILabel *destinationTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *presentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastTimeDepartedLabel;
@property (weak, nonatomic) IBOutlet UILabel *SpeedLabel;

@end

@implementation TimeCircuitsViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMMddyyyy" options:0 locale:[NSLocale currentLocale]];
  dateFormatter = [[NSDateFormatter alloc] init];
  dateFormatter.dateFormat = formatString;
  
  self.presentTimeLabel.text = [dateFormatter stringFromDate:[NSDate date]];
  currentSpeed = 0;
  self.SpeedLabel.text = [NSString stringWithFormat:@"%d MPH", currentSpeed];
  self.lastTimeDepartedLabel.text = @"--- -- ----";
  self.destinationTimeLabel.text = @"--- -- ----";
}


- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)travelBack:(UIButton *)sender
{
  if (!timer)
  {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateSpeed) userInfo:nil repeats:YES];
  }
}

- (void)stopTimer
{
  [timer invalidate];
  timer = nil;
}

- (void)updateSpeed
{
  if (currentSpeed < 88)
  {
    currentSpeed++;
    self.SpeedLabel.text = [NSString stringWithFormat:@"%d MPH", currentSpeed];
  }
  else
  {
    [self stopTimer];
    self.lastTimeDepartedLabel.text = self.presentTimeLabel.text;
    self.presentTimeLabel.text = self.destinationTimeLabel.text;
    self.SpeedLabel.text = @"0 MPH";
    currentSpeed = 0;
  }
}

- (void)dateWasChosen:(NSDate *)chosenDate
{
  self.destinationTimeLabel.text = [dateFormatter stringFromDate:chosenDate];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  DatePickerViewController *datePickerVC = [segue destinationViewController];
  datePickerVC.delegate = self;
}

@end




