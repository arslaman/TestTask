//
//  RMParserService.h
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMAlertData.h"
#import "RMAlertParserWorker.h"

@protocol RMParserService <NSObject>

- (RMAlertData *)alertDataWithData:(NSDictionary *)data;

@end

@interface RMParserService : NSObject <RMParserService>

- (instancetype)initWithAlertParserWorker:(id<RMAlertParserWorker>)alertParserWorker;

@end
