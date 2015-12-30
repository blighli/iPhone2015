

#import "FxTableWidget.h"
#import "FxBaseCell.h"

@implementation FxTableWidget

- (void)updateUI
{
    [_tableView reloadData];
}

#pragma mark - FxOperationDelegate methods

- (void)opSuccess:(id)data
{
    [super opSuccess:data];
    
    self.listData = data;
    [self updateUI];
}


#pragma mark - UITableViewDelegate & UITableViewDataSource methods

-(void)tableView:(UITableView *)tableView  willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FxBaseCell *cell = (FxBaseCell*)[tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (cell == nil) {
        NSArray* Objects = [[NSBundle mainBundle] loadNibNamed:self.cellIdentifier owner:tableView options:nil];
        
        cell = [Objects objectAtIndex:0];
        [cell initCell];
    }
    
    [cell setCellData:[self.listData objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
