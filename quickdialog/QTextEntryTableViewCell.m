//
//  QTextEntryTableViewCell.m
//  QuickDialog
//
//  Created by Tao Huang on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QTextEntryTableViewCell.h"
#import "QTextEntryElement.h"

@interface QTextEntryTableViewCell (Private)
- (void)updateCounterLabel:(UITextView*)textView;
- (void)handleActionBarPreviousNext:(UISegmentedControl *)control;
- (QEntryElement *)findNextElementToFocusOn;
- (QEntryElement *)findPreviousElementToFocusOn;
- (void)createActionBar;
@end

@implementation QTextEntryTableViewCell{
    UISegmentedControl *_prevNext;
}

-(void)createActionBar {
    UIToolbar *actionBar = [[UIToolbar alloc] init];
    actionBar.translucent = YES;
    [actionBar sizeToFit];
    actionBar.barStyle = UIBarStyleBlackTranslucent;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done", @"")
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(handleActionBarDone:)];
    
    _prevNext = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"Previous", @""), NSLocalizedString(@"Next", @""), nil]];
    _prevNext.momentary = YES;
    _prevNext.segmentedControlStyle = UISegmentedControlStyleBar;
    _prevNext.tintColor = [UIColor darkGrayColor];
    [_prevNext addTarget:self action:@selector(handleActionBarPreviousNext:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *prevNextWrapper = [[UIBarButtonItem alloc] initWithCustomView:_prevNext];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [actionBar setItems:[NSArray arrayWithObjects:prevNextWrapper, flexible, doneButton, nil]];
    
	_textView.inputAccessoryView = actionBar;
}

- (void)createSubviews {
    QTextEntryElement * textEntryElement = (QTextEntryElement * )_entryElement;
    
    _textView = [[UITextView alloc] initWithFrame:CGRectZero];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.text = textEntryElement.textValue;
    _textView.font = [UIFont systemFontOfSize:14];
    _textView.delegate = self;
    [self.contentView addSubview:_textView];
    
    
    _counterLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _counterLabel.textAlignment = UITextAlignmentRight;
    _counterLabel.tag = 135645;
    _counterLabel.font = [UIFont boldSystemFontOfSize:12];
    _counterLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_counterLabel];
    
    [self setNeedsLayout];
}

- (QEntryTableViewCell *)init {
    self = [self initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"QuickformTextEntryElement"];
    if (self!=nil){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self createSubviews];
    }
    return self;
}

- (CGRect)calculateFrameForEntryElement {
    
    QTextEntryElement * textEntryElement = (QTextEntryElement * )_entryElement;
    
    CGFloat height = textEntryElement.textFieldHeight + 10;
    if (textEntryElement.showCharacterCounter){
        height = height + 12 + 2;
    }
    return CGRectMake(5, 5, 290, height);
}

- (void)prepareForElement:(QEntryElement *)element inTableView:(QuickDialogTableView *)tableView{
     _entryElement = element;
    
    self.textLabel.frame = CGRectZero;
    _textField.frame = CGRectZero;
    
    _textView.text = _entryElement.textValue;
    [self updateCounterLabel:_textView];
    
    _quickformTableView = tableView;
    if (_entryElement.hiddenToolbar){
        // hide toolbar
    } else {
        [self createActionBar];
    }
    [self updateCounterLabel:_textView];
    
    [_prevNext setEnabled:[self findPreviousElementToFocusOn]!=nil forSegmentAtIndex:0];
    [_prevNext setEnabled:[self findNextElementToFocusOn]!=nil forSegmentAtIndex:1];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self recalculateEntryFieldPosition];
}


-(void)recalculateEntryFieldPosition {
    QTextEntryElement * textEntryElement = (QTextEntryElement * )_entryElement;
    textEntryElement.parentSection.entryPosition = CGRectZero;
    _textView.frame = CGRectMake(5, 5, 290, textEntryElement.textFieldHeight);
    if (textEntryElement.showCharacterCounter){
        _counterLabel.frame = CGRectMake(5, 5 + textEntryElement.textFieldHeight + 2, 290, 12);
    }

}

- (BOOL)handleActionBarDone:(UIBarButtonItem *)doneButton {
    [_textView resignFirstResponder];
    return NO;
}


- (BOOL)becomeFirstResponder {
    [_textView becomeFirstResponder];
    return YES;
}

# pragma mark UITextViewDelegate
- (void)updateCounterLabel:(UITextView*)textView{
    QTextEntryElement * textEntryElement = (QTextEntryElement * )_entryElement;
    UILabel * counterLabel;
    for(UIView * subview in textView.superview.subviews){
        if (subview.tag == 135645){
            counterLabel = (UILabel*)subview;
        }
    }
    if (!counterLabel){
        return;
    }
    int length = textView.text.length;
    if (length > textEntryElement.maxCharacters){
        textView.text = [textView.text substringToIndex:(textEntryElement.maxCharacters-1)];
    }
    int left = textEntryElement.maxCharacters - textView.text.length;
    if (left > 10){
        counterLabel.textColor = [UIColor darkGrayColor];
    }else{
        counterLabel.textColor = [UIColor redColor];
    }
    counterLabel.text = [NSString stringWithFormat:@"%d", left];
}

- (void)textViewDidChange:(UITextView *)textView{
    [self updateCounterLabel:textView];
}

@end
