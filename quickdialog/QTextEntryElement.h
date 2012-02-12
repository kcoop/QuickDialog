//
//  QTextEntryElement.h
//  QuickDialog
//
//  Created by Tao Huang on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QElement.h"

@interface QTextEntryElement : QEntryElement{
    @protected
    BOOL _showCharacterCounter;
    int _maxCharacters;
    CGFloat _textFieldHeight;
}

@property(nonatomic) BOOL showCharacterCounter;
@property(nonatomic) int maxCharacters;
@property(nonatomic) CGFloat textFieldHeight;

- (QTextEntryElement *)initWithText:(NSString *)string;
- (QTextEntryElement *)initWithText:(NSString *)text height:(CGFloat)height;
@end
