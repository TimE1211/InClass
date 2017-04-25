//
//  GroceryItem.m
//  Groceries
//
//  Created by Timothy Hang on 4/24/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "GroceryItem.h"

@implementation GroceryItem

+ (GroceryItem *)groceryItemWithDictionary:(NSDictionary *)groceryItemDictionary
{
  GroceryItem *anItem = nil;
  if (groceryItemDictionary)
  {
    anItem = [[GroceryItem alloc]init];
    anItem.name = [groceryItemDictionary objectForKey:@"name"];
    anItem.category = groceryItemDictionary[@"category"];
    anItem.aisle = [[groceryItemDictionary objectForKey:@"aisle"] integerValue];
  }
  return anItem;
}

@end
