//
//  PWTableViewController.m
//  PWNote
//
//  Created by 明妍 on 2018/11/26.
//  Copyright © 2018 明妍. All rights reserved.
//

#import "PWTableViewController.h"
#import "PWInteractor.h"

@interface PWTableViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) PWTableViewDelegate *tableViewDelegate;

@property (nonatomic, strong) PWInteractor *defaultInteractor; /**< 交互层  */

@end

@implementation PWTableViewController

#pragma mark - --------------------dealloc ------------------
#pragma mark - --------------------life cycle--------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView.delegate = self.tableViewDelegate;
    self.tableView.dataSource = self.tableViewDelegate;
}

#pragma mark - --------------------UITableViewDelegate--------------
#pragma mark - --------------------CustomDelegate--------------
#pragma mark - --------------------Event Response--------------
#pragma mark - --------------------private methods--------------
#pragma mark - --------------------getters & setters & init members ------------------

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    }
    return _tableView;
}

- (PWTableViewDelegate *)tableViewDelegate {
    if (!_tableViewDelegate) {
        _tableViewDelegate = [[PWTableViewDelegate alloc] initWithtableView:self.tableView];
    }
    return _tableViewDelegate;
}

- (PWInteractor *)defaultInteractor {
    if (!_defaultInteractor) {
        _defaultInteractor = [[PWInteractor alloc] init];
    }
    return _defaultInteractor;
}

@end
