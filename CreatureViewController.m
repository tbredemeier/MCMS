//
//  CreatureViewController.m
//  MCMS
//
//  Created by tbredemeier on 5/20/14.
//  Copyright (c) 2014 Mobile Makers Academy. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (strong, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *creatureDescriptionLabel;
@property (strong, nonatomic) IBOutlet UITextField *creatureNameTextField;

@end

@implementation CreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.creatureNameLabel.text = self.creature.name;
    self.creatureDescriptionLabel.text = self.creature.description;
    self.creatureNameTextField.hidden = YES;
}

- (IBAction)onEditButtonPressed:(UIButton *)button
{
    if(self.editing)
    {
        [button setTitle:@"Edit" forState:UIControlStateNormal];
        self.creatureNameLabel.text = self.creatureNameTextField.text;
        self.creature.name = self.creatureNameTextField.text;
        self.creatureNameTextField.hidden = YES;
    }
    else
    {
        [button setTitle:@"Done" forState:UIControlStateNormal];
        self.creatureNameTextField.text = self.creature.name;
        self.creatureNameTextField.hidden = NO;
    }

    self.editing = !self.editing;
}

@end
