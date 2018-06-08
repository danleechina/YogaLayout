//
//  YGStylePropery.h
//  YogaLayout
//
//  Created by Dan Lee on 2018/5/18.
//  Copyright © 2018年 Dan Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Yoga.h"

@interface YGStylePropery : NSObject

- (instancetype)initWithOwnerView:(UIView *)view;

@property (nonatomic, assign, setter=setIncludedInLayout:) BOOL isIncludedInLayout;
@property (nonatomic, assign, setter=setEnabled:) BOOL isEnabled;

@property (nonatomic, assign) NSString *direction;
@property (nonatomic, assign) NSString *flexDirection;
@property (nonatomic, assign) NSString *justifyContent;
@property (nonatomic, assign) NSString *alignContent;
@property (nonatomic, assign) NSString *alignItems;
@property (nonatomic, assign) NSString *alignSelf;
@property (nonatomic, assign) NSString *position;
@property (nonatomic, assign) NSString *flexWrap;
@property (nonatomic, assign) NSString *overflow;
@property (nonatomic, assign) NSString *display;

@property (nonatomic, assign) CGFloat flexGrow;
@property (nonatomic, assign) CGFloat flexShrink;
@property (nonatomic, copy) NSString *flexBasis;

@property (nonatomic, copy) NSString *left;
@property (nonatomic, copy) NSString *top;
@property (nonatomic, copy) NSString *right;
@property (nonatomic, copy) NSString *bottom;
@property (nonatomic, copy) NSString *start;
@property (nonatomic, copy) NSString *end;

@property (nonatomic, copy) NSString *marginLeft;
@property (nonatomic, copy) NSString *marginTop;
@property (nonatomic, copy) NSString *marginRight;
@property (nonatomic, copy) NSString *marginBottom;
@property (nonatomic, copy) NSString *marginStart;
@property (nonatomic, copy) NSString *marginEnd;
@property (nonatomic, copy) NSString *marginHorizontal;
@property (nonatomic, copy) NSString *marginVertical;
@property (nonatomic, copy) NSString *margin;

@property (nonatomic, copy) NSString *paddingLeft;
@property (nonatomic, copy) NSString *paddingTop;
@property (nonatomic, copy) NSString *paddingRight;
@property (nonatomic, copy) NSString *paddingBottom;
@property (nonatomic, copy) NSString *paddingStart;
@property (nonatomic, copy) NSString *paddingEnd;
@property (nonatomic, copy) NSString *paddingHorizontal;
@property (nonatomic, copy) NSString *paddingVertical;
@property (nonatomic, copy) NSString *padding;

@property (nonatomic, assign) CGFloat borderLeftWidth;
@property (nonatomic, assign) CGFloat borderTopWidth;
@property (nonatomic, assign) CGFloat borderRightWidth;
@property (nonatomic, assign) CGFloat borderBottomWidth;
@property (nonatomic, assign) CGFloat borderStartWidth;
@property (nonatomic, assign) CGFloat borderEndWidth;
@property (nonatomic, assign) CGFloat borderWidth;

@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *height;
@property (nonatomic, copy) NSString *minWidth;
@property (nonatomic, copy) NSString *minHeight;
@property (nonatomic, copy) NSString *maxWidth;
@property (nonatomic, copy) NSString *maxHeight;

@property (nonatomic, assign) CGFloat aspectRatio;

@end
