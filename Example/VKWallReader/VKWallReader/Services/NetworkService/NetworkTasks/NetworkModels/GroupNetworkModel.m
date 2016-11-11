//
//  GroupNetworkModel.m
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GroupNetworkModel.h"

@implementation GroupNetworkModel

- (BOOL)validate:(NSError *__autoreleasing *)error
{
    self.name = [self.name stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    self.name = [self.name stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    return YES;
}


@end
