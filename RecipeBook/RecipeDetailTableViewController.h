//
//  RecipeDetailTableViewController.h
//  RecipeBook
//
//  Created by lijun on 13-7-17.
//  Copyright (c) 2013年 li jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailTableViewController : UITableViewController

@property (nonatomic,strong)NSString *recipeName;
@property (nonatomic,strong)NSString *recipeThumbnail;
@property (nonatomic,strong)NSString *recipePrepareTime;

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;


@end
