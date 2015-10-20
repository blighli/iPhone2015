//
//  main.m
//  Work02
//
//  Created by 黄梦妃 on 15/10/17.
//  Copyright © 2015年 黄梦妃. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCalendar.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
       
        MyCalendar *cal=[MyCalendar new];
        if(argc>1)
        {
        
            if(!strcmp(argv[1], "cal"))
            {
                
                if(argc==2)
                {
                     [cal calCurrentMonth];
                    
                }else
                {
                    NSString *arg2=[NSString stringWithUTF8String:argv[2]];
                    if(argc==3)
                    {
                        NSInteger year=[arg2 integerValue];
                        
                        if(year>0&&year<=9999)
                        {
                            [cal calWithYear:year];
                        }else
                        {
                            printf("cal: year %ld not in range 1..9999\n",(long)year);
                        }
                    }
                    else if (argc==4)
                    {
                        NSString *arg3=[NSString stringWithUTF8String:argv[3]];
                        if([arg2 isEqualToString:@"-m"])
                        {
                            NSInteger month=[arg3 integerValue];
                            if(month>0&&month<13)
                            {
                                [cal calWithMonth:month];
                            }else
                            {
                                printf("cal: %ld is neither a month number (1..12) nor a name\n",(long)month);
                            }
                        }
                        else if([arg2 hasPrefix:@"-"])
                        {
                            printf("usage: cal [[month] year]\n");
                            printf("       cal [-m month] [year]\n");
                        }
                        else
                        {
                            NSInteger year=[arg3 integerValue];
                            
                            if(year>0&&year<=9999)
                            {
                                
                                NSInteger month=[arg2 integerValue];
                                if(month>=1&&month<=12)
                                {
                                    [cal calWithMonth:month andWithYear:year];
                                }
                                else
                                {
                                    printf("cal: %s is neither a month number (1..12) nor a name\n",[arg2 UTF8String]);
                                }
                            }else
                            {
                                printf("cal: year %ld not in range 1..9999\n",(long)year);
                            }
                            
                        }
                    }else
                    {
                        
                        printf("cal: year %s not in range 1..9999",[arg2 UTF8String]);
                    }
                }
                
            }
            else
            {
                printf("%s:command not found\n",argv[1]);
            }

        }
        
    }
    return 0;
}
