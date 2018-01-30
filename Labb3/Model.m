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
    NSLog(@"Before removal %ld", self.toDoArray.count);

    [self.toDoArray removeObjectAtIndex:index];
    NSLog(@"Delete index! %ld", index);
    NSLog(@"After removal %ld", self.toDoArray.count);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        if (!self.toDoArray){
            self.toDoArray = [[NSMutableArray alloc ] init];
        }
        
        self.toDoArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"bror"] mutableCopy];
        
        if (self.toDoArray.count == 0){
            self.toDoArray = @[@"Hund", @"Vaska Skump", @"Köra hoj"].mutableCopy;
        }
    }
    return self;
}

-(void) addToDo:(NSString*)inputText{
    
    if ([inputText isEqualToString:@""]){
        NSLog(@"Won't add empty strings");
    } else {
        [self.toDoArray addObject:inputText];
        [[NSUserDefaults standardUserDefaults] setObject:self.toDoArray forKey:@"bror"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

-(NSUInteger) getArrayLen {
    return self.toDoArray.count;
}
@end
