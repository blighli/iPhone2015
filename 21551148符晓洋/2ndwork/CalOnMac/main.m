//
//  main.m
//  CalOnMac
//
//  Created by HacAdmin on 15/10/17.
//  Copyright (c) 2015年 HacAdmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calendar.h"
int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        while (1)
        {
            Calendar *calObj=[[Calendar alloc]init];
            [calObj SetNow];
            char command[50];
            memset(command,0,50);
            char param[5][10];
            memset(param, '\0',50);
            printf("$ ");
            gets(command);
            char* token=strtok(command," ");
            strcpy(param[0], token);
            for (int i =1;i<10; i++)
            {
                token=strtok(NULL," ");
                if(token==NULL)
                    break;
                strcpy(param[i], token);
            }
            if(strcmp(param[0],"cal")==0)
            {
                if(strlen(param[3])>0)
                {
                    //handle error
                    printf("usage: cal [-jy] [[month] year]\n");
                    printf("%7scal [-j] [-m month] [year]\n","");
                    printf("%7sncal [-Jjpwy] [-s country_code] [[month] year]\n","");
                    printf("%7sncal [-Jeo] [year]\n","");
                    continue;
                }
                if(strlen(param[1])==0)
                {
                    //cal
                    [calObj PrintMonth:[calObj GetNowYear]:[calObj GetNowMonth]];
                }
                else if(strlen(param[2])==0)
                {
                    //cal year and handle error
                    int year = [Calendar GetNumber:param[1]];
                    if(year>9999||year<1)
                    {
                        printf("cal: year %d not in range 1..9999\n",year);
                        continue;
                    }
                    [calObj main_calendar:[Calendar GetNumber:param[1]]];
                }
                else if(strcmp(param[1],"-m")==0)
                {
                    //cal -m month and handle error
                    int month = [Calendar GetNumber:param[2]];
                    if(month>12||month<1)
                    {
                        printf("cal: %d is neither a month number (1..12) nor a name\n",month);
                        continue;
                    }
                    [calObj PrintMonth:[calObj GetNowYear]:month];
                }
                else if(strcmp(param[1], "-m")>0)
                {
                    //cal month year and handle error
                    int year  = [Calendar GetNumber:param[2]];
                    if(year>9999||year<1)
                    {
                        printf("cal: year %d not in range 1..9999\n",year);
                        continue;
                    }
                    int month = [Calendar GetNumber:param[1]];
                    if(month>12||month<1)
                    {
                        printf("cal: %d is neither a month number (1..12) nor a name\n",month);
                        continue;
                    }
                    [calObj PrintMonth:year:month];
                }
            }
            else
            {
                //handle error
                printf("command not found\n");
            }
        }
    }
    return 0;
}
