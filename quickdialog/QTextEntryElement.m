//
//  QTextEntryElement.m
//  QuickDialog
//
//  Created by Tao Huang on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QTextEntryElement.h"
#import "QTextEntryTableViewCell.h"

@interface QTextEntryElement (Private)
- (void)updateCounterLabel:(UITextView*)textView;
@end


@implementation QTextEntryElement
@synthesize showCharacterCounter = _showCharacterCounter;
@synthesize textFieldHeight = _textFieldHeight;
@synthesize maxCharacters = _maxCharacters;

- (QTextEntryElement *)init {
    self = [super init];
    _textFieldHeight = 80;
    _showCharacterCounter = YES;
    _maxCharacters = 160;
    return self;
}

- (QTextEntryElement *)initWithText:(NSString *)text {
    self = [self init];
    _textValue = text;
    return self;
}

- (QTextEntryElement *)initWithText:(NSString *)text height:(CGFloat)height{
    self = [self init];
    _textValue = text;
    _textFieldHeight = height;
    return self;
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    
    QTextEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuickfromTextEntryElement"];
    if (cell==nil){
        cell = [[QTextEntryTableViewCell alloc] init];
    }
    
    [cell prepareForElement:self inTableView:tableView];
    return cell;
}

- (void)selected:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller indexPath:(NSIndexPath *)indexPath {
    [super selected:tableView controller:controller indexPath:indexPath];
    
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    CGFloat height = _textFieldHeight + 10;
    if (_showCharacterCounter){
        height = height + 12 + 2;
    }
    return height;
}

- (void)fetchValueIntoObject:(id)obj {
	if (_key==nil)
		return;
	
	[obj setValue:_textValue forKey:_key];
}
@end
