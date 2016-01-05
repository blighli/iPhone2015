//
//  CustomsPassView.m
//  MyCrazyGuessImage
//
//  Created by zhuzhu on 15/12/28.
//  Copyright © 2015年 wequeen. All rights reserved.
//

#import "CustomsPassView.h"
#import "ViewController.h"

@interface CustomsPassView ()
@property (nonatomic) NSInteger flag ;
@end

@implementation CustomsPassView

- (IBAction)movieTag:(id)sender {
    //ViewController *view = [[ViewController alloc] init];
    //view.flag = 0;
    UIButton *button  = sender;
    if ([button.titleLabel.text compare:@"影视娱乐类" ]== 0)
    {
        self.flag = 0;
    }else{
        self.flag = 1 ;
    }

    [self performSegueWithIdentifier:@"startGame" sender:self];
    
    
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // segue.identifier：获取连线的ID
    if ([segue.identifier isEqualToString:@"startGame"]) {
        // segue.destinationViewController：获取连线时所指的界面（VC）
        ViewController *receive = segue.destinationViewController;
        receive.flag = self.flag;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
