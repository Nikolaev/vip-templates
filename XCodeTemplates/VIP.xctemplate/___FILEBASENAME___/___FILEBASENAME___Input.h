//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//


#import <Foundation/Foundation.h>

@protocol ___FILEBASENAMEASIDENTIFIER___Output;
@class ___FILEBASENAMEASIDENTIFIER___InputData;

@protocol ___FILEBASENAMEASIDENTIFIER___Input <NSObject>

- (void)setModuleOutput:(id<___FILEBASENAMEASIDENTIFIER___Output>)moduleOutput;
- (void)configureWithData:(___FILEBASENAMEASIDENTIFIER___InputData *)inputData;

@end
