//
//  YogaLayoutEngine.m
//  YogaLayout
//
//  Created by Dan Lee on 2018/5/18.
//  Copyright © 2018年 Dan Lee. All rights reserved.
//

#import "YogaLayoutEngine.h"
#import "UIView+Yoga.h"
#import "NodeTree.h"
#import "NodeTree+View.h"
#import "UIView+YogaLayout.h"

typedef void (^LayoutFinishedBlock)(UIView *rootView);

@interface YogaLayoutEngine()<NSXMLParserDelegate>
@property (nonatomic, strong) NodeTree *rootNode;
@property (nonatomic, strong) NodeTree *currentNode;
@property (nonatomic, copy) LayoutFinishedBlock layoutFinishedBlock;
@property (nonatomic, strong) NSMutableDictionary *idToViewDict;
@property (nonatomic, strong) YogaLayoutResult *layoutResult;
@end

@implementation YogaLayoutEngine

static YogaLayoutEngine *engine;
+ (void)load {
    engine = [YogaLayoutEngine new];
}

+ (instancetype)shared {
    return engine;
}

- (instancetype)init {
    self = [super init];
    _idToViewDict = [NSMutableDictionary new];
    return self;
}

- (void)resetEngine {
    _rootNode = nil;
    _currentNode = nil;
    _layoutFinishedBlock = nil;
    [_idToViewDict removeAllObjects];
    _layoutResult = [YogaLayoutResult new];
}
- (void)startLayout:(NSString *)layoutName fileOwner:(YogaLayoutViewController *)owner {
    [self resetEngine];
    NSURL *file = [NSBundle.mainBundle URLForResource:layoutName withExtension:@"yoga"];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:file];
    parser.delegate = self;
    
    if ([parser parse]) {
        UIView *rootView = [self buildWihRecursionTheNode:_rootNode];
        _layoutResult.rootView = rootView;
        _layoutResult.idToViews = _idToViewDict.copy;
    }
    owner.layoutResult = _layoutResult;
}

- (UIView *)buildWihRecursionTheNode:(NodeTree *)node {
    UIView *view = [node getTheRealInstance];
    for (NodeTree *subNode in node.subNodes) {
        UIView *subview = [self buildWihRecursionTheNode:subNode];
        [view addSubview:subview];
    }
    if (view.identifier != nil && view.identifier.length > 0) {
        _idToViewDict[view.identifier] = view;
    }
    return view;
}

- (UIView *)findViewById:(NSString *)identifier {
    return _idToViewDict[identifier];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    NodeTree *thisNode = [[NodeTree alloc] initWithElementName:elementName attributeDict:attributeDict];
    if (_rootNode == nil) {
        _rootNode = thisNode;
    } else {
        thisNode.superNode = _currentNode;
        [_currentNode.subNodes addObject:thisNode];
    }
    _currentNode = thisNode;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    _currentNode = _currentNode.superNode;
}

- (void)parser:(NSXMLParser *)parser didStartMappingPrefix:(NSString *)prefix toURI:(NSString *)namespaceURI {
    
}
@end
