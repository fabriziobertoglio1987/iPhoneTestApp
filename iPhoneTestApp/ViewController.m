//
//  ViewController.m
//  iPhoneTestApp
//
//  Created by Fabrizio Bertoglio on 5/17/23.
//

#import "ViewController.h"

@interface RCTUITextView : UITextView<UITextViewDelegate>
@end

@implementation RCTUITextView {
  NSAttributedString *_oldAttributedString;
  NSMutableDictionary<NSAttributedStringKey, id> *_attributes;
}

-(void)textViewDidChange:(UITextView *)textView
{
  if ([textView.text isEqualToString:@"1\n\n2\n3\n"]) {
    NSMutableAttributedString *attributedStringCopy = [textView.attributedText mutableCopy];
    [textView.attributedText enumerateAttribute:NSParagraphStyleAttributeName inRange:NSMakeRange(0, [textView.attributedText length]) options:0 usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
      if ([value isKindOfClass:[NSParagraphStyle class]]) {
        NSMutableParagraphStyle *style = [value mutableCopy];
        // enable one of this changes to the attributes to reproduce the issue
        style.minimumLineHeight = 20;
        // [attributedStringCopy addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:range];
        [attributedStringCopy addAttribute:NSParagraphStyleAttributeName value:style range:range];
      }
    }];
    [textView setAttributedText: attributedStringCopy];
  }
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
