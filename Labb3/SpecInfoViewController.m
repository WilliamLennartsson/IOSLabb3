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
@property (weak, nonatomic) IBOutlet UISwitch *doneSlider;
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
    
    [self.doneSlider setOn:self.isDone];
    
    if ([self.infoDic[@"Important"] isEqualToString:@"YES"]){
        [self.importantSlider setOn:YES];
    } else {
        [self.importantSlider setOn:NO];
    }
}

- (IBAction)onClickSaveBtn:(id)sender {
    
    BOOL isImportant = [self.importantSlider isOn];
    BOOL done = [self.doneSlider isOn];
    NSString *important;
    
    if (isImportant) {
        important = @"YES";
    } else {
        important = @"NO";
    }
    
    NSDictionary *b = @{@"Title":self.title, @"InfoText":self.specInfoTextView.text, @"Important":important};
    self.infoDic = b.mutableCopy;
    
    if (self.isDone && done){
        //nothing
    } else if (self.isDone && !done){
        [self.engine moveObjectToToDo:b atIndex:self.cellIndex];
    } else if (!self.isDone && done){
        [self.engine moveObjectToDone:b :self.cellIndex];
    } else if (!self.isDone && !done){
        [self.engine addInfoTextOnIndex:b atIndex:self.cellIndex];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
