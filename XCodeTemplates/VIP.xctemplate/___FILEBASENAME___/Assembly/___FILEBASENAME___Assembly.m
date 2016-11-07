//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAMEASIDENTIFIER___Assembly.h"
#import "___FILEBASENAMEASIDENTIFIER___ViewController.h"
#import "___FILEBASENAMEASIDENTIFIER___Router.h"
#import "___FILEBASENAMEASIDENTIFIER___Interactor.h"
#import "___FILEBASENAMEASIDENTIFIER___Presenter.h"

@implementation ___FILEBASENAMEASIDENTIFIER___Assembly

+ (UIViewController *)instantiateViewController
{
    #warning type proper storyboard name and vc identifier
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"___FILEBASENAMEASIDENTIFIER___" bundle:nil];
    if (sb != nil) {
        ___FILEBASENAMEASIDENTIFIER___ViewController *vc = [sb instantiateViewControllerWithIdentifier:@"___FILEBASENAMEASIDENTIFIER___ViewController"];
        return vc;
    } else {
        return nil;
    }
}

+ (UIViewController<___FILEBASENAMEASIDENTIFIER___Input> *)assembly
{
    UIViewController *vc = [self instantiateViewController];
    return [self assembly:vc];
}

+ (UIViewController<___FILEBASENAMEASIDENTIFIER___Input> *)assemblyWithOutput:(id<___FILEBASENAMEASIDENTIFIER___Output>)output inputData:(___FILEBASENAMEASIDENTIFIER___InputData *)inputData
{
    ___FILEBASENAMEASIDENTIFIER___ViewController *vc = (___FILEBASENAMEASIDENTIFIER___ViewController *)[___FILEBASENAMEASIDENTIFIER___Assembly assembly];
    [vc setModuleOutput:output];
    [vc configureWithData:inputData];
    return vc;
}

+ (UIViewController<___FILEBASENAMEASIDENTIFIER___Input> *)assemblyWithOutput:(id<___FILEBASENAMEASIDENTIFIER___Output>)output
{
    ___FILEBASENAMEASIDENTIFIER___ViewController *vc = (___FILEBASENAMEASIDENTIFIER___ViewController *)[___FILEBASENAMEASIDENTIFIER___Assembly assembly];
    [vc setModuleOutput:output];
    return vc;
}

+ (UIViewController<___FILEBASENAMEASIDENTIFIER___Input> *)assemblyWithInputData:(___FILEBASENAMEASIDENTIFIER___InputData *)inputData
{
    ___FILEBASENAMEASIDENTIFIER___ViewController *vc = (___FILEBASENAMEASIDENTIFIER___ViewController *)[___FILEBASENAMEASIDENTIFIER___Assembly assembly];
    [vc configureWithData:inputData];
    return vc;
}

+ (UIViewController<___FILEBASENAMEASIDENTIFIER___Input> *)assembly:(UIViewController *)vc
{
    if (![vc isKindOfClass:[___FILEBASENAMEASIDENTIFIER___ViewController class]]) {
        return nil;
    }
    
    ___FILEBASENAMEASIDENTIFIER___ViewController *viewController = (___FILEBASENAMEASIDENTIFIER___ViewController *)vc;
    
    ___FILEBASENAMEASIDENTIFIER___Router *router = [___FILEBASENAMEASIDENTIFIER___Router new];
    router.viewController = viewController;
    
    ___FILEBASENAMEASIDENTIFIER___Presenter *presenter = [___FILEBASENAMEASIDENTIFIER___Presenter new];
    presenter.output = (id<___FILEBASENAMEASIDENTIFIER___PresenterOutput>)viewController;
    
    ___FILEBASENAMEASIDENTIFIER___Interactor *interactor = [___FILEBASENAMEASIDENTIFIER___Interactor new];
    interactor.output = (id<___FILEBASENAMEASIDENTIFIER___InteractorOutput>)presenter;
    
    viewController.output = (id<___FILEBASENAMEASIDENTIFIER___ViewControllerOutput>)interactor;
    viewController.router = router;

    return viewController;
}

@end
