//
//  IPCustomView.m
//  ios.lesson2.task.gesture
//
//  Created by Admin on 22/04/2019.
//  Copyright © 2019 w3dip. All rights reserved.
//

#import "IPCustomView.h"

@interface IPCustomView()
@property (assign, nonatomic) CGPoint viewPoint;
@property (assign, nonatomic) CGFloat centerX;
@end

@implementation IPCustomView

- (id) initWithParent:(UIView *)parent {
    if (self = [super initWithFrame:CGRectMake(CGRectGetMidX(parent.bounds) - 50,
                                              CGRectGetMidY(parent.bounds) - 50,
                                              100, 100)]) {
        self.parent = parent;
        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1];
        
        UIPanGestureRecognizer* gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(handlePan:)];
        gestureRecognizer.delegate = self;
        [self addGestureRecognizer:gestureRecognizer];
        self.centerX = CGRectGetMidX(self.bounds);
    }
    return self;
}


- (void) handlePan:(UIPanGestureRecognizer*) gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint touchPoint = [gestureRecognizer locationInView:self];
        self.viewPoint = CGPointMake(self.centerX - touchPoint.x, self.centerX - touchPoint.y);
    }
    CGPoint parentTouchPoint = [gestureRecognizer locationInView:self.parent];
    CGPoint targetPoint = CGPointMake(parentTouchPoint.x + self.viewPoint.x, parentTouchPoint.y + self.viewPoint.y);
    if (targetPoint.x < self.centerX) {
        targetPoint.x = self.centerX;
    } else if (targetPoint.x > self.parent.bounds.size.width - self.centerX) {
        targetPoint.x = self.parent.bounds.size.width - self.centerX;
    }
    self.center = targetPoint;
    
    CGFloat color = 1.f - (CGFloat)((self.center.x - self.centerX) / (self.parent.bounds.size.width - self.centerX * 2));
    self.backgroundColor = [UIColor colorWithWhite:color alpha:1];
}
@end
