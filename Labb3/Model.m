//
//  Model.m
//  Labb3
//
//  Created by will on 2018-01-29.
//  Copyright © 2018 will. All rights reserved.
//

#import "Model.h"

@implementation Model
-(void) printToDo :(NSString*) input{
    
}
-(void) deleteToDoItem: (NSInteger)index{
    [self.toDoArray removeObjectAtIndex:index];
    [self saveArrays];
}
-(void) deleteDoneItem: (NSInteger) index {
    [self.doneArray removeObjectAtIndex:index];
    [self saveArrays];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
            self.toDoArray = [[NSMutableArray alloc ] init];
            self.doneArray = [[NSMutableArray alloc] init];
        
        
        self.toDoArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"bror"] mutableCopy];
        self.doneArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"syster"] mutableCopy];
        if (self.toDoArray.count == 0){
            self.toDoArray = @[  @{@"Title": @"Hund", @"InfoText": @"Måste fan ut med hundan nu dirr"},
                                 @{@"Title": @"Vaska Skump", @"InfoText": @""},
                                 @{@"Title": @"Köra hoj", @"InfoText": @""},
                                 ].mutableCopy;
        }
        if (self.doneArray.count == 0){
            self.doneArray = @[  @{@"Title": @"Hund", @"InfoText": @"Måste fan ut med hundan nu dirr"},
                                 @{@"Title": @"Vaska Skump", @"InfoText": @""},
                                 @{@"Title": @"Köra hoj", @"InfoText": @""},
                                 ].mutableCopy;
        }
    }
    return self;
}

-(void) addToDo:(NSMutableDictionary*)inputText{
    if ([inputText[@"Title"] isEqualToString:@""]){
        NSLog(@"Won't add empty strings");
    } else {
        [self.toDoArray addObject:inputText];
        [self saveArrays];
    }
}

-(void) moveObjectToDone :(NSDictionary*) d :(int) index{
    [self.doneArray addObject:d];
    [self.toDoArray removeObjectAtIndex:index];
    [self saveArrays];
}
-(void) saveArrays{
    [[NSUserDefaults standardUserDefaults] setObject:self.toDoArray forKey:@"bror"];
    [[NSUserDefaults standardUserDefaults] setObject:self.doneArray forKey:@"syster"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void) addInfoTextOnIndex :(NSDictionary*) toDo atIndex :(int) index{
    //[self.toDoArray removeObjectAtIndex:index];
    //[self.toDoArray addObject:toDo];
    [self.toDoArray replaceObjectAtIndex:index withObject:toDo];    
    //self.toDoArray[index] = toDo;
    [self saveArrays];
}
-(void) moveObjectToToDo :(NSDictionary*) d atIndex:(int) index{
    [self.toDoArray addObject:d];
    [self.doneArray removeObjectAtIndex:index];
    [self saveArrays];
}
-(NSUInteger) getArrayLen {
    return self.toDoArray.count;
}
@end
