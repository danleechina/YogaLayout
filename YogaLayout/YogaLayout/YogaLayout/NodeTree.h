//
//  NodeTree.h
//  YogaLayout
//
//  Created by Dan Lee on 2018/5/17.
//  Copyright © 2018年 Dan Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NodeTree : NSObject

@property (nonatomic, strong) NodeTree *superNode;
@property (nonatomic, strong) NSMutableArray<NodeTree *> *subNodes;
@property (nonatomic, strong) NSDictionary<NSString *,NSString *> *attributeDict;
@property (nonatomic, copy) NSString *elementName;


- (instancetype)initWithElementName:(NSString *)elementName
                      attributeDict:(NSDictionary<NSString *,NSString *> *)attributeDict;

@end
