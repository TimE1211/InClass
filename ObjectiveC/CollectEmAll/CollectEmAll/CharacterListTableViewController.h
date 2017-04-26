//
//  CharacterListTableViewController.h
//  CollectEmAll
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChosenCharacterDelegate

- (void)characterWasChosen:(NSString *)chosenCharacter;

@end

@interface CharacterListTableViewController : UITableViewController

@property (nonatomic) NSArray *characters;
@property (nonatomic) id<ChosenCharacterDelegate> delegate;       //id = any

@end
