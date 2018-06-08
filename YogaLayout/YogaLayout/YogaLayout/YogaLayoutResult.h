//
//  YogaLayoutResult.h
//  YogaLayout
//
//  Created by Dan Lee on 2018/5/19.
//  Copyright © 2018年 Dan Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YogaLayoutResult : NSObject

@property (nonatomic, strong) UIView *rootView;
@property (nonatomic, copy) NSDictionary<NSString *, UIView *> *idToViews;

@end
