//
//  UIView+YogaLayout.m
//  YogaLayout
//
//  Created by Dan Lee on 2018/5/18.
//  Copyright © 2018年 Dan Lee. All rights reserved.
//

#import "UIView+YogaLayout.h"
#import "UIView+Yoga.h"
#import "YGStylePropery.h"
#import <objc/runtime.h>

static const void *kYGYogaLayoutAssociatedKey = &kYGYogaLayoutAssociatedKey;

@implementation UIView (YogaLayout)

- (NSString *)identifier {
    return objc_getAssociatedObject(self, kYGYogaLayoutAssociatedKey);
}

- (void)setIdentifier:(NSString *)identifier {
    objc_setAssociatedObject(self, kYGYogaLayoutAssociatedKey, identifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setStyle:(NSString *)style {
    NSString *filterStyle = [style stringByReplacingOccurrencesOfString:@"'" withString:@""];
    filterStyle = [filterStyle stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    filterStyle = [filterStyle stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSArray *styleProperties = [filterStyle componentsSeparatedByString:@";"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:styleProperties.count];
    for (NSString *property in styleProperties) {
        NSArray *pair = [property componentsSeparatedByString:@":"];
        if (pair.count == 2) {
            dict[pair[0]] = pair[1];
        }
    }
    YGStylePropery *layout = [[YGStylePropery alloc] initWithOwnerView:self];
    for (NSString *key in dict.allKeys) {
        NSString *value = dict[key];
        [layout setValue:value forKey:key];
    }
    self.yoga.isEnabled = YES;
}

- (NSString *)style { return @""; }

@end
