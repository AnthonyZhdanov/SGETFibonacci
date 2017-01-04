//
//  ViewController.m
//  SGETFibonacci
//
//  Created by BRABUS on 1/4/17.
//  Copyright © 2017 Anthony Zhdanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *indexTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([self verification:textField]) {
        [self createFibonacciArray];
    }
    [self.view endEditing:YES];
    return YES;
}

- (BOOL)verification:(UITextField *)textField {
    BOOL result;
    result = [textField.text intValue];
    return result;
}

-(void)createFibonacciArray
{
    int range = [self.indexTextField.text intValue];
    NSMutableArray* arrayOfFibonacci = [NSMutableArray new];
    
    for (int i = 0; i <= range; i++)
    {
        if (i < 2)
        {
            [arrayOfFibonacci addObject:[NSString stringWithFormat:@"%i", i]];
            continue;
        }
        else
        {
            int fib = [[arrayOfFibonacci objectAtIndex:i - 2] intValue] + [[arrayOfFibonacci objectAtIndex:i - 1] intValue];
            [arrayOfFibonacci addObject:[NSString stringWithFormat:@"%i", fib]];
        }
    }
    [arrayOfFibonacci removeObjectAtIndex:0];
    [self sortArray:arrayOfFibonacci];
}

- (void)sortArray:(NSArray *)arrayFib {
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self"
                                                                ascending: NO];
    [arrayFib sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
    [self showResult:arrayFib];
}

- (void)showResult:(NSArray *)arrayFib {
    NSString *fibonacciRow;
    fibonacciRow = [[arrayFib valueForKey:@"description"] componentsJoinedByString:@", "];
    self.resultLabel.text = fibonacciRow;
}

@end
