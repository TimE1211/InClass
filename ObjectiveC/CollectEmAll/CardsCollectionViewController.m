//
//  CardsCollectionViewController.m
//  CollectEmAll
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "CardsCollectionViewController.h"
#import "CardCell.h"
#import "CharacterListTableViewController.h"
#import "DetailViewController.h"

@interface CardsCollectionViewController() <UIPopoverPresentationControllerDelegate, ChosenCharacterDelegate>
{
  NSDictionary *allCharacters;
  NSMutableArray *remainingCharacters;
  NSMutableArray *visibleCharacters;
}

@end

@implementation CardsCollectionViewController

static NSString * const reuseIdentifier = @"CardCell";

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"Collect 'Em All";
  
  allCharacters = @{@"Obi-Wan Kenobi": @"kenobi",
                    @"Leia Organa": @"leia",
                    @"C-3PO": @"c3po",
                    @"Luke Skywalker": @"luke",
                    @"Grand Moff Tarkin": @"tarkin",
                    @"Darth Vader": @"vader",
                    @"Han Solo": @"solo"};
  remainingCharacters = [[NSMutableArray alloc] init];
  [remainingCharacters addObjectsFromArray:[allCharacters allKeys]];
  
  visibleCharacters = [[NSMutableArray alloc] init];
  
  self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
  
  //even though button on detail view it goes here
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"CharacterListPopoverSegue"])
  {
    CharacterListTableViewController *characterListVC = [segue destinationViewController];
    characterListVC.characters = remainingCharacters;
    characterListVC.popoverPresentationController.delegate = self;
    characterListVC.delegate = self;
    CGFloat contentHeight = 44.0f * remainingCharacters.count;
    characterListVC.preferredContentSize = CGSizeMake(200.0f, contentHeight);
  }
  else if ([segue.identifier isEqualToString:@"ShowCharacterDetailSegue"])
  {
    DetailViewController *detailVC = [segue destinationViewController];
    CardCell *cell = (CardCell *)sender;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    NSString *character = visibleCharacters[indexPath.row];
    detailVC.characterName = character;
    detailVC.characterImageName = allCharacters[character];
  }
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
  return UIModalPresentationNone;
}

#pragma mark <ChosenCharacterDelegate>

- (void)characterWasChosen:(NSString *)chosenCharacter
{
  [self.navigationController dismissViewControllerAnimated:YES completion:nil];
  [visibleCharacters addObject:chosenCharacter];
  [remainingCharacters removeObject:chosenCharacter];
  if (remainingCharacters.count == 0)
  {
    self.navigationItem.rightBarButtonItem.enabled = NO;
  }
  [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return visibleCharacters.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
  
  NSString *characterName = visibleCharacters[indexPath.item];
  
  cell.ImageView.image = [UIImage imageNamed:allCharacters[characterName]];
  cell.characterNameLabel.text = characterName;
  
  return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {

}
*/

@end
