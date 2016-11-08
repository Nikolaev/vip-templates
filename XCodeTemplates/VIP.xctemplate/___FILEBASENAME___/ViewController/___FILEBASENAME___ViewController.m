//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//


#import "___FILEBASENAMEASIDENTIFIER___ViewController.h"
#import "___FILEBASENAMEASIDENTIFIER___Router.h"
#import "___FILEBASENAMEASIDENTIFIER___Assembly.h"

@interface ___FILEBASENAMEASIDENTIFIER___ViewController ()

@property (weak, nonatomic) id<___FILEBASENAMEASIDENTIFIER___Output> moduleOutput;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___ViewController

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
    [___FILEBASENAMEASIDENTIFIER___Assembly assembly:self];
}

#pragma mark - Life cycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.output requestInitialSetup];
}

- (void)dealloc
{

}

#pragma mark - ___FILEBASENAMEASIDENTIFIER___Input -

- (void)setModuleOutput:(id<___FILEBASENAMEASIDENTIFIER___Output>)moduleOutput
{
    _moduleOutput = moduleOutput;
}

- (void)configureWithData:(___FILEBASENAMEASIDENTIFIER___InputData *)inputData
{

}

#pragma mark - ___FILEBASENAMEASIDENTIFIER___ViewControllerInput -



#pragma mark - Private -

@end
