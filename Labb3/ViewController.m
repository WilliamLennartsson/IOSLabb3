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

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.engine = [[Model alloc]init];
    self.toDoList = [[NSMutableArray alloc] init];
    self.toDoList = self.engine.toDoArray;
    

    

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [self loadView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.engine getArrayLen];
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
    d = [[self.engine toDoArray] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = d[@"Title"];
    if (![d[@"InfoText"]isEqualToString:@""]){
        [cell setBackgroundColor:[UIColor greenColor]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.engine deleteToDoItem:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
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
        NSLog(@"%d", cellRow);
        SpecInfoViewController *infoController = [segue destinationViewController];


        
        //infoController.infoTitle = self.engine.toDoArray[cellRow][@"Title"];
        
        //infoController.infoText = self.engine.toDoArray[cellRow][@"InfoText"];
        
        
        
        
        infoController.infoDic = self.engine.toDoArray[cellRow];
        
 
    }
}

-(void)loadView{
    
    [super loadView];
    self.toDoList = self.engine.toDoArray;
    [self.tableView reloadData];
}


- (IBAction)addBtnPressed:(id)sender {
    
    NSMutableDictionary *inputTitle = [[NSMutableDictionary alloc] init];
    inputTitle = @{@"Title":self.textField.text,
                   @"InfoText":@""
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
