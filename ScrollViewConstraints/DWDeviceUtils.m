//
//  DWDeviceUtils.m
//  Photos01
//
//  Created by Daniel Wallace on 17/06/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "DWDeviceUtils.h"

@implementation DWDeviceUtils

+(CGFloat) statusBarHeight
{
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    return MIN(statusBarSize.width, statusBarSize.height);
}

+(CGFloat) navigationBarHeightForViewController:(UIViewController * )viewController
{
    CGFloat navHeight = viewController.navigationController.navigationBarHidden ? 0 : viewController.navigationController.navigationBar.frame.size.height;
    return navHeight;
}




+ (UIInterfaceOrientation)currentDeviceOrientation
{

    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;

    if(orientation == 0){ //Default orientation
        //UI is in Default (Portrait) -- this is really a just a failsafe.
    }
    else if(orientation == UIInterfaceOrientationPortrait){
    //Do something if the orientation is in Portrait
    }
    else if(orientation == UIInterfaceOrientationLandscapeLeft){
    // Do something if Left
    }
    else if(orientation == UIInterfaceOrientationLandscapeRight){
    //Do something if right
    }
    
    return orientation;
}


+ (NSString *)currentDeviceOrientationAsString
{
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    NSString *orientationString = @"device orientation unknown";
    
    if(orientation == 0){ //Default orientation
        //UI is in Default (Portrait) -- this is really a just a failsafe.
        orientationString = @"device orientation is default(portrait)";
    }
    else if(orientation == UIInterfaceOrientationPortrait){
        //Do something if the orientation is in Portrait
        orientationString = @"device orientation is portrait";
    }
    else if(orientation == UIInterfaceOrientationPortraitUpsideDown){
         orientationString = @"device orientation is portrait upside down";
    }
    else if(orientation == UIInterfaceOrientationLandscapeLeft){
        // Do something if Left
        orientationString = @"device orientation is landscape left";
    }
    else if(orientation == UIInterfaceOrientationLandscapeRight){
        //Do something if right
        orientationString = @"device orientation is landscape right";
    }
    return orientationString;
}
@end
