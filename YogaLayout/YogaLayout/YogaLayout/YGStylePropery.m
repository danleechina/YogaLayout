//
//  YGStylePropery.m
//  YogaLayout
//
//  Created by Dan Lee on 2018/5/18.
//  Copyright © 2018年 Dan Lee. All rights reserved.
//

#import "YGStylePropery.h"
#import "UIView+Yoga.h"

@interface YGStylePropery()

@property (nonatomic, weak) UIView *view;

@end

@implementation YGStylePropery

static NSDictionary *defaultSearchDictionary;

+ (void)load {
    defaultSearchDictionary =
  @{
    // direction
    @"YGDirectionInherit": @(YGDirectionInherit),
    @"YGDirectionLTR": @(YGDirectionLTR),
    @"YGDirectionRTL": @(YGDirectionRTL),
    
    // flexDirection
    @"YGFlexDirectionColumn": @(YGFlexDirectionColumn),
    @"YGFlexDirectionColumnReverse": @(YGFlexDirectionColumnReverse),
    @"YGFlexDirectionRow": @(YGFlexDirectionRow),
    @"YGFlexDirectionRowReverse": @(YGFlexDirectionRowReverse),
                                
    // justifyContent
    @"YGJustifyContentFlexStart": @(YGJustifyFlexStart),
    @"YGJustifyContentCenter": @(YGJustifyCenter),
    @"YGJustifyContentFlexEnd": @(YGJustifyFlexEnd),
    @"YGJustifyContentSpaceBetween": @(YGJustifySpaceBetween),
    @"YGJustifyContentSpaceAround": @(YGJustifySpaceAround),
                                
    // >alignSelf alignItems alignContent
    @"YGAlignAuto": @(YGAlignAuto),
    @"YGAlignFlexStart": @(YGAlignFlexStart),
    @"YGAlignCenter": @(YGAlignCenter),
    @"YGAlignFlexEnd": @(YGAlignFlexEnd),
    @"YGAlignStretch": @(YGAlignStretch),
    @"YGAlignBaseline": @(YGAlignBaseline),
    @"YGAlignSpaceBetween": @(YGAlignSpaceBetween),
    @"YGAlignSpaceAround": @(YGAlignSpaceAround),
                                
    // position
    @"YGPositionRelative": @(YGPositionTypeRelative),
    @"YGPositionAbsolute": @(YGPositionTypeAbsolute),
                                
    // flexWrap
    @"YGFlexWrapNoWrap": @(YGWrapNoWrap),
    @"YGFlexWrapWrap": @(YGWrapWrap),
    @"YGFlexWrapWrapReverse": @(YGWrapWrapReverse),
                                
    // overflow
    @"YGOverflowVisible": @(YGOverflowVisible),
    @"YGOverflowHidden": @(YGOverflowHidden),
    @"YGOverflowScroll": @(YGOverflowScroll),
                                
    // display
    @"YGDisplayFlex": @(YGDisplayFlex),
    @"YGDisplayNone": @(YGDisplayNone),
                                
//    @"YGUnitUndefined": @(YGUnitUndefined),
//    @"YGUnitPoint": @(YGUnitPoint),
//    @"YGUnitPercent": @(YGUnitPercent),
//    @"YGUnitAuto": @(YGUnitAuto),
    
//    @"YGDimensionWidth": @(YGDimensionWidth),
//    @"YGDimensionHeight": @(YGDimensionHeight),
//
//    @"YGEdgeLeft": @(YGEdgeLeft),
//    @"YGEdgeTop": @(YGEdgeTop),
//    @"YGEdgeRight": @(YGEdgeRight),
//    @"YGEdgeBottom": @(YGEdgeBottom),
//    @"YGEdgeStart": @(YGEdgeStart),
//    @"YGEdgeEnd": @(YGEdgeEnd),
//    @"YGEdgeHorizontal": @(YGEdgeHorizontal),
//    @"YGEdgeVertical": @(YGEdgeVertical),
//    @"YGEdgeAll": @(YGEdgeAll),
//
//    @"YGExperimentalFeatureWebFlexBasis": @(YGExperimentalFeatureWebFlexBasis),
    };
}

- (instancetype)initWithOwnerView:(UIView *)view {
    self = [super init];
    _view = view;
    return self;
}

- (void)setDirection:(NSString *)direction {
    NSString *key = [NSString stringWithFormat:@"YGDirection%@", direction.capitalizedString];
    if ([defaultSearchDictionary objectForKey:key]) {
        _view.yoga.direction = [defaultSearchDictionary[key] intValue];
    }
}

- (void)setFlexDirection:(NSString *)flexDirection {
    NSString *key = [NSString stringWithFormat:@"YGFlexDirection%@", flexDirection.capitalizedString];
    if ([defaultSearchDictionary objectForKey:key]) {
        _view.yoga.flexDirection = [defaultSearchDictionary[key] intValue];
    }
}

- (void)setJustifyContent:(NSString *)justifyContent {
    NSString *key = [NSString stringWithFormat:@"YGJustifyContent%@", justifyContent.capitalizedString];
    if ([defaultSearchDictionary objectForKey:key]) {
        _view.yoga.justifyContent = [defaultSearchDictionary[key] intValue];
    }
}

- (void)setAlignContent:(NSString *)alignContent {
    NSString *key = [NSString stringWithFormat:@"YGAligh%@", alignContent.capitalizedString];
    if ([defaultSearchDictionary objectForKey:key]) {
        _view.yoga.alignContent = [defaultSearchDictionary[key] intValue];
    }
}

- (void)setAlignItems:(NSString *)alignItems {
    NSString *key = [NSString stringWithFormat:@"YGAligh%@", alignItems.capitalizedString];
    if ([defaultSearchDictionary objectForKey:key]) {
        _view.yoga.alignItems = [defaultSearchDictionary[key] intValue];
    }
}

- (void)setAlignSelf:(NSString *)alignSelf {
    NSString *key = [NSString stringWithFormat:@"YGAligh%@", alignSelf.capitalizedString];
    if ([defaultSearchDictionary objectForKey:key]) {
        _view.yoga.alignSelf = [defaultSearchDictionary[key] intValue];
    }
}

- (void)setPosition:(NSString *)position {
    NSString *key = [NSString stringWithFormat:@"YGPosition%@", position.capitalizedString];
    if ([defaultSearchDictionary objectForKey:key]) {
        _view.yoga.position = [defaultSearchDictionary[key] intValue];
    }
}

- (void)setFlexWrap:(NSString *)flexWrap {
    NSString *key = [NSString stringWithFormat:@"YGFlexWrap%@", flexWrap.capitalizedString];
    if ([defaultSearchDictionary objectForKey:key]) {
        _view.yoga.flexWrap = [defaultSearchDictionary[key] intValue];
    }
}

- (void)setOverflow:(NSString *)overflow {
    NSString *key = [NSString stringWithFormat:@"YGOverflow%@", overflow.capitalizedString];
    if ([defaultSearchDictionary objectForKey:key]) {
        _view.yoga.overflow = [defaultSearchDictionary[key] intValue];
    }
}

- (void)setDisplay:(NSString *)display {
    NSString *key = [NSString stringWithFormat:@"YGDisplay%@", display.capitalizedString];
    if ([defaultSearchDictionary objectForKey:key]) {
        _view.yoga.display = [defaultSearchDictionary[key] intValue];
    }
}

- (void)setFlexGrow:(CGFloat)flexGrow {
    _view.yoga.flexGrow = flexGrow;
}

- (void)setFlexShrink:(CGFloat)flexShrink {
    _view.yoga.flexShrink = flexShrink;
}

#define YGLayout_PROPERTY(type, lowercased_name, capitalized_name)          \
- (void)set##capitalized_name:(type *)lowercased_name                       \
{                                                                           \
    if (lowercased_name == nil || lowercased_name.length == 0) return;      \
    _view.yoga.lowercased_name = [self stringToYGValue:lowercased_name];    \
}                                                                           \
                                                                            \


YGLayout_PROPERTY(NSString, flexBasis, FlexBasis)

YGLayout_PROPERTY(NSString, left, Left)
YGLayout_PROPERTY(NSString, top, Top)
YGLayout_PROPERTY(NSString, right, Right)
YGLayout_PROPERTY(NSString, bottom, Bottom)
YGLayout_PROPERTY(NSString, start, Start)
YGLayout_PROPERTY(NSString, end, End)

YGLayout_PROPERTY(NSString, marginLeft, MarginLeft)
YGLayout_PROPERTY(NSString, marginTop, MarginTop)
YGLayout_PROPERTY(NSString, marginRight, MarginRight)
YGLayout_PROPERTY(NSString, marginBottom, MarginBottom)
YGLayout_PROPERTY(NSString, marginStart, MarginStart)
YGLayout_PROPERTY(NSString, marginEnd, MarginEnd)
YGLayout_PROPERTY(NSString, marginHorizontal, MarginHorizontal)
YGLayout_PROPERTY(NSString, marginVertical, MarginVertical)
YGLayout_PROPERTY(NSString, margin, Margin)

YGLayout_PROPERTY(NSString, paddingLeft, PaddingLeft)
YGLayout_PROPERTY(NSString, paddingTop, PaddingTop)
YGLayout_PROPERTY(NSString, paddingRight, PaddingRight)
YGLayout_PROPERTY(NSString, paddingBottom, PaddingBottom)
YGLayout_PROPERTY(NSString, paddingStart, PaddingStart)
YGLayout_PROPERTY(NSString, paddingEnd, PaddingEnd)
YGLayout_PROPERTY(NSString, paddingHorizontal, PaddingHorizontal)
YGLayout_PROPERTY(NSString, paddingVertical, PaddingVertical)
YGLayout_PROPERTY(NSString, padding, Padding)


YGLayout_PROPERTY(NSString, width, Width)
YGLayout_PROPERTY(NSString, height, Height)
YGLayout_PROPERTY(NSString, minWidth, MinWidth)
YGLayout_PROPERTY(NSString, minHeight, MinHeight)
YGLayout_PROPERTY(NSString, maxWidth, MaxWidth)
YGLayout_PROPERTY(NSString, maxHeight, MaxHeight)

- (YGValue)stringToYGValue:(NSString *)stringValue {
    NSString *rawValue = [stringValue stringByReplacingOccurrencesOfString:@"%" withString:@""];
    rawValue = [rawValue stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([stringValue rangeOfString:@"%"].location != NSNotFound) {
        return YGPercentValue(rawValue.floatValue);
    } else if ([stringValue rangeOfString:@"@"].location != NSNotFound) {
        NSString *screenWidth = [NSString stringWithFormat:@"%f", UIScreen.mainScreen.bounds.size.width];
        NSString *screenHeight = [NSString stringWithFormat:@"%f", UIScreen.mainScreen.bounds.size.height];
        NSString *screenScale = [NSString stringWithFormat:@"%f", UIScreen.mainScreen.scale];
        NSString *expressionString = [stringValue stringByReplacingOccurrencesOfString:@"@ScreenWidth" withString:screenWidth];
        expressionString = [expressionString stringByReplacingOccurrencesOfString:@"@ScreenHeight" withString:screenHeight];
        expressionString = [expressionString stringByReplacingOccurrencesOfString:@"@ScreenScale" withString:screenScale];
        
        NSExpression *expression = [NSExpression expressionWithFormat:expressionString];
        NSNumber *value = [expression expressionValueWithObject:nil context:nil];
        return YGPointValue(value.floatValue);
    }
    return YGPointValue(rawValue.floatValue);
}

@end
