//
//  SpecInfoViewController.m
//  Labb3
//
//  Created by will on 2018-01-31.
//  Copyright © 2018 will. All rights reserved.
//

#import "SpecInfoViewController.h"

@interface SpecInfoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (nonatomic) BOOL isFavorite;
@end

@implementation SpecInfoViewController

-(void)viewWillDisappear:(BOOL)animated{
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self textFieldTextSet];
    self.title = self.infoDic[@"Title"];
    
}

- (IBAction)favoriteSwitch:(id)sender {
    [self textFieldTextSet];
    self.isFavorite = !self.isFavorite;
    if (self.isFavorite){
        [self.infoDic setValue:@"fav" forKey:@"true"];
    } else if (!self.isFavorite){
        
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self textFieldTextSet];
}
-(void) textFieldTextSet{
    [self.specInfoTextView setText: self.infoDic[@"InfoText"]];
}

- (IBAction)onClickSaveBtn:(id)sender {
    NSLog(@"infodic = %@", self.infoDic);

    NSString *temp = [self.specInfoTextView text];
    
    NSLog(@"saveTemp %@ ", temp);
    NSLog(@"%@ infoDic", self.infoDic);
    
    
    NSDictionary *b = @{@"Title":self.title, @"InfoText":self.specInfoTextView.text};
    self.infoDic = b.mutableCopy;
    [self.engine addInfoTextOnIndex:b atIndex:self.cellIndex];

    NSLog(@"b = %@", b);
    

}
-(void) saveButton {

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
