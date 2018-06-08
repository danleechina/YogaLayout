//
//  NodeTree+View.m
//  YogaLayout
//
//  Created by Dan Lee on 2018/5/18.
//  Copyright © 2018年 Dan Lee. All rights reserved.
//

#import "NodeTree+View.h"
#import "UIView+YogaLayout.h"

@implementation NodeTree (View)

- (UIView *)getTheRealInstance {
    id klass = NSClassFromString(self.elementName);
    if (klass == nil) {
        // Try to get the Swift Class
        NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
        NSString *classStringName = [NSString stringWithFormat:@"_TtC%lu%@%lu%@", (unsigned long)appName.length, appName, (unsigned long)self.elementName.length, self.elementName];
        klass = NSClassFromString(classStringName);
    }
    UIView *view = [klass new];
    for (NSString *key in self.attributeDict.allKeys) {
        NSString *value = self.attributeDict[key];
        if ([key isEqualToString:@"style"]) {
            view.style = value;
        }
    }
    view.identifier = self.attributeDict[@"id"];
    return view;
}

@end
