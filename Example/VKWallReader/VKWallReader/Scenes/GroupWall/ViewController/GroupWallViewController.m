//
//  GroupWallViewController.m
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import "GroupWallViewController.h"
#import "GroupWallAssembly.h"
#import "GroupWallModels.h"
#import "WallPostCell.h"

@interface GroupWallViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (weak, nonatomic) id<GroupWallOutput> moduleOutput;

@property (weak, nonatomic) IBOutlet UITableView *postsTableView;

@property (strong, nonatomic) NSArray<WallPostViewModel *> *posts;

@end

@implementation GroupWallViewController

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
    [GroupWallAssembly assembly:self];
}

#pragma mark - Life cycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.postsTableView.rowHeight = UITableViewAutomaticDimension;
    self.postsTableView.estimatedRowHeight = 120.;
    [self setupRefreshHeader];
    [self.output requestInitialSetup];
}

- (void)dealloc
{
    
}

#pragma mark - GroupWallInput -

- (void)setModuleOutput:(id<GroupWallOutput>)moduleOutput
{
    _moduleOutput = moduleOutput;
}

- (void)configureWithData:(GroupWallInputData *)inputData
{
    [self.output requestGroupIdUpdate:inputData.groupId];
}

#pragma mark - GroupWallViewControllerInput -

- (void)displayNavigationTitle:(NSString *)title
{
    self.title = title;
}

- (void)displayPosts:(NSArray<WallPostViewModel *> *)posts
{
    self.posts = posts;
    [self.postsTableView reloadData];
}

#pragma mark - IBActions


#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WallPostViewModel *model = self.posts[indexPath.row];
    WallPostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WallPostCell" forIndexPath:indexPath];
    [cell updateWithModel:model];
    return cell;
}

#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [self.output requestSelectGroupAtIndex:indexPath.row];
}

#pragma mark - Private -

- (void)setupRefreshHeader
{
//    __weak typeof(self) weakSelf = self;
//    self.groupsTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [weakSelf.output requestGroupsUpdate];
//    }];
//    
//    MJRefreshHeader *refreshStateheader = [self.groupsTableView mj_header];
//    if ([refreshStateheader isKindOfClass:[MJRefreshNormalHeader class]]) {
//        [(MJRefreshNormalHeader *)refreshStateheader stateLabel].hidden = YES;
//        refreshStateheader.automaticallyChangeAlpha = YES;
//    }
}

#pragma mark - Private -

@end
