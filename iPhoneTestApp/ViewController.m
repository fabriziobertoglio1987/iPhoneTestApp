//
//  ViewController.m
//  iPhoneTestApp
//
//  Created by Fabrizio Bertoglio on 5/17/23.
//

#import "ViewController.h"

@interface RCTUITextField : UITextField
@end

@implementation RCTUITextField {}

- (CGRect)textRectForBounds:(CGRect)bounds
{
  return CGRectMake(0, -50, 200, 100);
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  NSNumber *lineHeight = @10;
  NSNumber *fontLineHeight = nil;
  NSLog(@"lineHeight is %@ and fontLineHeight is %@", lineHeight, fontLineHeight);
  if (lineHeight >= fontLineHeight) {
    NSLog(@"true");
  } else {
    NSLog(@"false");
  }
}


@end
