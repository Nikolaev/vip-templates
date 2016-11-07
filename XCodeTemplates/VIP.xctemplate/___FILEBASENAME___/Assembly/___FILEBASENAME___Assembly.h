//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//


#import <Foundation/Foundation.h>
#import "___FILEBASENAMEASIDENTIFIER___Input.h"
#import "___FILEBASENAMEASIDENTIFIER___Output.h"
#import "___FILEBASENAMEASIDENTIFIER___InputData.h"

@class UIViewController;

@interface ___FILEBASENAMEASIDENTIFIER___Assembly : NSObject

+ (UIViewController *)instantiateViewController;

+ (UIViewController<___FILEBASENAMEASIDENTIFIER___Input> *)assembly;
+ (UIViewController<___FILEBASENAMEASIDENTIFIER___Input> *)assemblyWithOutput:(id<___FILEBASENAMEASIDENTIFIER___Output>)output inputData:(___FILEBASENAMEASIDENTIFIER___InputData *)inputData;
+ (UIViewController<___FILEBASENAMEASIDENTIFIER___Input> *)assemblyWithOutput:(id<___FILEBASENAMEASIDENTIFIER___Output>)output;
+ (UIViewController<___FILEBASENAMEASIDENTIFIER___Input> *)assemblyWithInputData:(___FILEBASENAMEASIDENTIFIER___InputData *)inputData;

+ (UIViewController<___FILEBASENAMEASIDENTIFIER___Input> *)assembly:(UIViewController *)vc;

@end
