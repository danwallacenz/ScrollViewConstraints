//
//  ViewController.m
//  ScrollViewConstraints
//
//  Created by Daniel Wallace on 9/09/14.
//  Copyright (c) 2014 nz.co.danielw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIView *contentView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    CGFloat contentWidth,contentHeight;
    BOOL layoutIsPortrait = UIDeviceOrientationIsPortrait(self.interfaceOrientation);
    if(layoutIsPortrait){
        contentWidth = self.view.bounds.size.width;
        contentHeight = self.view.bounds.size.height;
    }else{
        contentWidth = self.view.bounds.size.height;
        contentHeight = self.view.bounds.size.width;
    }
    

    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0,contentWidth,contentHeight * 2)];

    [self.contentView setBackgroundColor:[UIColor blueColor]];
    
    [self.scrollView addSubview:self.contentView];
    
    // DON'T change contentView's translatesAutoresizingMaskIntoConstraints,
    // which defaults to YES;
    
    // Set the content size of the scroll view to match the size of the content view:
    [self.scrollView setContentSize:CGSizeMake(contentWidth,contentHeight * 2)];
    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGFloat contentWidth,contentHeight;
    BOOL layoutWillBePortrait = UIDeviceOrientationIsPortrait(toInterfaceOrientation);
    if(layoutWillBePortrait){
        contentWidth = self.view.bounds.size.width;
        contentHeight = self.view.bounds.size.height;
    }else{
        contentWidth = self.view.bounds.size.height;
        contentHeight = self.view.bounds.size.width;
    }
    
    self.contentView.frame = CGRectMake(0,0,contentWidth,contentHeight * 2);
    [self.scrollView setContentSize:CGSizeMake(contentWidth,contentHeight * 2)];
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    
}

-(void)viewDidAppear:(BOOL)animated
{
    CGSize deviceSize = DEVICE_SIZE;
    
    NSLog(@"DEVICE_SIZE=%@",NSStringFromCGSize(deviceSize));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
