//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//


#import <UIKit/UIKit.h>
#import "___FILEBASENAMEASIDENTIFIER___Input.h"
#import "___FILEBASENAMEASIDENTIFIER___ViewControllerInput.h"
#import "___FILEBASENAMEASIDENTIFIER___ViewControllerOutput.h"

@class ___FILEBASENAMEASIDENTIFIER___Router;

@interface ___FILEBASENAMEASIDENTIFIER___ViewController : UIViewController <___FILEBASENAMEASIDENTIFIER___Input, ___FILEBASENAMEASIDENTIFIER___ViewControllerInput>

@property (strong, nonatomic) id<___FILEBASENAMEASIDENTIFIER___ViewControllerOutput> output;
@property (strong, nonatomic) ___FILEBASENAMEASIDENTIFIER___Router *router;

@end
