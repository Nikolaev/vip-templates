//
//  ___FILEBASENAME___AssemblyTests.m
//  AllieStick
//
//  Created by nvv on 01.11.16.
//  Copyright © 2016 ICRealtime. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "___FILEBASENAME___Assembly.h"
#import "___FILEBASENAME___ViewController.h"
#import "___FILEBASENAME___Interactor.h"
#import "___FILEBASENAME___Presenter.h"
#import "___FILEBASENAME___Router.h"

@interface ___FILEBASENAME___AssemblyTests : XCTestCase

@end

@implementation ___FILEBASENAME___AssemblyTests

#pragma mark - setup

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - tests

- (void)testThatViewControllerIsCreatedProperly
{
    //given
    UIViewController *vc = [___FILEBASENAME___Assembly instantiateViewController];
    
    //then
    XCTAssertNotNil(vc, @"view controller must not be nil");
    
    XCTAssertTrue([vc conformsToProtocol:@protocol(___FILEBASENAME___Input)], @"view controller must conform to protocol %@", NSStringFromProtocol(@protocol(___FILEBASENAME___Input)));
}

- (void)testThatAssemblyCreatedAllItems
{
    //given
    UIViewController *vc = [___FILEBASENAME___Assembly instantiateViewController];
    ___FILEBASENAME___ViewController *___FILEBASENAME___VC = (___FILEBASENAME___ViewController*)[___FILEBASENAME___Assembly assembly:vc];
    ___FILEBASENAME___Interactor *interactor = (___FILEBASENAME___Interactor*)___FILEBASENAME___VC.output;
    ___FILEBASENAME___Presenter *presenter = (___FILEBASENAME___Presenter *)interactor.output;
    
    //then
    XCTAssertNotNil(___FILEBASENAME___VC.output, @"view controller must have output");
    XCTAssertNotNil(___FILEBASENAME___VC.router, @"view controller must have router");
    XCTAssertNotNil(interactor.output, @"interactor must have output");
    XCTAssertNotNil(presenter.output, @"presenter must have output");
    XCTAssertTrue([interactor isKindOfClass:[___FILEBASENAME___Interactor class]], @"interactor must be kind of class %@", NSStringFromClass([___FILEBASENAME___Interactor class]));
    XCTAssertTrue([presenter isKindOfClass:[___FILEBASENAME___Presenter class]], @"presenter must be kind of class %@", NSStringFromClass([___FILEBASENAME___Presenter class]));
    XCTAssertTrue([___FILEBASENAME___VC.router isKindOfClass:[___FILEBASENAME___Router class]], @"router must be kind of class %@", NSStringFromClass([___FILEBASENAME___Router class]));
}

@end
