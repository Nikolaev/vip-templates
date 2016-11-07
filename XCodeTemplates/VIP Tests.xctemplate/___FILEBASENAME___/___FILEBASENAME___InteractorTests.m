//
//  ___FILEBASENAME___InteractorTests.m
//  AllieStick
//
//  Created by nvv on 01.11.16.
//  Copyright © 2016 ICRealtime. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "___FILEBASENAME___Interactor.h"
#import <OCMock/OCMock.h>

@interface ___FILEBASENAME___InteractorTests : XCTestCase

@property (strong, nonatomic) ___FILEBASENAME___Interactor *sut;

@end

@implementation ___FILEBASENAME___InteractorTests

#pragma mark - setup

+ (void)setUp
{
    [super setUp];
}
- (void)setUp {
    [super setUp];
    self.sut = [___FILEBASENAME___Interactor new];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - ___FILEBASENAME___InteractorInput


#pragma mark - protocols


#pragma mark - notifications


@end
