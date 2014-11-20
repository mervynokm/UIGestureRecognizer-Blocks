//
//  UIGestureRecognizer+Blocks.m
//  UIGestureRecognizer+Blocks
//
//  Created by Mervyn Ong on 20/11/14.
//  Copyright (c) 2014 Excaliber. All rights reserved.
//

static const char kSelectorBlockKey;

#import <objc/runtime.h>
#import "UIGestureRecognizer+Blocks.h"

@implementation UIGestureRecognizer (Blocks)


#pragma mark - Setters and Getters

-(SelectorBlock)selectorBlock
{
    return objc_getAssociatedObject(self, &kSelectorBlockKey);
}

-(void)setSelectorBlock:(SelectorBlock)selectorBlock
{
    if (selectorBlock) {
        objc_setAssociatedObject(self, &kSelectorBlockKey, selectorBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}


#pragma mark - UIGestureRecognizer Methods

//-(instancetype)initWithSelectorBlock:(SelectorBlock)selectorBlock, ... NS_REQUIRES_NIL_TERMINATION;
//{
//    self = [super init];
//    
//    if (self) {
//        <#statements#>
//    }
//    
//    return self;
//}

@end
