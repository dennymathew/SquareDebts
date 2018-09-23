//
//  MarginPercent.m
//  AlFardan
//
//  Created by Fastacash on 15/8/16.
//  Copyright © 2016 Fastacash. All rights reserved.
//

#import "MarginPercent.h"

@implementation MarginPercent

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self layoutDidChange];
}

- (CGSize)screenSize {
    
    CGSize screenSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    return screenSize;
}

- (void) layoutDidChange {
    
    switch (self.firstAttribute) {
            
        case NSLayoutAttributeTop :
        case NSLayoutAttributeTopMargin :
        case NSLayoutAttributeBottom :
        case NSLayoutAttributeBottomMargin : {
            
            self.constant = [self screenSize].height * self.marginPercent;
            break;
        }
            
        case NSLayoutAttributeLeading :
        case NSLayoutAttributeLeadingMargin :
        case NSLayoutAttributeTrailing :
        case NSLayoutAttributeTrailingMargin : {
            
            self.constant = [self screenSize].width * self.marginPercent;
            break;
        }
            
        default:
            break;
    }
}

@end
