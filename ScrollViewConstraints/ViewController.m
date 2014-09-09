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
    
    UIView *firstView = [[UIView alloc] init];
    [firstView setBackgroundColor:[UIColor blackColor]];
    [self.contentView addSubview:firstView];
    firstView.translatesAutoresizingMaskIntoConstraints=NO;


    UIView *secondView = [[UIView alloc] init];
    [secondView setBackgroundColor:[UIColor blackColor]];
    [self.contentView addSubview:secondView];
    secondView.translatesAutoresizingMaskIntoConstraints=NO;

//    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;

//    [self.contentView addConstraints:
//        [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[firstView(==80)]-(>=20)-|"
//                                                options:0
//                                                metrics:0
//                                                  views:NSDictionaryOfVariableBindings(firstView)]];
    
    [self.contentView addConstraints:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[firstView(==80)]-(==20@999)-|"
       [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[firstView]-(==20@999)-|"
                                             options:0
                                             metrics:0
                                               views:NSDictionaryOfVariableBindings(firstView)]];

//    [self.contentView addConstraints:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[secondView(firstView)]-(>=20)-|"
//                                             options:0
//                                             metrics:0
//                                               views:NSDictionaryOfVariableBindings(firstView,secondView)]];
    [self.contentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[secondView(firstView)]-(==20@999)-|"
                                             options:0
                                             metrics:0
                                               views:NSDictionaryOfVariableBindings(firstView,secondView)]];
    
    [self.contentView addConstraints:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[firstView(==80)]-(>=20)-[secondView(firstView)]-|"
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[firstView]-(>=20)-[secondView(firstView)]-|"
                                             options:0
                                             metrics:0
                                               views:NSDictionaryOfVariableBindings(firstView,secondView)]];
    
    
    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
//    CGSize deviceSize = DEVICE_SIZE;
//    
//    NSLog(@"XXX DEVICE_SIZE=%@",NSStringFromCGSize(deviceSize));
//    
//    CGFloat contentWidth,contentHeight;
//    BOOL layoutWillBePortrait = UIDeviceOrientationIsPortrait(toInterfaceOrientation);
//    if(layoutWillBePortrait){
//        contentWidth = self.view.bounds.size.width;
//        contentHeight = self.view.bounds.size.height;
//    }else{
//        contentWidth = self.view.bounds.size.height;
//        contentHeight = self.view.bounds.size.width;
//    }
//    
////    self.contentView.frame = CGRectMake(0,0,contentWidth,contentHeight * 2);
////    [self.scrollView setContentSize:CGSizeMake(contentWidth,contentHeight * 2)];
//    
//    self.contentView.frame = CGRectMake(0,0,deviceSize.width,deviceSize.height * 2);
//    [self.scrollView setContentSize:CGSizeMake(deviceSize.width,deviceSize.height * 2)];
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    CGSize deviceSize = DEVICE_SIZE;
    
    NSLog(@"XXX DEVICE_SIZE=%@",NSStringFromCGSize(deviceSize));
    
    CGFloat contentWidth,contentHeight;
    BOOL layoutWillBePortrait = UIDeviceOrientationIsPortrait(fromInterfaceOrientation);
    if(layoutWillBePortrait){
        contentWidth = self.view.bounds.size.width;
        contentHeight = self.view.bounds.size.height;
    }else{
        contentWidth = self.view.bounds.size.height;
        contentHeight = self.view.bounds.size.width;
    }
    
    //    self.contentView.frame = CGRectMake(0,0,contentWidth,contentHeight * 2);
    //    [self.scrollView setContentSize:CGSizeMake(contentWidth,contentHeight * 2)];
    
    self.contentView.frame = CGRectMake(0,0,deviceSize.width,deviceSize.height * 2);
    [self.scrollView setContentSize:CGSizeMake(deviceSize.width,deviceSize.height * 2)];
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
