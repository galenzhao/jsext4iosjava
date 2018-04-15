//
//  ViewController.m
//  jsext
//
//  Created by galenzhao on 2018/4/15.
//  Copyright © 2018 galenzhao. All rights reserved.
//

#import "ViewController.h"
//#import <JavaScriptCore/JavaScriptCore.h>
#import "Passenger.h"
#import "MJExtension.h"
#import "ValueModel.h"
#import "GZJSext.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear:(BOOL)animated
    {
        [super viewDidAppear:animated];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"verify" ofType:@"js" inDirectory:nil];
        NSError *error = nil;
        
        NSDate *start = [NSDate date];
        GZJSext *jsext = [[GZJSext alloc] initWithScript:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error]];
        if(error){
            NSLog(@"%@", error);
        }
        {
        Passenger *p1 = [[Passenger alloc] init];p1.name=@"name1";p1.price=100;
        Passenger *p2 = [[Passenger alloc] init];p2.name=@"n2";p2.price=50;
        ValueModel *value = [[ValueModel alloc] init];value.code=11;value.values=@[p1, p2];
        NSString *json = [value mj_JSONString];
        
        JSValue *result = [jsext call:@"sumofmonery" withJson:json];
        
        NSLog(@"%@", result);
        }
        NSDate *end = [NSDate date];
        
        NSLog(@"%lf", end.timeIntervalSince1970 - start.timeIntervalSince1970);
        
        {
            Passenger *p1 = [[Passenger alloc] init];p1.name=@"name1";p1.price=100;
            Passenger *p2 = [[Passenger alloc] init];p2.name=@"n2";p2.price=520;
            ValueModel *value = [[ValueModel alloc] init];value.code=11;value.values=@[p1, p2];
            NSString *json = [value mj_JSONString];
            if(error){
                NSLog(@"%@", error);
            }
            JSValue *result = [jsext call:@"sumofmonery" withJson:json];
            
            NSLog(@"%@", result);
        }
        NSDate *end2 = [NSDate date];
        NSLog(@"%lf", end2.timeIntervalSince1970 - end.timeIntervalSince1970);
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
