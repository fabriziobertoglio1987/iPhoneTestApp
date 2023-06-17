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
  // Do any additional setup after loading the view.
  UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 200, 300, 150)];
  UIView *redBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2.0)];
  redBackgroundView.backgroundColor = [UIColor redColor];
  [self.view addSubview:redBackgroundView];
  NSMutableDictionary<NSAttributedStringKey, id> *attributes = [NSMutableDictionary dictionaryWithCapacity:10];
  attributes[NSForegroundColorAttributeName] = [UIColor blueColor];
  NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"my test attributed string" attributes: attributes];
  textView.attributedText = attributedString;
  [redBackgroundView addSubview:textView];
}


@end
