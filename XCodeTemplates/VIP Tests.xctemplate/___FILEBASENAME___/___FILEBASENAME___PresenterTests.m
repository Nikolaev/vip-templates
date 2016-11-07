//
//  ___FILEBASENAME___PresenterTests.m
//  AllieStick
//
//  Created by nvv on 01.11.16.
//  Copyright © 2016 ICRealtime. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "___FILEBASENAME___Presenter.h"
#import <OCMock/OCMock.h>

@interface ___FILEBASENAME___PresenterTests : XCTestCase

@property (strong, nonatomic) ___FILEBASENAME___Presenter *sut;

@end

@implementation ___FILEBASENAME___PresenterTests

#pragma mark - setup

- (void)setUp {
    [super setUp];
    self.sut = [___FILEBASENAME___Presenter new];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - ___FILEBASENAME___PresenterInput


@end
