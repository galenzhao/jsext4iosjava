//
//  GZJSext.m
//  GZJSext
//
//  Created by galenzhao on 2018/4/15.
//  Copyright © 2018 galenzhao. All rights reserved.
//

#import "GZJSext.h"

@implementation GZJSext

    -(instancetype)initWithScript:(NSString *)script
    {
        if(self = [super init]){
            
            _context = [[JSContext alloc] initWithVirtualMachine:[[JSVirtualMachine alloc] init]];
            [_context evaluateScript:script];
            _context[@"console"] = [[NSObject alloc] init];
            _context[@"console"][@"log"] = ^(NSString *message) {
                NSLog(@"%s: %@", __func__, message);
            };
            
        }else{
            return nil;
        }
        
        return self;
    }

    - (JSValue *)call:(NSString *)function withJson:(NSString *)json{
        JSValue *result = [_context[function] callWithArguments:@[json]];
        if(result){
            return result;
        }
        return [JSValue valueWithUndefinedInContext:_context];
    }
    @end
