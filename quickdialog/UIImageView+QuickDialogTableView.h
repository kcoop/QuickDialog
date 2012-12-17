//
//  UIImageView+TableView.h
//  QuickDialog
//
//  Created by Tao Ma on 12/17/12.
//
//

#import <Foundation/Foundation.h>

typedef enum {
    kQuickDialogTableViewCellPositionTop,
    kQuickDialogTableViewCellPositionCenter,
    kQuickDialogTableViewCellPositionBottom,
    kQuickDialogTableViewCellPositionSingle
} QuickDialogTableViewCellPosition;

typedef enum {
    kQuickDialogTableViewCellStateNormal,
    kQuickDialogTableViewCellStateSelected
} QuickDialogTableViewCellState;

@interface UIImageView (QuickDialogTableView)

+ (UIImageView *)backgroundViewAtQuickDialogTableViewPosition:(QuickDialogTableViewCellPosition)cellPosition forState:(QuickDialogTableViewCellState)cellState;

@end
