//
//  GroupWallAssembly.m
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GroupWallAssembly.h"
#import "GroupWallViewController.h"
#import "GroupWallRouter.h"
#import "GroupWallInteractor.h"
#import "GroupWallPresenter.h"

@implementation GroupWallAssembly

+ (UIViewController *)instantiateViewController
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (sb != nil) {
        GroupWallViewController *vc = [sb instantiateViewControllerWithIdentifier:@"GroupWallViewController"];
        return vc;
    } else {
        return nil;
    }
}

+ (UIViewController<GroupWallInput> *)assembly
{
    UIViewController *vc = [self instantiateViewController];
    return [self assembly:vc];
}

+ (UIViewController<GroupWallInput> *)assemblyWithOutput:(id<GroupWallOutput>)output inputData:(GroupWallInputData *)inputData
{
    GroupWallViewController *vc = (GroupWallViewController *)[GroupWallAssembly assembly];
    [vc setModuleOutput:output];
    [vc configureWithData:inputData];
    return vc;
}

+ (UIViewController<GroupWallInput> *)assemblyWithOutput:(id<GroupWallOutput>)output
{
    GroupWallViewController *vc = (GroupWallViewController *)[GroupWallAssembly assembly];
    [vc setModuleOutput:output];
    return vc;
}

+ (UIViewController<GroupWallInput> *)assemblyWithInputData:(GroupWallInputData *)inputData
{
    GroupWallViewController *vc = (GroupWallViewController *)[GroupWallAssembly assembly];
    [vc configureWithData:inputData];
    return vc;
}

+ (UIViewController<GroupWallInput> *)assembly:(UIViewController *)vc
{
    if (![vc isKindOfClass:[GroupWallViewController class]]) {
        return nil;
    }
    
    GroupWallViewController *viewController = (GroupWallViewController *)vc;
    
    GroupWallRouter *router = [GroupWallRouter new];
    router.viewController = viewController;
    
    GroupWallPresenter *presenter = [GroupWallPresenter new];
    presenter.output = (id<GroupWallPresenterOutput>)viewController;
    
    GroupWallInteractor *interactor = [GroupWallInteractor new];
    interactor.output = (id<GroupWallInteractorOutput>)presenter;
    interactor.router = router;
    
    viewController.output = (id<GroupWallViewControllerOutput>)interactor;

    return viewController;
}

@end
