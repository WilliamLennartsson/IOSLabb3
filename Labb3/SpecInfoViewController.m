//
//  SpecInfoViewController.m
//  Labb3
//
//  Created by will on 2018-01-31.
//  Copyright © 2018 will. All rights reserved.
//

#import "SpecInfoViewController.h"

@interface SpecInfoViewController ()
@property (nonatomic) NSString *infoTitle;
@property (nonatomic) NSString *infoText;
@property (nonatomic, getter = isFavorite) BOOL favorite;
@end

@implementation SpecInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
