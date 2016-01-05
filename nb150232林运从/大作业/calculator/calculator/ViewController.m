//
//  ViewController.m
//  calculator
//
//  Created by BreazeMago on 14-6-23.
//  Copyright (c) 2014年 BreazeMago. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    double leftNum;
    double rightNum;
    double resultNum;
    UILabel *myTotal;
    NSString *myOperator;
    NSString *lastOne;
    
    NSArray *numbers;
    NSArray *Operators;
    NSArray *Clears;
    
    BOOL isPlus;
    BOOL isMinus;
    BOOL isMultiply;
    BOOL isDivide;
    BOOL isleftNum;
    BOOL isrightNum;
    BOOL havePoint;
    BOOL isOperate;
    double numDisplay;
    NSMutableString *display;
}

-(IBAction)onClickButton:(id)sender;
-(void)brain:(NSString *)str;
@end

@implementation ViewController

-(void) calculator_init{
    numbers = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".", nil];
    Operators = [[NSArray alloc] initWithObjects:@"+/−",@"%",@"÷",@"×",@"−",@"+",@"=", nil];
    Clears = [[NSArray alloc] initWithObjects:@"←",@"C",nil];
    myTotal = (UILabel *)[self.view viewWithTag:100];
    display = [[NSMutableString alloc] initWithCapacity:40];
    resultNum = 0;
    leftNum = 0;
    rightNum = 0;
    isPlus = false;
    isMinus= false;
    isMultiply = false;
    isDivide = false;
    isleftNum = true;
    isrightNum = false;
    havePoint = false;
    isOperate = false;
    //isPositive = false;
    lastOne = nil;
}

-(void) calculator{
    isleftNum = true;
    if (isPlus) {
        numDisplay =leftNum +rightNum;
        int tmp = (int) numDisplay;
        if(tmp == numDisplay)
            myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
        else
        myTotal.text = [[NSString alloc] initWithFormat:@"%f",numDisplay];
        NSLog(@"++leftNum is %f,rightNum is %f",leftNum,rightNum);
    }else if(isMinus){
        numDisplay =leftNum -rightNum;
        int tmp = (int) numDisplay;
        if(tmp == numDisplay)
            myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
        else
        myTotal.text = [[NSString alloc] initWithFormat:@"%f",numDisplay];
        NSLog(@"--leftNum is %f,rightNum is %f",leftNum,rightNum);
    }else if(isMultiply){
        numDisplay =leftNum*rightNum;
        int tmp = (int) numDisplay;
        if(tmp == numDisplay)
            myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
        else
        myTotal.text = [[NSString alloc] initWithFormat:@"%f",numDisplay];
        NSLog(@"**leftNum is %f,rightNum is %f",leftNum,rightNum);
    }else if(isDivide){
        numDisplay =leftNum/rightNum;
        int tmp = (int) numDisplay;
        if(tmp == numDisplay)
            myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
        else
        myTotal.text = [[NSString alloc] initWithFormat:@"%f",numDisplay];
        NSLog(@"÷÷leftNum is %f,rightNum is %f",leftNum,rightNum);
    }
    isPlus = false;
    isMinus= false;
    isMultiply = false;
    isDivide = false;
    isleftNum = true;
    isrightNum = false;
    isOperate = false;
    resultNum = numDisplay;
    leftNum = resultNum;
}

-(void) inputNum:(NSString *)str
{
    if([lastOne isEqual:@"0"]||[lastOne isEqual:@"1"]||[lastOne isEqual:@"2"]||[lastOne isEqual:@"3"]||[lastOne isEqual:@"4"]||[lastOne isEqual:@"5"]||[lastOne isEqual:@"6"]||[lastOne isEqual:@"7"]||[lastOne isEqual:@"8"]||[lastOne isEqual:@"9"]||[lastOne isEqual:@"."]){
        for (int i = 0; i < [numbers count]; i++) {
            if ([str isEqual:[numbers objectAtIndex:i]]) {
                if (havePoint&&[str isEqual: @"."]) {
                    break;
                }
                NSLog(@"display is %@",display);
                [display appendString:str];
                NSLog(@"display is %@",display);
                if (isleftNum) {
                    leftNum = [display doubleValue];
                    int tmp = (int) leftNum;
                    if(tmp == leftNum)
                        myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
                    else
                    myTotal.text = [[NSString alloc] initWithFormat:@"%f",leftNum];
                }else{
                    rightNum = [display doubleValue];
                    int tmp = (int) rightNum;
                    if(tmp == rightNum)
                        myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
                    else
                    myTotal.text = [[NSString alloc] initWithFormat:@"%f",rightNum];
                }
                break;
            }
            //NSLog(@"i = %d",i);
        }
        if([str isEqual:@"."]){
            havePoint = true;
        }
        NSLog(@"str is %@,++++++++++",str);
    }else{
        for (int i = 0; i < [numbers count]; i++) {
            if ([str isEqual:[numbers objectAtIndex:i]]) {
                if([str isEqual:@"."]){
                    if (isleftNum) {
                        leftNum =0;
                        int tmp = (int) leftNum;
                        if(tmp == leftNum)
                            myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
                        else
                        myTotal.text = [[NSString alloc] initWithFormat:@"%f",leftNum];
                    }else{
                        rightNum = 0;
                        int tmp = (int) rightNum;
                        if(tmp == rightNum)
                            myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
                        else
                        myTotal.text = [[NSString alloc] initWithFormat:@"%f",rightNum];
                    }
                }
                else
                {
                    if (isleftNum) {
                        leftNum = [str doubleValue];
                        int tmp = (int) leftNum;
                        if(tmp == leftNum)
                            myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
                        else
                        myTotal.text = [[NSString alloc] initWithFormat:@"%f",leftNum];
                    }else{
                        rightNum = [str doubleValue];
                        int tmp = (int) rightNum;
                        if(tmp == rightNum)
                            myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
                        else
                        myTotal.text = [[NSString alloc] initWithFormat:@"%f",rightNum];
                    }
                }
                //NSLog(@"myTotal.text is %@",str);
                break;
            }
            //NSLog(@"i = %d",i);
        }
        
        NSLog(@"str is %@,---------",str);
        if([str isEqual:@"0"]||[str isEqual:@"1"]||[str isEqual:@"2"]||[str isEqual:@"3"]||[str isEqual:@"4"]||[str isEqual:@"5"]||[str isEqual:@"6"]||[str isEqual:@"7"]||[str isEqual:@"8"]||[str isEqual:@"9"]||[str isEqual:@"."])
        [display appendString:str];
    }
}
-(void)brain:(NSString *)str
{
        [self inputNum:str];
    
        if([str isEqual:@"+/−"]||[str isEqual:@"%"]||[str isEqual:@"÷"]||[str isEqual:@"×"]||[str isEqual:@"−"]||[str isEqual:@"+"]||[str isEqual:@"="]){
            if ([str isEqual:@"+/−"]) {
                numDisplay = -[myTotal.text doubleValue];
                int tmp = (int) numDisplay;
                if(tmp == numDisplay)
                myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
                else
                myTotal.text = [[NSString alloc] initWithFormat:@"%f",numDisplay];
            }else if([str isEqual:@"%"]){
                numDisplay = [myTotal.text doubleValue]/100;
                int tmp = (int) numDisplay;
                if(tmp == numDisplay)
                    myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
                else
                myTotal.text = [[NSString alloc] initWithFormat:@"%f",numDisplay];
            }else if([str isEqual:@"÷"]){
                if(isOperate){
                    //leftNum = numDisplay;
                    [self calculator];
                }
                isleftNum = false;
                display = [[NSMutableString alloc] initWithFormat:@"%@",@"0"];
                isrightNum = true;
                isDivide = true;
                isOperate = true;
                havePoint = false;
            }
            else if([str isEqual:@"×"]){
                if(isOperate){
                    //leftNum = numDisplay;
                    [self calculator];
                }
                isleftNum = false;
                display = [[NSMutableString alloc] initWithFormat:@"%@",@"0"];
                isrightNum = true;
                isMultiply = true;
                isOperate = true;
                havePoint = false;
            }
            else if([str isEqual:@"−"]){
                if(isOperate){
                    //leftNum = numDisplay;
                    [self calculator];
                }
                isleftNum = false;
                display = [[NSMutableString alloc] initWithFormat:@"%@",@"0"];
                isrightNum = true;
                isMinus = true;
                isOperate = true;
                havePoint = false;
            }else if([str isEqual:@"+"]){
                if(isOperate){
                    //leftNum = numDisplay;
                    [self calculator];
                }
                isleftNum = false;
                display = [[NSMutableString alloc] initWithFormat:@"%@",@"0"];
                isrightNum = true;
                isPlus = true;
                isOperate = true;
                havePoint = false;
            }else if([str isEqual:@"="]){
                [self calculator];
                leftNum = resultNum;
            }
    }
    
    if([str isEqual:@"←"]){
             if (isleftNum) {
                 NSString *newDisplay = [display substringToIndex:[display length]-1];
                 NSLog(@"display is %@,newDisplay is%@",display,newDisplay);
                 display =[[NSMutableString alloc] initWithFormat:@"%@",newDisplay];
                 leftNum = [display doubleValue];
                 int tmp = (int) leftNum;
                 if(tmp == leftNum)
                     myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
                 else
                     myTotal.text = display;
             }else{
                 NSString *newDisplay = [display substringToIndex:[display length]-1];
                 NSLog(@"display is %@,newDisplay is%@",display,newDisplay);
                 display =[[NSMutableString alloc] initWithFormat:@"%@",newDisplay];
                 rightNum = [display doubleValue];
                 int tmp = (int) rightNum;
                 if(tmp == rightNum)
                     myTotal.text = [[NSString alloc] initWithFormat:@"%d",tmp];
                 else
                     myTotal.text = display;
             }
    }else if([str isEqual:@"C"]){
            [self calculator_init];
            myTotal.text = @"0";
            numDisplay = 0;
    }
    
    lastOne = str;
}

-(IBAction)onClickButton:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSLog(@"this button is %@",button.titleLabel.text);
    //brain
    [self brain:button.titleLabel.text];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self calculator_init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
