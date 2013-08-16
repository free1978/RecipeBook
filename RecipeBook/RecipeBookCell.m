//
//  RecipeBookCell.m
//  RecipeBook
//
//  Created by lijun on 13-7-16.
//  Copyright (c) 2013年 li jun. All rights reserved.
//

#import "RecipeBookCell.h"

@implementation RecipeBookCell

@synthesize nameLabel = _nameLabel;
@synthesize prepTimeLabel = _prepTimeLabel;
@synthesize thumbnailImageView = _thumbnailImageView;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //使用storyboard方式,这个函数不会被调用.下面的初始化方法也用不着.且为weak因为会自动连接
        NSLog(@"initWithStyle reuseIdentifier");
//        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(95, 13, 165, 21)];
//        self.nameLabel.text = @"ssss";
//        [self.contentView addSubview:_nameLabel];
    }
    return self;
}

// if the cell is reusable (has a reuse identifier), this is called just before the cell is returned from the table view method dequeueReusableCellWithIdentifier:.  If you override, you MUST call super.

- (void)prepareForReuse
{
    [super prepareForReuse];
    //cell被滚动出画面时候会被调用.也就是在被重用之前
    NSLog(@"prepareForReuse: %@",_nameLabel.text);

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    //NSLog(@"setSelected: %b animated: %b",selected,animated);

}

@end
