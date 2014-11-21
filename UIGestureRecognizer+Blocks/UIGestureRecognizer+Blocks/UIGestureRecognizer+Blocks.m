//
//  UIGestureRecognizer+Blocks.m
//  UIGestureRecognizer+Blocks
//
//  Created by Mervyn Ong on 20/11/14.
//  Copyright (c) 2014 Excaliber. All rights reserved.
//

static const char kSelectorBlocksKey;

#import <objc/runtime.h>
#import "UIGestureRecognizer+Blocks.h"

@interface UIGestureRecognizer()

@property (nonatomic, strong) NSMutableArray *blocks;

@end

@implementation UIGestureRecognizer (Blocks)


#pragma mark - Setters and Getters

-(NSMutableSet *)blocks
{
    return objc_getAssociatedObject(self, &kSelectorBlocksKey);
}

-(void)setBlockSet:(NSMutableArray *)blocks
{
    if (blocks) {
        objc_setAssociatedObject(self, &kSelectorBlocksKey, blocks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}


#pragma mark - UIGestureRecognizer Methods

-(instancetype)initWithSelectorBlock:(SelectorBlock)selectorBlock, ... NS_REQUIRES_NIL_TERMINATION;
{
    self = [self init];
    
    if (self) {
        
        self.blockSet = [NSMutableArray array];
        va_list args;
        va_start(args, selectorBlock);
        for (SelectorBlock arg = selectorBlock; arg != nil; arg = va_arg(args, SelectorBlock)) {
            [self.blocks addObject:arg];
            [self addTarget:self action:@selector(performBlockAction:)];
        }
    }
    
    return self;
}


#pragma mark - Action

-(void)performBlockAction:(UIGestureRecognizer *)sender
{
    CGPoint location = [self locationInView:self.view];
    
    for (SelectorBlock block in self.blocks) {
        block(sender, sender.state, location);
    }
}

@end
