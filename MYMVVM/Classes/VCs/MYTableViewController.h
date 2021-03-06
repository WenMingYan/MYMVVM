//
//  PWTableViewController.h
//  PWNote
//
//  Created by 明妍 on 2018/11/26.
//  Copyright © 2018 明妍. All rights reserved.
//

#import "MYViewController.h"
#import "PWTableViewDelegate.h"
#import "PWInteractor.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYTableViewController : MYViewController

- (UITableView *)tableView;

- (PWTableViewDelegate *)tableViewDelegate;

- (PWInteractor *)defaultInteractor;

@end

NS_ASSUME_NONNULL_END
