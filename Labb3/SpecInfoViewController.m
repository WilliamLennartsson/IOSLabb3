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

@end

@implementation SpecInfoViewController
-(void)viewWillDisappear:(BOOL)animated{
    //[self.infoDic setValue:self.specInfoTextView.text forKey:@"TextInfo"];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.title = self.infoDic[@"Title"];
    
    //NSString *hej = self.infoDic[@"InfoText"];
    //NSLog(@"%@ D object", self.infoDic);
    //NSLog(@"%@ D InfoText ", self.infoDic[@"InfoText"]);
    //NSLog(@"string hej %@", hej);
    //NSLog(@"%@", self.specInfoTextView);
    
    //[self.specInfoTextView setText:@"wdasdaw"];
    
    

    //self.specInfoTextView.text = (@"%@",self.infoDic[@"InfoText"]);
    
}
- (IBAction)favoriteSwitch:(id)sender {
    [self.specInfoTextView setText: self.infoDic[@"InfoText"]];
    
    //NSLog(@" %@", );
}
- (IBAction)onClickSaveBtn:(id)sender {
    NSString *temp = [self.specInfoTextView text];
    //temp = [NSString stringWithFormat:@"%@", temp];
    //[self.infoDic[@"InfoText"] setValue:temp forKey:@"InfoText"];
    NSLog(@"saveTemp %@ ", temp);
    //[self.infoDic[@"InfoText"] setString:temp];
    [self.infoDic setValue:temp forKeyPath:@"InfoText"];
    
    [self.infoDic valueForKey:@"InfoText"];
    
    NSMutableDictionary *b = @(@"InfoText":@"", @"":@""];
    [self.infoDic willChange:<#(NSKeyValueChange)#> valuesAtIndexes:<#(nonnull NSIndexSet *)#> forKey:<#(nonnull NSString *)#>];
    
    
    
    //NSLog(@"%@", self.infoDic);
    //[self.infoDic setValue:@"InfoText" forKey:temp];
    
    //[self.infoDic[@"InfoText"] setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#>];
    
    
    //NSString *temp = self.specInfoTextView.text;
    //[self.infoDic setValue:temp forKey:@"TextInfo"];
    //self.infoText = self.textField.text;
    //[self.navigationController popViewControllerAnimated:YES];

}
-(void) saveButton {
    //[self.animals addObject:self.animalName.text];
    //[self.navigationController popViewControllerAnimated:YES];
    
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
