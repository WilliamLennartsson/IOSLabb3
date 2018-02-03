//
//  ViewController.m
//  Labb3
//
//  Created by will on 2018-01-29.
//  Copyright © 2018 will. All rights reserved.
//

#import "ViewController.h"
#import "SpecInfoViewController.h"

@interface ViewController ()
@property (nonatomic) NSMutableArray *toDoList;
@property (nonatomic) NSDictionary *currentD;
@property (nonatomic) int previousRowIndex;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoList = [[NSMutableArray alloc] init];
    self.toDoList = self.engine.toDoArray;
}
-(void)viewWillAppear:(BOOL)animated{
    self.engine = [[Model alloc]init];

    self.toDoList = self.engine.toDoArray;
    if ([self.engine getArrayLen] != self.toDoList.count){
        [self loadView];
    }
    [self loadView];
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return @"To Do";
    } else if (section == 1){
        return @"Done";
    } else return @"";
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger i = 0;
    
    if (section == 0){
        i = [self.engine getArrayLen];
    } else if (section == 1){
        i = [self.engine.doneArray count];
    }
    return i;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"theCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSDictionary *d;
    if (!d) d = [[NSDictionary alloc] init];
    
    if (indexPath.section == 0){
        
        d = [[self.engine toDoArray] objectAtIndex:indexPath.row];
        cell.textLabel.text = d[@"Title"];
        
        if ([d[@"Important"]isEqualToString:@"YES"]){
            [cell setBackgroundColor:[UIColor greenColor]];
        }
        
    } else if(indexPath.section == 1) {
        d = [[self.engine doneArray] objectAtIndex:indexPath.row];
        cell.textLabel.text = d[@"Title"];
        
        if ([d[@"Important"]isEqualToString:@"YES"]){
            [cell setBackgroundColor:[UIColor greenColor]];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (indexPath.section == 0){
            [self.engine deleteToDoItem:indexPath.row];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        if (indexPath.section == 1){
            [self.engine deleteDoneItem:indexPath.row];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        [self loadView];
    }
}

-(void)loadViewIfNeeded{
    [super loadViewIfNeeded];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"cellInfo"]){
        UITableViewCell *cell = sender;
        
        int cellRow = (int)[self.tableView indexPathForCell:cell].row;
        int cellSection = (int) [self.tableView indexPathForCell:cell].section;
        
        self.previousRowIndex = cellRow;
        NSLog(@"%d", cellRow);
        SpecInfoViewController *infoController = [segue destinationViewController];
        
        if (cellSection == 0){
            infoController.infoDic = [self.engine.toDoArray[cellRow] mutableCopy];
            infoController.isDone = NO;
        } else if (cellSection == 1){
            infoController.infoDic = [self.engine.doneArray[cellRow] mutableCopy];
            infoController.isDone = YES;
        }
        
        infoController.engine = self.engine;
        infoController.cellIndex = cellRow;
        [infoController textFieldTextSet];
    }
}

-(void)loadView{
    [super loadView];
    [self.tableView reloadData];
}

- (IBAction)addBtnPressed:(id)sender {
    
    NSMutableDictionary *inputTitle = [[NSMutableDictionary alloc] init];
    inputTitle = @{@"Title":self.textField.text,
                   @"InfoText":@"",
                   @"Important": @"NO"
                   }.mutableCopy;
    
    [self.engine addToDo:inputTitle];
    if ([self.engine getArrayLen] != self.toDoList.count){
            [self loadView];
    }
    [self loadView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
