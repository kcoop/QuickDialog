//
//  QTextEntryTableViewCell.h
//  QuickDialog
//
//  Created by Tao Huang on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QEntryTableViewCell.h"
#import "QTextEntryElement.h"

@interface QTextEntryTableViewCell : QEntryTableViewCell <UITextViewDelegate>{
    UITextView * _textView;
    UILabel * _counterLabel;
}

@end
