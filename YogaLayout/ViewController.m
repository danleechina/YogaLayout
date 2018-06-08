//
//  ViewController.m
//  YogaLayout
//
//  Created by Dan Lee on 2018/5/17.
//  Copyright © 2018年 Dan Lee. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "UIView+YogaLayout.h"
#import "UIView+Yoga.h"
#import "YogaLayoutResult.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *rootView;
@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [YogaLayoutEngine.shared startLayout:@"CustomView" fileOwner:self];
    self.rootView = self.layoutResult.rootView;
    return self;
}

YGOutlet(UIView, firstView)
YGOutlet(UIView, firstInnerView)
YGOutlet(UIButton, secondView)

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.rootView];
    self.rootView.frame = self.view.frame;
    [self.rootView.yoga applyLayoutPreservingOrigin:YES];
    
    UIView *firstView = self.firstView;
    UIView *firstInnerView = self.firstInnerView;
    UIButton *secondView = self.secondView;
    
    [secondView setTitle:@"Hello YogaLayout" forState:UIControlStateNormal];
    [secondView setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.rootView.backgroundColor = [UIColor redColor];
    firstView.backgroundColor = [UIColor brownColor];
    firstInnerView.backgroundColor = [UIColor grayColor];
    secondView.backgroundColor = [UIColor greenColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

@end
