//
//  ViewController.m
//  MCMS
//
//  Created by tbredemeier on 5/20/14.
//  Copyright (c) 2014 Mobile Makers Academy. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *creatureNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *creatureDescriptionTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MagicalCreature *mc1 = [[MagicalCreature alloc] initWithName:@"Thomas"
                                                     description:@"Lyger"
                                                           image:[UIImage imageNamed:@"image1.png"]];
    MagicalCreature *mc2 = [[MagicalCreature alloc] initWithName:@"Ralphie"
                                                     description:@"Centaur"
                                                           image:[UIImage imageNamed:@"image2.png"]];
    MagicalCreature *mc3 = [[MagicalCreature alloc] initWithName:@"Chester"
                                                     description:@"Unicorn"
                                                           image:[UIImage imageNamed:@"image3.png"]];
    self.creatures = [NSMutableArray arrayWithObjects:mc1, mc2, mc3, nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (IBAction)onAddButtonPressed:(id)sender
{
    [self.creatureNameTextField resignFirstResponder];
    [self.creatureDescriptionTextField resignFirstResponder];
    MagicalCreature *creature = [[MagicalCreature alloc] initWithName:self.creatureNameTextField.text  description:self.creatureDescriptionTextField.text image:[UIImage imageNamed:@"AngryBirds"]];
    [self.creatures addObject:creature];
    [self.tableView reloadData];
    self.creatureNameTextField.text = @"";
    self.creatureDescriptionTextField.text = @"";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CreatureCell"];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.description;
    cell.imageView.image = creature.image;

    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedPath = self.tableView.indexPathForSelectedRow;
    MagicalCreature *selectedCreature = [self.creatures objectAtIndex:selectedPath.row];
    CreatureViewController *creatureViewController = segue.destinationViewController;
    creatureViewController.creature = selectedCreature;
}

@end
