//
//  DWDeviceUtils.h
//  Photos01
//
//  Created by Daniel Wallace on 17/06/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWDeviceUtils : NSObject

+(CGFloat) statusBarHeight;

+(CGFloat) navigationBarHeightForViewController:(UIViewController * )viewController;

+ (UIInterfaceOrientation)currentDeviceOrientation;

+ (NSString *)currentDeviceOrientationAsString;

#define IS_PORTRAIT UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation) || UIDeviceOrientationIsPortrait(self.interfaceOrientation)
#define IS_LANDSCAPE UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) || UIDeviceOrientationIsLandscape(self.interfaceOrientation)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define DEVICE_SIZE [[[[UIApplication sharedApplication] keyWindow] rootViewController].view convertRect:[[UIScreen mainScreen] bounds] fromView:nil].size

@end
