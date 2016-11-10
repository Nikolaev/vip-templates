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
#import <MJRefresh/MJRefresh.h>

@interface MainViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (weak, nonatomic) id<MainOutput> moduleOutput;

@property (weak, nonatomic) IBOutlet UITableView *groupsTableView;

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
    self.title = @"Groups";
    [self setupRefreshHeader];
    self.groupsTableView.rowHeight = UITableViewAutomaticDimension;
    self.groupsTableView.estimatedRowHeight = 46.;
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

- (void)displayGroups:(NSArray<MainGroupViewModel *> *)groupsViews
{
    [self.groupsTableView.mj_header endRefreshing];
    self.groups = groupsViews;
    [self.groupsTableView reloadData];
}

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.output requestSelectGroupAtIndex:indexPath.row];
}

#pragma mark - Private -

- (void)setupRefreshHeader
{
    __weak typeof(self) weakSelf = self;
    self.groupsTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.output requestGroupsUpdate];
    }];
    
    MJRefreshHeader *refreshStateheader = [self.groupsTableView mj_header];
    if ([refreshStateheader isKindOfClass:[MJRefreshNormalHeader class]]) {
        [(MJRefreshNormalHeader *)refreshStateheader stateLabel].hidden = YES;
        refreshStateheader.automaticallyChangeAlpha = YES;
    }
}

@end
