//
//  MainAssembly.m
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "MainAssembly.h"
#import "MainViewController.h"
#import "MainRouter.h"
#import "MainInteractor.h"
#import "MainPresenter.h"

@implementation MainAssembly

+ (UIViewController *)instantiateViewController
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (sb != nil) {
        MainViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MainViewController"];
        return vc;
    } else {
        return nil;
    }
}

+ (UIViewController<MainInput> *)assembly
{
    UIViewController *vc = [self instantiateViewController];
    return [self assembly:vc];
}

+ (UIViewController<MainInput> *)assemblyWithOutput:(id<MainOutput>)output inputData:(MainInputData *)inputData
{
    MainViewController *vc = (MainViewController *)[MainAssembly assembly];
    [vc setModuleOutput:output];
    [vc configureWithData:inputData];
    return vc;
}

+ (UIViewController<MainInput> *)assemblyWithOutput:(id<MainOutput>)output
{
    MainViewController *vc = (MainViewController *)[MainAssembly assembly];
    [vc setModuleOutput:output];
    return vc;
}

+ (UIViewController<MainInput> *)assemblyWithInputData:(MainInputData *)inputData
{
    MainViewController *vc = (MainViewController *)[MainAssembly assembly];
    [vc configureWithData:inputData];
    return vc;
}

+ (UIViewController<MainInput> *)assembly:(UIViewController *)vc
{
    if (![vc isKindOfClass:[MainViewController class]]) {
        return nil;
    }
    
    MainViewController *viewController = (MainViewController *)vc;
    
    MainRouter *router = [MainRouter new];
    router.viewController = viewController;
    
    MainPresenter *presenter = [MainPresenter new];
    presenter.output = (id<MainPresenterOutput>)viewController;
    
    MainInteractor *interactor = [MainInteractor new];
    interactor.output = (id<MainInteractorOutput>)presenter;
    
    viewController.output = (id<MainViewControllerOutput>)interactor;
    viewController.router = router;

    return viewController;
}

@end
