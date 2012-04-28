//
//  RootViewController.h
//  TabBarDemo
//
//  Created by Kenneth Zhao on 4/27/12.
//  Copyright (c) 2012 Kenneth Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstViewController;
@class SecondViewController;

@interface RootViewController : UIViewController
{
    @private
    FirstViewController     *_firstViewController;
    SecondViewController    *_secondViewController;
}

@property (retain, nonatomic) FirstViewController   *firstViewController;
@property (retain, nonatomic) SecondViewController  *secondViewController;

- (IBAction)switchViews:(id)sender;

@end