//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>
#import "___FILEBASENAMEASIDENTIFIER___InteractorInput.h"
#import "___FILEBASENAMEASIDENTIFIER___InteractorOutput.h"

@class ___FILEBASENAMEASIDENTIFIER___Router;

@interface ___FILEBASENAMEASIDENTIFIER___Interactor : NSObject <___FILEBASENAMEASIDENTIFIER___InteractorInput>

@property (strong, nonatomic) id<___FILEBASENAMEASIDENTIFIER___InteractorOutput> output;
@property (strong, nonatomic) ___FILEBASENAMEASIDENTIFIER___Router *router;

@end
