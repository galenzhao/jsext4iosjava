//
//  GZJSext.h
//  GZJSext
//
//  Created by galenzhao on 2018/4/15.
//  Copyright © 2018 galenzhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface GZJSext : NSObject
    {
        JSContext *_context;
    }
    
    -(instancetype)initWithScript:(NSString *)script;
    -(JSValue *)call:(NSString *)function withJson:(NSString *)json;
    
@end
