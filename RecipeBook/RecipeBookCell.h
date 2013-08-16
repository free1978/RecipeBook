//
//  RecipeBookCell.h
//  RecipeBook
//
//  Created by lijun on 13-7-16.
//  Copyright (c) 2013年 li jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeBookCell : UITableViewCell


@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;


@end
