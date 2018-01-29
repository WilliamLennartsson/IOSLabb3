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
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.toDoArray = [[NSMutableArray alloc ] init];
        
        self.toDoArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"bror"] mutableCopy];
        if (self.toDoArray.count == 0){
            self.toDoArray = @[@"Hund", @"Vaska Skump", @"Köra hoj"].mutableCopy;
        }
    }
        
    return self;
}

-(void) addToDo:(NSString*)inputText{
    
    [self.toDoArray addObject:inputText];
    [[NSUserDefaults standardUserDefaults] setObject:self.toDoArray forKey:@"bror"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(NSUInteger) getArrayLen {
    return (int)self.toDoArray.count;
}
@end
