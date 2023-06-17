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

- (void)_restoreTextSelection
{
  UITextRange *range = self.selectedTextRange;
  /*
  auto start = [self positionFromPosition:self.beginningOfDocument
                                                   offset:selection->start];
  auto end = [_backedTextInputView positionFromPosition:_backedTextInputView.beginningOfDocument offset:selection->end];
  auto range = [_backedTextInputView textRangeFromPosition:start toPosition:end];
  [_backedTextInputView setSelectedTextRange:range notifyDelegate:YES];
   */
}


-(void)textViewDidChange:(UITextView *)textView
{
  // disable scroll to avoid issue #
  textView.scrollEnabled = false;
  NSLog(@"textViewDidChange : %@",textView.text);
  NSMutableDictionary<NSAttributedStringKey, id> *attributes = [NSMutableDictionary dictionaryWithCapacity:10];
  attributes[NSForegroundColorAttributeName] = [UIColor blueColor];
  NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:textView.text attributes: attributes];

  // save cursor position
  UITextRange *selectedRange = self.selectedTextRange;
  NSInteger oldTextLength = self.attributedText.string.length;

  // [textView setAttributedText: attributedString];
  self.text = textView.text;

  // restore cursor position
  if (selectedRange.empty) {
    // Maintaining a cursor position relative to the end of the old text.
    NSInteger offsetStart = [self offsetFromPosition:self.beginningOfDocument
                                          toPosition:selectedRange.start];
    NSInteger offsetFromEnd = oldTextLength - offsetStart;
    NSInteger newOffset = textView.text.length - offsetFromEnd;
    UITextPosition *position = [self positionFromPosition:self.beginningOfDocument
                                                   offset:newOffset];
    [self setSelectedTextRange:[self textRangeFromPosition:position toPosition:position]];
  }

  textView.scrollEnabled = true;
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
