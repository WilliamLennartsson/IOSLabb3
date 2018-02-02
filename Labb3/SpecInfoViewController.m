//
//  SpecInfoViewController.m
//  Labb3
//
//  Created by will on 2018-01-31.
//  Copyright © 2018 will. All rights reserved.
//

#import "SpecInfoViewController.h"

@interface SpecInfoViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *importantSlider;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
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
   
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self textFieldTextSet];
}
-(void) textFieldTextSet{
    [self.specInfoTextView setText: self.infoDic[@"InfoText"]];
    if ([self.infoDic[@"Important"] isEqualToString:@"YES"]){
        [self.importantSlider setOn:YES];
    } else {
        [self.importantSlider setOn:NO];
    }
}

- (IBAction)onClickSaveBtn:(id)sender {
    NSLog(@"infodic = %@", self.infoDic);

    NSString *temp = [self.specInfoTextView text];
    
    NSLog(@"saveTemp %@ ", temp);
    NSLog(@"%@ infoDic", self.infoDic);
    
    BOOL boll = [self.importantSlider isOn];
    NSString *important;
    if (boll) {
        important = @"YES";
    } else {
        important = @"NO";
    }
    NSDictionary *b = @{@"Title":self.title, @"InfoText":self.specInfoTextView.text, @"Important":important};
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
