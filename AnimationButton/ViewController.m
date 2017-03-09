//
//  ViewController.m
//  AnimationButton
//
//  Created by xujing on 17/3/7.
//  Copyright © 2017年 xujing. All rights reserved.
//

#import "ViewController.h"

#import "ZYSpreadSubButton.h"
#import "ZYSpreadButton.h"

#import "PopMenu.h"

@interface ViewController ()

@property (nonatomic, strong) PopMenu *popMenu;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSpreadButton];//从下到上，右到左展开的镰刀式按钮控件
    
}

- (void)addSpreadButton{
    ZYSpreadSubButton *button1= [[ZYSpreadSubButton alloc]initWithBackgroundImage:[UIImage imageNamed:@"clock"] highlightImage:[UIImage imageNamed:@"clock_highlight"] clickedBlock:^(int index, UIButton *sender) {
        
        NSLog(@"第%d个按钮被点击了",index+1);
    }];
    ZYSpreadSubButton *button2= [[ZYSpreadSubButton alloc]initWithBackgroundImage:[UIImage imageNamed:@"pencil"] highlightImage:[UIImage imageNamed:@"pencil_highlight"] clickedBlock:^(int index, UIButton *sender) {
        
        NSLog(@"第%d个按钮被点击了",index+1);
    }];
    ZYSpreadSubButton *button3= [[ZYSpreadSubButton alloc]initWithBackgroundImage:[UIImage imageNamed:@"juice"] highlightImage:[UIImage imageNamed:@"juice_highlight"] clickedBlock:^(int index, UIButton *sender) {
        
        NSLog(@"第%d个按钮被点击了",index+1);
    }];
    ZYSpreadSubButton *button4= [[ZYSpreadSubButton alloc]initWithBackgroundImage:[UIImage imageNamed:@"service"] highlightImage:[UIImage imageNamed:@"service_highlight"] clickedBlock:^(int index, UIButton *sender) {
        
        NSLog(@"第%d个按钮被点击了",index+1);
    }];
    ZYSpreadSubButton *button5= [[ZYSpreadSubButton alloc]initWithBackgroundImage:[UIImage imageNamed:@"shower"] highlightImage:[UIImage imageNamed:@"shower_highlight"] clickedBlock:^(int index, UIButton *sender) {
        
        NSLog(@"第%d个按钮被点击了",index+1);
    }];
    
    ZYSpreadButton *button= [[ZYSpreadButton alloc]initWithBackgroundImage:[UIImage imageNamed:@"powerButton"] highlightImage:[UIImage imageNamed:@"powerButton_highlight"] position:CGPointMake(40, self.view.frame.size.height - 40)];
    button.subButtons = @[button1,button2,button3,button4,button5];
    button.mode = SpreadModeSickleSpread;
    button.direction = SpreadDirectionRightUp;
    button.radius = 120;
    button.positionMode = SpreadPositionModeFixed;
    
    button.buttonWillSpreadBlock = ^(ZYSpreadButton *spreadButton){
        
    };
    button.buttonDidSpreadBlock = ^(ZYSpreadButton *spreadButton){
        
    };
    
    button.buttonWillCloseBlock = ^(ZYSpreadButton *spreadButton){
        
    };
    button.buttonDidCloseBlock = ^(ZYSpreadButton *spreadButton){
        
    };
    
    [self.view addSubview:button];

}


- (void)showMenu {
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
    
    MenuItem *menuItem = [MenuItem itemWithTitle:@"Flickr" iconName:@"post_type_bubble_flickr"];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Googleplus" iconName:@"post_type_bubble_googleplus" glowColor:[UIColor colorWithRed:0.840 green:0.264 blue:0.208 alpha:0.800]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Instagram" iconName:@"post_type_bubble_instagram" glowColor:[UIColor colorWithRed:0.232 green:0.442 blue:0.687 alpha:0.800]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Twitter" iconName:@"post_type_bubble_twitter" glowColor:[UIColor colorWithRed:0.000 green:0.509 blue:0.687 alpha:0.800]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Youtube" iconName:@"post_type_bubble_youtube" glowColor:[UIColor colorWithRed:0.687 green:0.164 blue:0.246 alpha:0.800]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Facebook" iconName:@"post_type_bubble_facebook" glowColor:[UIColor colorWithRed:0.258 green:0.245 blue:0.687 alpha:0.800]];
    [items addObject:menuItem];
    
    if (!_popMenu) {
        _popMenu = [[PopMenu alloc] initWithFrame:self.view.bounds items:items];
        _popMenu.menuAnimationType = kPopMenuAnimationTypeNetEase;
    }
    if (_popMenu.isShowed) {
        return;
    }
    _popMenu.didSelectedItemCompletion = ^(MenuItem *selectedItem) {
        NSLog(@"%@",selectedItem.title);
    };
    
    [_popMenu showMenuAtView:self.view];
    
    //    [_popMenu showMenuAtView:self.view startPoint:CGPointMake(CGRectGetWidth(self.view.bounds) - 60, CGRectGetHeight(self.view.bounds)) endPoint:CGPointMake(60, CGRectGetHeight(self.view.bounds))];
}
- (IBAction)shareBtnClick:(id)sender {
    
    [self showMenu];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
