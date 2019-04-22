//
//  IPCustomView.h
//  ios.lesson2.task.gesture
//
//  Created by Admin on 22/04/2019.
//  Copyright © 2019 w3dip. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPCustomView : UIView <UIGestureRecognizerDelegate>
@property (weak, nonatomic) UIView *parent;

- (id) initWithParent:(UIView * )parent;
@end

NS_ASSUME_NONNULL_END
