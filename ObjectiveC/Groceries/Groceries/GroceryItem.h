//
//  GroceryItem.h
//  Groceries
//
//  Created by Timothy Hang on 4/24/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroceryItem : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *category;   //not the actual data -> points towards data(going to be a block of data -> needs more space then one memory address)(when u use variable dont write the pointer -> called de-referencing a pointer(*) ->)
@property (assign) NSInteger aisle;

+ (GroceryItem *)groceryItemWithDictionary:(NSDictionary *)groceryItemDictionary;

@end
