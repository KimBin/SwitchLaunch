//
//  ViewController.m
//  SwitchLaunch
//
//  Created by maojj on 5/5/14.
//  Copyright (c) 2014 maojj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createLaunchImage];
}

- (void)createLaunchImage{

    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentPath = [paths objectAtIndex:0];

    NSString *imagePath = [documentPath stringByAppendingPathComponent:@"LaunchImage@2x.png"];
    [UIImagePNGRepresentation([self getImage]) writeToFile:imagePath atomically:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (UIImage *)getImage{
    UIImage *image = [UIImage imageNamed:@"LaunchImage"];

    UIGraphicsBeginImageContextWithOptions(image.size, NO, 2.0);

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSaveGState(context);
    {
    [image drawAtPoint:CGPointZero];

    [[UIColor redColor] setFill];

    CGContextFillRect(context, CGRectMake(100, 100, 200, 300));
    }
    CGContextRestoreGState(context);

    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    return result;
}

@end
