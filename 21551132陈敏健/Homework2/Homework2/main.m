//
//  main.m
//  Homework2
//
//  Created by 敏少eclipse on 15/10/20.
//  Copyright © 2015年 敏少eclipse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalFunc.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        if (argc==1) {
            NSCalendar *cal = [NSCalendar currentCalendar];
            NSInteger month = [cal component:NSCalendarUnitMonth fromDate:[NSDate date]];
            NSInteger year = [cal component:NSCalendarUnitYear fromDate:[NSDate date]];
            [[CalFunc calFunc] printCalByYear:year Month:month-1];
        }
        else if (argc==3)
        {
            
            const char *cur = argv[2];
            while (*cur != '\0') {
                char ch = *cur;
                if (ch > '9' || ch < '0') {
                    printf("请按格式输入！\n");
                    return 0;
                }
                cur++;
            }
            
            bool isOk1=true,isOk2=true;
            if (argv[1][0]!='-'||argv[1][1]!='m'||argv[1][2]!='\0')
            {
                isOk1=false;
            }
            
            const char *cur2 = argv[1];
            int temp=0;
            while (*cur2 != '\0') {
                temp*=10;
                char ch = *cur2;
                if (ch > '9' || ch < '0') {
                    isOk2=false;
                }
                else
                {
                    temp+=ch-'0';
                }
                cur2++;
            }
            if (temp>12||temp==0) {
                isOk2=false;
            }
            if ((isOk1||isOk2)==false) {
                printf("请按格式输入！\n");
                return 0;
            }
            
            
            if (argv[1][0]=='-'&&argv[1][1]=='m') {
                
                int month=atoi(argv[2]);
                NSCalendar *cal = [NSCalendar currentCalendar];
                NSInteger year = [cal component:NSCalendarUnitYear fromDate:[NSDate date]];
                [[CalFunc calFunc] printCalByYear:year Month:month-1];
            }
            else
            {
                int year=atoi(argv[2]);
                int month=atoi(argv[1]);
                [[CalFunc calFunc] printCalByYear:year Month:month-1];
            }
        }
        else if(argc==2)
        {
            
            const char *cur = argv[1];
            while (*cur != '\0') {
                char ch = *cur;
                if (ch > '9' || ch < '0') {
                    printf("请按格式输入！\n");
                    return 0;
                }
                cur++;
            }
            
            int year=atoi(argv[1]);
            [[CalFunc calFunc] printCalByYear:year];
        }else
        {
            printf("请按格式输入！\n");
        }
//        NSCalendar *cal = [NSCalendar currentCalendar];
//        NSDateComponents *com = [[NSDateComponents alloc]init];
//        [com setYear:2008];
//        NSDate *date = [cal dateFromComponents:com];
//        NSInteger month = [cal component:NSCalendarUnitYear fromDate:date];
//        NSLog(@"%ld",month);
       // [[CalFunc calFunc] printCalByYear:2015 Month:9];
    }
    return 0;
}
