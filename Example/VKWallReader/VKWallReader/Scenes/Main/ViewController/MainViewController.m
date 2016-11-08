//
//  MainViewController.m
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import "MainViewController.h"
#import "MainRouter.h"
#import "MainAssembly.h"

#import "MainModels.h"
#import "GroupDetailsCell.h"

@interface MainViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (weak, nonatomic) id<MainOutput> moduleOutput;

@property (strong, nonatomic) NSArray<MainGroupViewModel *> * groups;

@end

@implementation MainViewController

#pragma mark - Initialization -

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [MainAssembly assembly:self];
}

#pragma mark - Life cycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.groups = @[];
    [self.output requestInitialSetup];
}

- (void)dealloc
{

}

#pragma mark - MainInput -

- (void)setModuleOutput:(id<MainOutput>)moduleOutput
{
    _moduleOutput = moduleOutput;
}

- (void)configureWithData:(MainInputData *)inputData
{

}

#pragma mark - MainViewControllerInput -

#pragma mark - IBActions


#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groups.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainGroupViewModel *model = self.groups[indexPath.row];
    GroupDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupDetailsCell" forIndexPath:indexPath];
    [cell updateWithModel:model];
    return cell;
}

#pragma mark - UITableViewDelegate -


#pragma mark - Private -



@end
