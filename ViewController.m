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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MagicalCreature *mc1 = [[MagicalCreature alloc] initWithName:@"Thomas" description:@"Lyger"];
    MagicalCreature *mc2 = [[MagicalCreature alloc] initWithName:@"Ralphie" description:@"Centaur"];
    MagicalCreature *mc3 = [[MagicalCreature alloc] initWithName:@"Chester" description:@"Unicorn"];
    self.creatures = [NSMutableArray arrayWithObjects:mc1, mc2, mc3, nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (IBAction)onAddButtonPressed:(id)sender
{
    [self.creatureNameTextField resignFirstResponder];
    MagicalCreature *creature = [[MagicalCreature alloc] initWithName:self.creatureNameTextField.text description:@""];
    [self.creatures addObject:creature];
    [self.tableView reloadData];
    self.creatureNameTextField.text = @"";
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
