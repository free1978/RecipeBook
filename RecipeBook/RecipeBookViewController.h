//
//  RecipeBookViewController.h
//  RecipeBook
//
//  Created by lijun on 13-7-16.
//  Copyright (c) 2013年 li jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeBookViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) IBOutlet UITableView *tableView2;

@end
