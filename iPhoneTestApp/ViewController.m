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
  RCTUITextField *textField = [[RCTUITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 150)];
  UIView *redBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2.0)];
  redBackgroundView.backgroundColor = [UIColor redColor];
  [self.view addSubview:redBackgroundView];
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.placeholder = @"textField";
  // textField.typingAttributes = [NSForegroundColorAttributeName : UIColor whiteColor, NSParagraphStyleAttributeName : paraStyle, NSFontAttributeName : UIFont.init(name: "HelveticaNeue-Bold", size: 16)]
  NSMutableDictionary<NSAttributedStringKey, id> *attributes = [NSMutableDictionary dictionaryWithCapacity:10];
  NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
  paragraphStyle.minimumLineHeight = 70.0;
  paragraphStyle.maximumLineHeight = 70.0;
  attributes[NSParagraphStyleAttributeName] = paragraphStyle;
  attributes[NSForegroundColorAttributeName] = [UIColor blueColor];
  attributes[NSBaselineOffsetAttributeName] = @(70.0);
  NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"my test attributed string" attributes: attributes];
  textField.attributedText = attributedString;
  textField.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
  [redBackgroundView addSubview:textField];
  UIView *yellowBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2.0, self.view.frame.size.width, self.view.frame.size.height)];
  yellowBackgroundView.backgroundColor = [UIColor yellowColor];
  [self.view addSubview:yellowBackgroundView];
  UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
  textField1.borderStyle = UITextBorderStyleRoundedRect;
  textField1.placeholder = @"textField1";
  [yellowBackgroundView addSubview:textField1];
}


@end
