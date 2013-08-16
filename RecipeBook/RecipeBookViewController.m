//
//  RecipeBookViewController.m
//  RecipeBook
//
//  Created by lijun on 13-7-16.
//  Copyright (c) 2013年 li jun. All rights reserved.
//

#import "RecipeBookViewController.h"
#import "RecipeDetailTableViewController.h"
#import "RecipeBookCell.h"

@interface RecipeBookViewController ()

@end

@implementation RecipeBookViewController
{
//    NSArray *recipes;
    NSMutableArray *tableData;
    NSMutableArray *thumbnails;
    NSMutableArray *prepTime;
}

@synthesize tableView2;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    recipes = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];

    
//    //如下这段用于生成recipe.plist到document目录
//    // Initialize table data
//    tableData = [NSArray arrayWithObjects:
//                 @"Egg Benedict",
//                 @"Mushroom Risotto",
//                 @"Full Breakfast",
//                 @"Hamburger",
//                 @"Ham and Egg Sandwich",
//                 @"Creme Brelee",
//                 @"White Chocolate Donut",
//                 @"Starbucks Coffee",
//                 @"Vegetable Curry",
//                 @"Instant Noodle with Egg",
//                 @"Noodle with BBQ Pork",
//                 @"Japanese Noodle with Pork",
//                 @"Green Tea",
//                 @"Thai Shrimp Cake",
//                 @"Angry Birds Cake",
//                 @"Ham and Cheese Panini", nil];
//    
//    // Initialize thumbnails
//    thumbnails = [NSArray arrayWithObjects:
//                  @"egg_benedict.jpg",
//                  @"mushroom_risotto.jpg",
//                  @"full_breakfast.jpg",
//                  @"hamburger.jpg",
//                  @"ham_and_egg_sandwich.jpg",
//                  @"creme_brelee.jpg",
//                  @"white_chocolate_donut.jpg",
//                  @"starbucks_coffee.jpg",
//                  @"vegetable_curry.jpg",
//                  @"instant_noodle_with_egg.jpg",
//                  @"noodle_with_bbq_pork.jpg",
//                  @"japanese_noodle_with_pork.jpg",
//                  @"green_tea.jpg",
//                  @"thai_shrimp_cake.jpg",
//                  @"angry_birds_cake.jpg",
//                  @"ham_and_cheese_panini.jpg", nil];
//
//    // Initialize preptime
//    prepTime = [NSArray arrayWithObjects:
//                  @"30 min",
//                  @"20 min",
//                  @"40 min",
//                  @"50 min",
//                  @"20 min",
//                  @"10 min",
//                  @"30 min",
//                  @"20 min",
//                  @"40 min",
//                  @"60 min",
//                  @"10 min",
//                  @"20 min",
//                  @"30 min",
//                  @"40 min",
//                  @"50 min",
//                  @"30 min", nil];
//    
//    NSMutableDictionary * mul = [[NSMutableDictionary alloc] initWithObjectsAndKeys:tableData,@"tableData",thumbnails,@"thumbnails",prepTime,@"prepTime", nil];
//    
//    //得到应用程序路径
//    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//
//    NSString * pathString = [paths objectAtIndex:0];
//    NSString * fileName = [pathString stringByAppendingPathComponent:@"recipe.plist"];
//    //NSLog(@"%@",fileName);
//    //向document中写入plist文件
//    [mul writeToFile:fileName atomically:YES];
    
    
//    //直接从bundle中读取
//    NSString *plistPathBundle = [[NSBundle mainBundle] pathForResource:@"recipe" ofType:@"plist"];
//
//    NSMutableDictionary *dataBundle = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPathBundle];
//    //NSLog(@"plistPathBundle: %@",dataBundle);
    
    
    //如果document中不存在,则从bundle中拷贝
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *realPath = [docPath stringByAppendingPathComponent:@"recipe.plist"];
    if([fm fileExistsAtPath:realPath] == NO)
    {
        NSString *originPath = [[NSBundle mainBundle] pathForResource:@"recipe.plist" ofType:nil];
        [fm copyItemAtPath:originPath toPath:realPath error:nil];
    }

    //从document目录中的plist文件中读取字典数据
    NSMutableDictionary * readPlist = [NSMutableDictionary dictionaryWithContentsOfFile:realPath];
    //NSLog(@"PlistDocument: %@",readPlist);
    
    //从字典数据获得数组内容  //也可以这样写[[NSArray alloc] initWithArray,已经有ARC,不用写release
    tableData = [NSMutableArray arrayWithArray:[readPlist objectForKey:@"tableData"]];
    thumbnails = [NSMutableArray arrayWithArray:[readPlist objectForKey:@"thumbnails"]];
    prepTime = [NSMutableArray arrayWithArray:[readPlist objectForKey:@"prepTime"]];

    //如果使用storyboard则不能使用这种方式,否则会导致画好的单元格不能用.
    //[self.tableView2 registerClass:[RecipeBookCell class] forCellReuseIdentifier:@"RecipeCell"];
    
    
}

#pragma mark -UITableViewDelegate--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    RecipeBookCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        NSLog(@"如果不用registerClass则每次都不会走这里");
        cell = [[RecipeBookCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:simpleTableIdentifier];
    }

    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [prepTime objectAtIndex:indexPath.row];
    //cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88.0;
}

////备注,当定义了下面的prepareForSegue之后,这个代理方法还会走,但是不会影响推出页面.
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//   
////    //打印个messageBox
////    UIAlertView *messageAlert = [[UIAlertView alloc]
////                                 initWithTitle:@"Row Selected" message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
////    // Display Alert Message
////    [messageAlert show];
//}

//如果实现该方法，表视图会自动显示“删除”按钮
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //从数据源数组中删除对应内容
    [tableData removeObjectAtIndex:indexPath.row];
    //刷新tableview显示
    [tableView reloadData];
}

#pragma mark --用于定制页面转换过程--
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"%@",sender);
    if ([segue.identifier isEqualToString:@"showRecipeDetail"])
    {
        NSIndexPath *indexPath = [self.tableView2 indexPathForSelectedRow];
        RecipeDetailTableViewController *destViewController = segue.destinationViewController;
        destViewController.recipeName = [tableData objectAtIndex:indexPath.row];
        destViewController.recipeThumbnail = [thumbnails objectAtIndex:indexPath.row];
        destViewController.recipePrepareTime = [prepTime objectAtIndex:indexPath.row];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
