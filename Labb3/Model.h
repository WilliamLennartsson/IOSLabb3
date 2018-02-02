//
//  Model.h
//  Labb3
//
//  Created by will on 2018-01-29.
//  Copyright © 2018 will. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic) NSMutableArray *toDoArray;

-(void) printToDo :(NSString*) input;
-(NSUInteger) getArrayLen;
-(void) addToDo:(NSMutableDictionary*)inputText;
-(void) deleteToDoItem: (NSInteger)index;
-(void) addInfoTextOnIndex :(NSDictionary*) toDo atIndex :(int) index;



@end
