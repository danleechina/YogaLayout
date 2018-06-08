//
//  NodeTree.m
//  YogaLayout
//
//  Created by Dan Lee on 2018/5/17.
//  Copyright © 2018年 Dan Lee. All rights reserved.
//

#import "NodeTree.h"

@implementation NodeTree

- (instancetype)initWithElementName:(NSString *)elementName
                      attributeDict:(NSDictionary<NSString *,NSString *> *)attributeDict {
    self = [super init];
    self.superNode = nil;
    self.subNodes = [NSMutableArray array];
    self.attributeDict = attributeDict;
    self.elementName = elementName;
    return self;
}

@end
