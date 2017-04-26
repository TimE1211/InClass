//
//  CardCell.h
//  CollectEmAll
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *characterNameLabel;

@end
