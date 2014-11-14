//
//  ViewController.m 
//  Matchismo
//
//  Created by Gregory Ulsh on 7/26/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"



@interface ViewController ()


@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) IBOutlet UILabel *ScoreLabel;


@end

@implementation ViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]                              usingDeck:[self createDeck]];
    return _game;
}


- (Deck *)createDeck {
    return [ [PlayingCardDeck alloc] init];
}


- (IBAction)touchCardButton:(UIButton *)sender
{
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];

    
    }

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
    }

}
                                                                 
 -(NSString *)titleForCard:(Card *) card
   {
       return card.isChosen ? card.contents : @"";
   }
                                                                 
 -(UIImage *)backgroundImageForCard:(Card *)card
        {
            return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
        }

@end
