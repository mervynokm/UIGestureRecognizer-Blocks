//
//  UIGestureRecognizer+Blocks.h
//  UIGestureRecognizer+Blocks
//
//  Created by Mervyn Ong on 20/11/14.
//  Copyright (c) 2014 Excaliber. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectorBlock)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location);

@interface UIGestureRecognizer (Blocks)

@property (nonatomic, copy) SelectorBlock selectorBlock;

-(instancetype)initWithSelectorBlock:(SelectorBlock)selectorBlock, ... NS_REQUIRES_NIL_TERMINATION;

@end
