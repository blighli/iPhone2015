//
//  main.m
//  顾金跃日历作业1
//
//  Created by HacAdmin on 15/10/17.
//  Copyright (c) 2015ƒÍ HacAdmin. All rights reserved.
//

#import <Foundation/Foundation.h>
void printFirstLine(int month, int year);
void printWeek();
char * monthDesc(int month);
int firstdayWeekday(int month, int year);
int countData(int month);
void printTurn(int month, int firstday, int year);
int countDates(int month, int year);
void Month1(int month, int year);
void calendar1(int year);
int getNumber(char* str);
void datePrint(int month, int year);
void PrintMonth(int year,int month);
enum Weekday
{
    Sun,Mon,Tues,Wed,Thur,Fri,Sat
};
int Gweekday = Sat, Gyear = 1, Gmonth = 1, Gday = 1;
char table[12][6][7];



void printFirstLine(int month, int year)
{
    switch(month)
    {
        case 1:
            printf("%6s%s%3s", "", monthDesc(month),"");
            // NSLog(@"%@%@%@",@"",monthDesc(month),@"");
            printf("%12s%s  ", "", monthDesc(month+1));
            printf("%13s%s\n", "", monthDesc(month+2));
            break;
        case 4:
            printf("%7s%s  ", "", monthDesc(month));
            printf("%16s%s  ", "", monthDesc(month+1));
            printf("%17s%s\n", "", monthDesc(month+2));
            break;
        case 7:
            printf("%8s%s  ", "", monthDesc(month));
            printf("%15s%s  ", "", monthDesc(month+1));
            printf("%12s%s\n", "", monthDesc(month+2));
            break;
        case 10:
            printf("%6s%s  ", "", monthDesc(month));
            printf("%13s%s  ", "", monthDesc(month+1));
            printf("%12s%s\n", "", monthDesc(month+2));
            break;
    }
}
int firstdayWeekday(int month, int year)
{
    int date_distance = 0;
    int weekday;
    
    date_distance = countDates(month, year);
    weekday = (Gweekday + date_distance) % 7;
    
    return weekday;
}
void printWeek()
{
    printf("%2s%3s%3s%3s%3s%3s%3s%2s", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa","");
    printf("%2s%3s%3s%3s%3s%3s%3s%2s", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa","");
    printf("%2s%3s%3s%3s%3s%3s%3s\n", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa");
}

char * monthDesc(int month)
{
    switch (month)
    {
        case 1:
            return "January";
            break;
        case 2:
            return "February";
            break;
        case 3:
            return "March";
            break;
        case 4:
            return "April";
            break;
        case 5:
            return "May";
            break;
        case 6:
            return "June";
            break;
        case 7:
            return "July";
            break;
        case 8:
            return "August";
            break;
        case 9:
            return "September";
            break;
        case 10:
            return "October";
            break;
        case 11:
            return "November";
            break;
        case 12:
            return "December";
            break;
        default:
            return "No";
            break;
    }
}

int countDates(int month, int year)
{
    int leap_year_count = 0;
    int i;
    int distance;
    if (year > Gyear)
    {
        for (i = Gyear; i<year; i++)
        {
            if (i >= 1800 && ((i % 4 == 0&& i % 100 != 0) || i % 400 == 0))
            {
                leap_year_count++;
            }
            if (i<1800 && i % 4 == 0)
            {
                leap_year_count++;
            }
        }
        if (month > 2)
        {
            if (year >= 1800 && ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0))
            {
                leap_year_count++;
            }
            if (year < 1800 && year % 4 == 0)
            {
                leap_year_count++;
            }
        }
    }
    distance = (year - Gyear) * 365 + leap_year_count + countData(month);
    if ((year == 1752 && month>9) || year > 1752)
        distance = distance - 11;
    return distance;
}


void printTurn(int month, int firstday, int year)
{
    if (year == 1752 && month == 9)
    {
        table[month][0][Sun] = 0;
        table[month][0][Mon] = 0;
        table[month][0][Tues] = 1;
        table[month][0][Wed] = 2;
        for (int j = 14,row=0,column=Thur; j <= 30; j++)
        {
            table[month][row][column] = j;
            column++;
            if (column > Sat)
            {
                row++;
                column = Sun;
            }
        }
        return;
    }
    
    switch (month)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
        {
            for (int i = 1,row=0,column=firstday; i<=31; i++)
            {
                table[month][row][column] = i;
                column++;
                if (column > Sat)
                {
                    row++;
                    column = Sun;
                }
            }
            break;
        }
        case 2:
        {
            if ((year >= 1800 && ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)) || (year < 1800 && year % 4 == 0)) /*»ÚƒÍ*/
            {
                for (int i = 1, row = 0, column = firstday; i <= 29; i++)
                {
                    table[2][row][column] = i;
                    column++;
                    if (column > Sat)
                    {
                        row++;
                        column = Sun;
                    }
                }
                break;
            }
            else
            {
                for (int i = 1,row = 0, column = firstday; i <= 28; i++)
                {
                    table[2][row][column] = i;
                    column++;
                    if (column > Sat)
                    {
                        row++;
                        column = Sun;
                    }
                }
                break;
            }
            
        }
        case 4:
        case 6:
        case 9:
        case 11:
        {
            for (int i = 1, row = 0, column = firstday; i <= 30; i++)
            {
                table[month][row][column] = i;
                column++;
                if (column > Sat)
                {
                    row++;
                    column = Sun;
                }
            }
            break;
        }
    }
}

void datePrint(int month, int year)
{
    int firstday;
    firstday = firstdayWeekday(month, year);
    printTurn(month, firstday, year);
    firstday = firstdayWeekday(month+1, year);
    printTurn(month+1, firstday, year);
    firstday = firstdayWeekday(month+2, year);
    printTurn(month+2, firstday, year);
    for (int i = 0; i <=5; i++)
    {
        for (int j = month; j <= month+2; j++)
        {
            if (table[j][i][0] == 0)
            {
                printf("%2s", "");
            }
            else
            {
                printf("%2d", table[j][i][0]);
            }
            for (int k = 1; k <=6; k++)
            {
                if (table[j][i][k] == 0)
                {
                    printf("%3s", "");
                }
                else
                {
                    printf("%3d", table[j][i][k]);
                }
                if (k == 6)
                {
                    if (j == month + 2)
                        printf("\n");
                    else
                        printf("%2s", "");
                }
            }
        }
    }
}

void PrintMonth(int year,int month)
{
    int length;
    if(year>999)length=4;
    else if(length>99)length=3;
    else if(length>9)length=2;
    else length=1;
    int spaceNum =(20-(int)strlen(monthDesc(month))-length-1)/2;
    for (int i=0; i<spaceNum; i++)
    {
        printf(" ");
    }
    printf("%s %d\n",monthDesc(month),year);
    printf("%2s%3s%3s%3s%3s%3s%3s\n", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa");
    int firstday = firstdayWeekday(month, year);
    printTurn(month, firstday, year);
    for (int row=0; row<=5; row++)
    {
        if (table[month][row][0] == 0)
        {
            printf("%2s", "");
        }
        else
        {
            printf("%2d", table[month][row][0]);
        }
        for(int column=1;column<=6;column++)
        {
            if (table[month][row][column] == 0)
            {
                printf("%3s", "");
            }
            else
            {
                printf("%3d", table[month][row][column]);
            }
            if (column == 6)
            {
                printf("\n");
            }
        }
    }
}
int countData(int month)
{
    switch (month)
    {
        case 1:
            return 0;
            break;
        case 2:
            return 31;
            break;
        case 3:
            return 31+28;
            break;
        case 4:
            return 31+28+31;
            break;
        case 5:
            return 31+28+31+30;
            break;
        case 6:
            return 31+28+31+30+31;
            break;
        case 7:
            return 31+28+31+30+31+30;
            break;
        case 8:
            return 31+28+31+30+31+30+31;
            break;
        case 9:
            return 31+28+31+30+31+30+31+31;
            break;
        case 10:
            return 31+28+31+30+31+30+31+31+30;
            break;
        case 11:
            return 31+28+31+30+31+30+31+31+30+31;
            break;
        case 12:
            return 31+28+31+30+31+30+31+31+30+31+30;
            break;
        default:
            return 0;
            break;
    }
}

void Month1(int month, int year)
{
    printFirstLine(month, year);
    printWeek();
    datePrint(month, year);
}

void calendar1(int year)
{
    int i;
    printf("%33d\n\n",year);
    for (i = 1; i <= 10; i=i+3)
    {
        Month1(i, year);
    }
}

int getNumber(char* str)
{
    int year=0;
    int weight=1;
    for (int i=(int)strlen(str)-1; i>=0; i--)
    {
        year = year+weight*(str[i]-'0');
        weight=10*weight;
    }
    return year;
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        while (1)
        {
            memset(table, 0, 546);
            char commandLIne[50];
            memset(commandLIne,0,50);
            char param[5][10];
            memset(param, '\0',50);
            printf("gujinyue $ ");
            gets(commandLIne);
            char* token=strtok(commandLIne," ");
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
                    printf("usage: cal [-jy] [[month] year]\n");
                    printf("%7scal [-j] [-m month] [year]\n","");
                    printf("%7sncal [-Jjpwy] [-s country_code] [[month] year]\n","");
                    printf("%7sncal [-Jeo] [year]\n","");
                    continue;
                }
                if(strlen(param[1])==0)
                {
                    //cal命令
                    PrintMonth(2015, 10);
                }
                else if(strlen(param[2])==0)
                {
                    //cal 2014命令
                    int year = getNumber(param[1]);
                    if(year>9999||year<1)
                    {
                        printf("输入的年份超出范围%d\n",year);
                        continue;
                    }
                    calendar1(getNumber(param[1]));
                }
                else if(strcmp(param[1],"-m")==0)
                {
                    //cal -m month and handle error
                    int month = getNumber(param[2]);
                    if(month>12||month<1)
                    {
                        printf("输入的月份超出范围%d\n",month);
                        continue;
                    }
                    PrintMonth(2015, month);
                }
                else if(strcmp(param[1], "-m")>0)
                {
                    //cal 10 2014
                    int year  = getNumber(param[2]);
                    if(year>9999||year<1)
                    {
                        printf("输入的年份超出范围%d\n",year);
                        continue;
                    }
                    int month = getNumber(param[1]);
                    if(month>12||month<1)
                    {
                        printf("输入的月份超出范围%d\n",month);
                        continue;
                    }
                    PrintMonth(year, month);
                }
            }
            else
            {
                printf("命令行出错\n");
            }
        }
    }
    return 0;
}