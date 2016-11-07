//
//  ___FILEBASENAME___ViewControllerTests.m
//  AllieStick
//
//  Created by nvv on 01.11.16.
//  Copyright © 2016 ICRealtime. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "___FILEBASENAME___Assembly.h"
#import "___FILEBASENAME___ViewController.h"
#import <OCMock/OCMock.h>

@interface ___FILEBASENAME___ViewControllerTests : XCTestCase

@property (strong, nonatomic) ___FILEBASENAME___ViewController *sut;
@property (strong, nonatomic) UIWindow *window;

@end

@implementation ___FILEBASENAME___ViewControllerTests

#pragma mark - setup

- (void)setUp {
    [super setUp];
    self.window = [UIWindow new];
    self.sut = (___FILEBASENAME___ViewController *)[___FILEBASENAME___Assembly instantiateViewController];
}

- (void)tearDown {
    self.window = nil;
    self.sut = nil;
    [super tearDown];
}

- (void)addSUTViewToWidow
{
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:self.sut];
    nvc.navigationBarHidden = YES;
    self.window.rootViewController = nvc;
    [self.window makeKeyAndVisible];
}

#pragma mark - ___FILEBASENAME___ViewControllerInput


#pragma mark - ___FILEBASENAME___ViewControllerOutput


#pragma mark ___FILEBASENAME___Input


#pragma mark ___FILEBASENAME___Output


#pragma mark IBActions


#pragma mark - potocols -


@end
