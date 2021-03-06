//
//  PWTableViewAutoAlyoutDelegate.m
//  PWNote
//
//  Created by 明妍 on 2018/12/2.
//  Copyright © 2018 明妍. All rights reserved.
//

#import "PWTableViewAutoAlyoutDelegate.h"
#import "PWDataSource.h"
#import "UITableViewCell+PWItemView.h"

@interface PWTableViewAutoAlyoutDelegate ()

@property(nonatomic, weak) UITableView *tableView;/**< tableView  */

@end

@implementation PWTableViewAutoAlyoutDelegate

- (instancetype)initWithtableView:(UITableView *)tableView {
    if (self = [super init]) {
        self.tableView = tableView;
    }
    return self;
}

- (void)setDataSource:(PWDataSource *)dataSource {
    _dataSource = dataSource;
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<PWViewModelProtocol> viewModel = [self.dataSource viewModelWithIndexPath:indexPath];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([viewModel itemViewClass])];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([viewModel itemViewClass])];
    UIView<PWItemViewProtocol> *itemView;
    if (!cell.itemView) {
        itemView = [[[viewModel itemViewClass] alloc] init];
        cell.itemView = itemView;
    } else {
        itemView = cell.itemView;
    }
    itemView.viewModel = viewModel;
    viewModel.itemView = itemView;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<PWSectionModelProtocol> sectionModel = [self.dataSource.sectionModels objectAtIndex:section];
    return sectionModel.viewModels.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.sectionModels.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIView<PWItemViewProtocol> *itemView = cell.itemView;
    if ([itemView respondsToSelector:@selector(onSelected)]) {
        [itemView onSelected];
    }
}

@end
