//
//  ViewController.m
//  Labb3
//
//  Created by will on 2018-01-29.
//  Copyright © 2018 will. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) NSMutableArray *toDoList;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.engine = [[Model alloc]init];
    self.toDoList = [[NSMutableArray alloc] init];
    self.toDoList = self.engine.toDoArray;

    

    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.engine getArrayLen];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[self.engine toDoArray] objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.engine deleteToDoItem:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        //if ([self.engine getArrayLen] != self.toDoList.count){
            NSLog(@"Inside if");
            [self loadView];
            
        //} else {
        //    NSLog(@"Unhandled editing style! %ld", (long)editingStyle);
        //}
    }
}

-(void)loadViewIfNeeded{
    [super loadViewIfNeeded];
}

-(void)loadView{
    [super loadView];
    self.toDoList = self.engine.toDoArray;
    [self.tableView reloadData];
}

- (IBAction)addBtnPressed:(id)sender {
    NSString *inputText = [[NSString alloc] init];
    inputText = self.textField.text;
    [self.engine addToDo:inputText];
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
