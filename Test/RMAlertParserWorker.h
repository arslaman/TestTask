//
//  RMAlertParserWorker.h
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMAlertData.h"

@protocol RMAlertParserWorker <NSObject>

- (RMAlertData *)alertDataWithData:(NSDictionary *)data;

@end

@interface RMAlertParserWorker : NSObject <RMAlertParserWorker>

@end
