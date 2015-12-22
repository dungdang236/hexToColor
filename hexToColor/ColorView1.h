//
//  ColorView1.h
//  hexToColor
//
//  Created by student on 18/12/2015.
//  Copyright © 2015 dungdang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorView1 : UIView
- (instancetype) initWithHex: (NSString*) hex
                       alpha: (CGFloat) alpha
                       frame: (CGRect) rect;
- (void) fadeout;
@property (nonatomic,strong) NSString* hex;

@end
