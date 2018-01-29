//
//  ViewController.h
//  Labb3
//
//  Created by will on 2018-01-29.
//  Copyright © 2018 will. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableView.h"
#import "Model.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) CustomTableView *tableView;
@property (nonatomic) Model *engine;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

