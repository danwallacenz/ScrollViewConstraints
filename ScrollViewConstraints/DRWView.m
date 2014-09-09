//
//  DRWView.m
//  ScrollViewConstraints
//
//  Created by Daniel Wallace [DATACOM] on 10/09/14.
//  Copyright (c) 2014 nz.co.danielw. All rights reserved.
//

#import "DRWView.h"

@interface DRWView ()
@property   (strong, nonatomic) NSString *colorName;
@end

@implementation DRWView


-(instancetype)initWithColorName: (NSString *)colorName
{
    self = [super init];
    if (self) {
        // Initialization code
        self.colorName = colorName;
        if([self.colorName isEqualToString:@"green"]){
            [self setBackgroundColor:[UIColor greenColor]];
        }else if ([self.colorName isEqualToString:@"orange"]){
            [self setBackgroundColor:[UIColor orangeColor]];
        }else{
            [self setBackgroundColor:[UIColor blackColor]];
        }
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)layoutSubviews
{
    NSLog(@"%@ DRWView - layoutSubviews", self.colorName);
}


-(void)updateConstraints
{
       NSLog(@"%@ DRWView - updateConstraints", self.colorName);
    
    [super updateConstraints];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
