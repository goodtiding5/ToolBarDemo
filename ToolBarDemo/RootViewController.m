//
//  RootViewController.m
//  TabBarDemo
//
//  Created by Kenneth Zhao on 4/27/12.
//  Copyright (c) 2012 Kenneth Zhao. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation RootViewController

@synthesize firstViewController     = _firstViewController;
@synthesize secondViewController    = _secondViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    if (self.firstViewController.view.superview == nil) { 
        self.firstViewController = nil; 
    } else { 
        self.secondViewController = nil; 
    } 
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    self.firstViewController = [[[FirstViewController alloc] initWithNibName:@"FirstView" 
                                                                      bundle:nil] autorelease];
    [self.view insertSubview: self.firstViewController.view atIndex:0];

    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.firstViewController = nil;
    self.secondViewController = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)switchViews:(id)sender {
    [UIView beginAnimations:@"View Flip" context:nil]; 
    [UIView setAnimationDuration:1.25]; 
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if (self.secondViewController.view.superview == nil) {
        if (self.secondViewController == nil) { 
            self.secondViewController = [[[SecondViewController alloc] initWithNibName:@"SecondView" 
                                                                                bundle:nil] autorelease]; 
        } 
        
        [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES]; 
        
        [self.firstViewController.view removeFromSuperview]; 
        [self.view insertSubview:self.secondViewController.view atIndex:0];
    } else {
        if (self.firstViewController == nil) { 
            self.firstViewController = [[[FirstViewController alloc] initWithNibName:@"FirstView" 
                                                                             bundle:nil] autorelease]; 
        } 
        
        [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
        
        [self.secondViewController.view removeFromSuperview]; 
        [self.view insertSubview:self.firstViewController.view atIndex:0]; 
    } 

    [UIView commitAnimations]; 
}

@end
