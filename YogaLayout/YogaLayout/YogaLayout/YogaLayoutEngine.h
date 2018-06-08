//
//  YogaLayoutEngine.h
//  YogaLayout
//
//  Created by Dan Lee on 2018/5/18.
//  Copyright © 2018年 Dan Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YogaLayoutResult.h"
#import "YogaLayoutViewController.h"

#define YGOutlet(type, lowercased_name) \
static const void *lowercased_name##KYGYogaLayoutAssociatedKey = &lowercased_name##KYGYogaLayoutAssociatedKey;\
- (type *)lowercased_name {\
type *theView = (type *)objc_getAssociatedObject(self, lowercased_name##KYGYogaLayoutAssociatedKey);\
if (theView == nil) { \
    theView = (type *)self.layoutResult.idToViews[@#lowercased_name""];\
    if (theView != nil) \
        objc_setAssociatedObject(self, lowercased_name##KYGYogaLayoutAssociatedKey, theView, OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
}\
\
return theView;\
}\


@interface YogaLayoutEngine : NSObject
- (void)startLayout:(NSString *)layoutName fileOwner:(YogaLayoutViewController *)owner;
- (UIView *)findViewById:(NSString *)identifier;
+ (instancetype)shared;
@end
