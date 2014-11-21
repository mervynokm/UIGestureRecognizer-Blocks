//
//  ViewController.m
//  UIGestureRecognizer+Blocks
//
//  Created by Mervyn Ong on 20/11/14.
//  Copyright (c) 2014 Excaliber. All rights reserved.
//

#import "ViewController.h"
#import "UIGestureRecognizer+Blocks.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *gr = [[UILongPressGestureRecognizer alloc]initWithSelectorBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        NSLog(@"%@", NSStringFromCGPoint(location));
    }, ^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        NSLog(@"%d", state);
    }, ^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        if (state == UIGestureRecognizerStateBegan) {
            NSLog(@"Began");
        }else if (state == UIGestureRecognizerStateEnded){
            NSLog(@"Cancelled");
        }
    },nil];

    
    [self.testLabel addGestureRecognizer:gr];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action Methods

-(void)one
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)two
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
