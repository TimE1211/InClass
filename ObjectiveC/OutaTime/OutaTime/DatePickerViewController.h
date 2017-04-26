//
//  DatePickerViewController.h
//  OutaTime
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerDelegate

- (void)dateWasChosen:(NSDate *)chosenDate;

@end

@interface DatePickerViewController : UIViewController

@property (nonatomic) id<DatePickerDelegate> delegate;

@end
