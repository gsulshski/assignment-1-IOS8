//
//  Card.m
//  Matchismo
//
//  Created by Gregory Ulsh on 7/27/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "Card.h"


@implementation Card : NSObject


- (int)match:(NSArray *) otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
        
    }
    
    return score;
}




@end
