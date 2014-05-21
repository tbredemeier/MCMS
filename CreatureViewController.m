//
//  CreatureViewController.m
//  MCMS
//
//  Created by tbredemeier on 5/20/14.
//  Copyright (c) 2014 Mobile Makers Academy. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (strong, nonatomic) IBOutlet UITextField *creatureNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *creatureDescriptionTextField;
@property (strong, nonatomic) IBOutlet UIImageView *creatureImageView;

@end

@implementation CreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.creatureNameTextField.text = self.creature.name;
    self.creatureDescriptionTextField.text = self.creature.description;
    self.creatureImageView.image = self.creature.image;
    self.creatureNameTextField.enabled = NO;
    self.creatureDescriptionTextField.enabled = NO;
}

- (IBAction)onEditButtonPressed:(UIButton *)button
{
    if(self.editing)
    {
        [button setTitle:@"Edit" forState:UIControlStateNormal];
        self.creature.name = self.creatureNameTextField.text;
        self.creature.description = self.creatureDescriptionTextField.text;
        self.creatureNameTextField.enabled = NO;
        self.creatureDescriptionTextField.enabled = NO;
    }
    else
    {
        [button setTitle:@"Done" forState:UIControlStateNormal];
        self.creatureNameTextField.text = self.creature.name;
        self.creatureDescriptionTextField.text = self.creature.description;
        self.creatureNameTextField.enabled = YES;
        self.creatureDescriptionTextField.enabled = YES;
    }

    self.editing = !self.editing;
}

@end
