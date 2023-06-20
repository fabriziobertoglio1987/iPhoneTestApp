//
//  ViewController.m
//  iPhoneTestApp
//
//  Created by Fabrizio Bertoglio on 5/17/23.
//

#import "ViewController.h"

@interface RCTUITextView : UITextView<UITextViewDelegate>
@end

@implementation RCTUITextView {}

-(void)textViewDidChange:(UITextView *)textView
{
  NSLog(@"textViewDidChange : %@",textView.text);
  NSString *newText = [NSString stringWithFormat:@"%@/%@/%@", textView.text, @"e"];
  textView.text = newText;
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  RCTUITextView *textView = [[RCTUITextView alloc] initWithFrame:CGRectMake(10, 200, 300, 50)];
  textView.scrollEnabled = true;
  textView.delegate = textView;
  UIView *redBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2.0)];
  redBackgroundView.backgroundColor = [UIColor redColor];
  [self.view addSubview:redBackgroundView];
  [redBackgroundView addSubview:textView];
}


@end
