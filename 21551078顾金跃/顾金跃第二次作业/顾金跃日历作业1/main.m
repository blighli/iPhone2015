//
//  main.m
//  顾金跃日历作业1
//
//  Created by HacAdmin on 15/10/17.
//  Copyright (c) 2015ƒÍ HacAdmin. All rights reserved.
//

#import <Foundation/Foundation.h>
//以下是方法的声明
//打印第一行(月份)
void printFirstLine(int month, int year);
//打印周一到周日
void printWeek();
//返回一个具体的月份,用于打印
char * monthDesc(int month);
//计算某年某月的第一天是星期几
int firstdayWeekday(int month, int year);
//返回某月的前几个月总天数
int countData(int month);
//存储需要打印的某年某月的数值于三维数组中
void printTurn(int month, int firstday, int year);
//计算某年某月总共天数
int countDates(int month, int year);
//按月打印
void Month1(int month, int year);
//打印某年12个月
void calendar1(int year);
//返回输入的年份
int getNumber(char* str);
//打印具体日期(全年月份)
void datePrint(int month, int year);
//打印月份
void PrintMonth(int year,int month);

//枚举(星期几)
enum Weekday
{
    Sun,Mon,Tues,Wed,Thur,Fri,Sat
};
//初始化年月日和星期
int Gweekday = Sat, Gyear = 1, Gmonth = 1, Gday = 1;

//存储打印值的三维数组
char array[12][6][7];



//打印第一行(月份)
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

//计算某年某月的第一天是星期几
int firstdayWeekday(int month, int year)
{
    int date_distance = 0;
    int weekday;
    
    //某年某月的天数
    date_distance = countDates(month, year);
    
    //计算某年末月的第一天是星期几
    weekday = (Gweekday + date_distance) % 7;
    
    return weekday;
}

//打印周一到周日
void printWeek()
{
    printf("%2s%3s%3s%3s%3s%3s%3s%2s", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa","");
    printf("%2s%3s%3s%3s%3s%3s%3s%2s", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa","");
    printf("%2s%3s%3s%3s%3s%3s%3s\n", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa");
}

//返回一个具体的月份,用于打印
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

//计算某年某月总共天数
int countDates(int month, int year)
{
    //闰年数
    int leapYearCount = 0;
    int i;
    int distance;
    //判断year从Gyear到现在共有几个闰年
    if (year > Gyear)
    {
        for (i = Gyear; i<year; i++)
        {
            //判断闰年
            if (i >= 1800 && ((i % 4 == 0&& i % 100 != 0) || i % 400 == 0))
            {
                leapYearCount++;
            }
            if (i<1800 && i % 4 == 0)
            {
                leapYearCount++;
            }
        }
        if (month > 2)
        {
            if (year >= 1800 && ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0))
            {
                leapYearCount++;
            }
            if (year < 1800 && year % 4 == 0)
            {
                leapYearCount++;
            }
        }
    }
    
    //计算出某年某月共有多少天
    distance = (year - Gyear) * 365 + leapYearCount + countData(month);
    
    if ((year == 1752 && month>9) || year > 1752)
    {
        distance = distance - 11;
    }
    return distance;
}

//存储需要打印的某年某月的数值于三维数组中
void printTurn(int month, int firstday, int year)
{
    if (year == 1752 && month == 9)
    {
        array[month][0][Sun] = 0;
        array[month][0][Mon] = 0;
        array[month][0][Tues] = 1;
        array[month][0][Wed] = 2;
        for (int j = 14,row=0,column=Thur; j <= 30; j++)
        {
            array[month][row][column] = j;
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
        //大月有31天
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
                array[month][row][column] = i;
                column++;
                if (column > Sat)
                {
                    row++;
                    column = Sun;
                }
            }
            break;
        }
        //2月通过判断是否闰年给予29天或者28天
        case 2:
        {
            if ((year >= 1800 && ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)) || (year < 1800 && year % 4 == 0))
            {
                for (int i = 1, row = 0, column = firstday; i <= 29; i++)
                {
                    array[2][row][column] = i;
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
                    array[2][row][column] = i;
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
        //小月
        case 4:
        case 6:
        case 9:
        case 11:
        {
            for (int i = 1, row = 0, column = firstday; i <= 30; i++)
            {
                array[month][row][column] = i;
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

//打印具体日期(全年月份)
void datePrint(int month, int year)
{
    int firstday;
    //某月第一天是星期几
    firstday = firstdayWeekday(month, year);
    //存储数值到三维数组中
    printTurn(month, firstday, year);
    
    //某月下一个月
    firstday = firstdayWeekday(month+1, year);
    printTurn(month+1, firstday, year);
    
    //某月下下一个月
    firstday = firstdayWeekday(month+2, year);
    printTurn(month+2, firstday, year);
    
    for (int i = 0; i <=5; i++)
    {
        for (int j = month; j <= month+2; j++)
        {
            if (array[j][i][0] == 0)
            {
                printf("%2s", "");
            }
            else
            {
                printf("%2d", array[j][i][0]);
            }
            for (int k = 1; k <=6; k++)
            {
                if (array[j][i][k] == 0)
                {
                    printf("%3s", "");
                }
                else
                {
                    printf("%3d", array[j][i][k]);
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

//打印月份
void PrintMonth(int year,int month)
{
    int length;
    //判断输入的年份大小以给予合适的长度
    if(year>999)
    {
        length=4;
    }
    else if(length>99)
    {
        length=3;
    }
    else if(length>9)
    {
        length=2;
    }
    else
    {
        length=1;
    }
    
    //计算出一开始需要打印的空格数
    int spaceNum =(20-(int)strlen(monthDesc(month))-length-1)/2;
    for (int i=0; i<spaceNum; i++)
    {
        printf(" ");
    }
    //打印出月份和年份(同时控制输出的格式)
    printf("%s %d\n",monthDesc(month),year);
    printf("%2s%3s%3s%3s%3s%3s%3s\n", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa");
    
    //当前月的第一天是星期几
    int firstday = firstdayWeekday(month, year);
    
    //存储某年某月的数值于三维数组中
    printTurn(month, firstday, year);
    
    //按行打印
    for (int row=0; row<=5; row++)
    {
        if (array[month][row][0] == 0)
        {
            printf("%2s", "");
        }
        else
        {
            printf("%2d", array[month][row][0]);
        }
        for(int column=1;column<=6;column++)
        {
            if (array[month][row][column] == 0)
            {
                printf("%3s", "");
            }
            else
            {
                printf("%3d", array[month][row][column]);
            }
            if (column == 6)
            {
                printf("\n");
            }
        }
    }
    
}

//返回某月的前几个月总天数
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

//按月打印
void Month1(int month, int year)
{
    //打印第一行(月份)
    printFirstLine(month, year);
    //打印周一到周日
    printWeek();
    //打印具体日期(全年月份)
    datePrint(month, year);
}

//打印某年12个月
void calendar1(int year)
{
    int i;
    //输出年份
    printf("%33d\n\n",year);
    //同行有三个月
    for (i = 1; i <= 10; i=i+3)
    {
        Month1(i, year);
    }
}

//返回输入的年份
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
            //初始化内存空间
            memset(array, 0, 546);
            
            //存储命令行的字符数组
            char commandLIne[50];
            memset(commandLIne,0,50);
            
            char param[5][10];
            memset(param, '\0',50);
            
            printf("gujinyue $ ");
            
            //输入命令行
            gets(commandLIne);
            //将输入的命令行赋值给token,""是分隔符
            char* token=strtok(commandLIne," ");
            
            strcpy(param[0], token);
            for (int i =1;i<10; i++)
            {
                token=strtok(NULL," ");
                if(token==NULL)
                {
                    break;
                }
                //保存输入命令行的值
                strcpy(param[i], token);
            }
            
            if(strcmp(param[0],"cal")==0)
            {
                //错误处理
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
                    //cal -m 10
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