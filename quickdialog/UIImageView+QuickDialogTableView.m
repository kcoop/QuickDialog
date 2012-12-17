//
//  UIImageView+TableView.m
//  QuickDialog
//
//  Created by Tao Ma on 12/17/12.
//
//

#import "UIImageView+QuickDialogTableView.h"

@implementation UIImageView (QuickDialogTableView)

+ (UIImageView *)backgroundViewAtQuickDialogTableViewPosition:(QuickDialogTableViewCellPosition)cellPosition forState:(QuickDialogTableViewCellState)cellState {
    UIImageView *imageView = nil;
    if (cellPosition == kQuickDialogTableViewCellPositionTop) {
        if (cellState == kQuickDialogTableViewCellStateNormal) {
            UIImage *image = [[UIImage imageNamed:@"cell-top-default.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:5.0];
            imageView = [[UIImageView alloc] initWithImage:image];
        } else if (cellState == kQuickDialogTableViewCellStateSelected) {
            UIImage *image = [[UIImage imageNamed:@"cell-top-selected.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:5.0];
            imageView = [[UIImageView alloc] initWithImage:image];
        }
    } else if (cellPosition == kQuickDialogTableViewCellPositionCenter) {
        if (cellState == kQuickDialogTableViewCellStateNormal) {
            UIImage *image = [[UIImage imageNamed:@"cell-center-default.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:5.0];
            imageView = [[UIImageView alloc] initWithImage:image];
        } else if (cellState == kQuickDialogTableViewCellStateSelected) {
            UIImage *image = [[UIImage imageNamed:@"cell-center-selected.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:5.0];
            imageView = [[UIImageView alloc] initWithImage:image];
        }
    } else if (cellPosition == kQuickDialogTableViewCellPositionBottom) {
        if (cellState == kQuickDialogTableViewCellStateNormal) {
            UIImage *image = [[UIImage imageNamed:@"cell-bottom-default.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:5.0];
            imageView = [[UIImageView alloc] initWithImage:image];
        } else if (cellState == kQuickDialogTableViewCellStateSelected) {
            UIImage *image = [[UIImage imageNamed:@"cell-bottom-selected.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:5.0];
            imageView = [[UIImageView alloc] initWithImage:image];
        }
    } else if (cellPosition == kQuickDialogTableViewCellPositionSingle) {
        if (cellState == kQuickDialogTableViewCellStateNormal) {
            UIImage *image = [[UIImage imageNamed:@"cell-single-default.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:5.0];
            imageView = [[UIImageView alloc] initWithImage:image];
        } else if (cellState == kQuickDialogTableViewCellStateSelected) {
            UIImage *image = [[UIImage imageNamed:@"cell-single-selected.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:5.0];
            imageView = [[UIImageView alloc] initWithImage:image];
        }
    }
    
    return imageView;
}

@end
