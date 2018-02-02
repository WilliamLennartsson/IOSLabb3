//
//  SpecInfoViewController.h
//  Labb3
//
//  Created by will on 2018-01-31.
//  Copyright © 2018 will. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface SpecInfoViewController : ViewController
@property (nonatomic) NSString *infoTitle;
@property (nonatomic) IBOutlet UITextView *specInfoTextView;
@property (nonatomic) NSString *infoText;
@property (nonatomic, getter = isFavorite) BOOL favorite;
@property (nonatomic) NSMutableDictionary *infoDic;
@property (nonatomic) Model *engine;
@property (nonatomic) int cellIndex;
-(void) textFieldTextSet;



@end
