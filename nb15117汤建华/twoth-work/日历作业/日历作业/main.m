#import <Foundation/Foundation.h>
#import "Found_Calendar.h"

static const char *numMnth[] = {"", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"};
/*
 showCal(int year,int month):输入第year年，第month月的日历。当month＝0时，输出全年日历；当year＝0，month＝0，输出今年今月的日历
 printCal():打印日历
 */
void printCal(NSUInteger year,NSInteger month,NSUInteger arrDMonth[],NSUInteger arrFDay[],NSInteger wholeYear){
    //控制年份的输出，当只显示一个日历的时候，需要特殊处理
    NSInteger times = 1;//每行现实几个月的日历
    NSUInteger minMonth = 0,maxMonth = 0;
    if(wholeYear == 1){//全年
        times = 3;
        minMonth = 1;
        maxMonth = 12;
    }
    else if (month !=0){
        minMonth = maxMonth = month;
    }
    if (wholeYear == 0) {
        printf("        %s月  %04lu\n", numMnth[month], year);
    }
    else{
        for(int i = 0; i < 30; i++) printf(" ");
        printf("       %04lu\n\n", year);
    }
    //输出日历
    NSUInteger mdata[2];
    
    for (NSUInteger sMonth = minMonth; sMonth <= maxMonth; sMonth += times)
    {
        if (wholeYear == 1)//全年日历
        {
            for (int j = 0; j < times; j++)
            {
                if (sMonth + j < 11){
                    printf("          %s月          ", numMnth[sMonth + j]);
                    printf("        ");
                }
                else printf("          %s月          ", numMnth[sMonth + j]);
                
            }
            printf("\n");
        }
        for (int k = 0; k < times; k++)
            printf(" 日  一  二  三  四  五   六    ");
        printf("\n");
        memset(mdata, 0, sizeof(mdata));
        for (int i = 0; i < times; i++) mdata[i] = 1;//每个月的日期初始化
        for (int i = 0; i < 6; i++)//每个月每一行输出
        {
            for (int t = 0; t < times; t++)
            {
                NSInteger firstday = 1;//每个星期的第一天
                //特殊处理第一行的输出,输出1号日期前面的空格
                if (i == 0)
                {
                    for (int k = 1; k < arrFDay[sMonth + t]; k++)
                    {
                        printf("    ");
                    }
                    firstday = arrFDay[sMonth + t];
                }
                //                if (i == 5) {
                //                    printf("  ");
                //                }
                for (NSUInteger j = firstday; j <=7; j++)//日期对应星期输出
                {
                    //特殊处理星期日下的日期格式控制，日期为占两个字符位，向右对齐
                    if ( j == 1 || mdata[t] == 1)//第一列输出
                    {
                        if (mdata[t] > arrDMonth[sMonth + t])// 最后一天输出后
                        {
                            //                            printf("j0:%lu,m:%lu",j,sMonth + t);
                            if (j != 1 || j != 7) {
                                for (NSUInteger p = j-1; p <= 7; p++) {
                                    printf("   ");
                                }
                            }
                            //
                        }
                        else printf("%3lu", mdata[t]++);
                    }
                    else // 其他列
                    {
                        //                        NSLog(@"mdata:%lu,arrDMonth:%lu",mdata[t],arrDMonth[sMonth + t]);
                        if (mdata[t] > arrDMonth[sMonth + t])
                        {
                            //                            printf("j0:%lu,m:%lu",j,sMonth + t);
                            if (j != 1 || j != 7) {
                                for (NSUInteger p = j; p <= 2; p++) {
                                    //                                    printf("j0:%lu,m:%lu",j,sMonth + t);
                                    printf("  ");
                                }
                            }
                        }
                        else printf("%4lu", mdata[t]++);
                    }
                    //当一个星期输入完成后，判断一下是否输出'\n'还是"  "
                    if (j == 7)
                    {
                        if (t == times - 1) printf("\n");
                        else printf("  ");
                    }
                }
                
            }
        }
    }
    
}

void showCal(NSInteger month,NSInteger year){
    NSCalendar *newCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //  通过已定义的日历对象，获取某个时间点的NSDateComponents表示，并设置需要表示哪些信息（NSYearCalendarUnit, NSMonthCalendarUnit, NSDayCalendarUnit等）
    NSDateComponents *comps = [newCal components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:[NSDate date]];
    int wholeYear = 0;
    
    //    arrFDay[i]表示当前年份中，第i个月的第一天是星期几
    NSUInteger arrFDay[13];
    //arrDMonth[i]表示当前年份中，第i个月的天数
    NSUInteger arrDMonth[13];
    //初始化两个数组都为0，查询范围以外的月份信息需要置为0
    memset(arrFDay, 0, sizeof(arrFDay));
    memset(arrDMonth, 0, sizeof(arrDMonth));
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compt = [[NSDateComponents alloc] init];
    for (NSUInteger newMonth = 1; newMonth <= 12; newMonth ++)
    {
        [compt setMonth:newMonth];
        NSInteger dayCount = [[calendar dateFromComponents:compt] daysOfMonth];
        //        printf("daycount:%lu\n",dayCount);
        //        printf("newMonth:%lu\n",newMonth);
        arrDMonth[newMonth] = dayCount;
        NSInteger datas = [[calendar dateFromComponents:comps] fWeekDayOfMonth:year setMonth:newMonth];
        arrFDay[newMonth] = datas;
        //        printf("datas:%lu\n\n",datas);
    }
    
    if(year ==0 && month == 0){//今年今月
        NSLog(@"year:%lu,month:%lu",comps.year,comps.month);
        printCal(comps.year,comps.month,arrDMonth,arrFDay,wholeYear);
    }
    else if (month == 0 && year != 0){//对应第year年
        wholeYear = 1;
        printCal(year, month, arrDMonth, arrFDay, wholeYear);
    }
    else if (month != 0 && year != 0){//对应第year年第month月
        printCal(year, month, arrDMonth, arrFDay, wholeYear);
    }
    else if (year == 0 && month !=0){//对应cal －m month 操作
        printCal(comps.year, month, arrDMonth, arrFDay, wholeYear);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char buffer[1000];     //使用一个缓冲区
        NSLog(@"请输入命令");
        //        gets(buffer);
        fgets (buffer, sizeof(buffer), stdin);
        NSString * str= [NSString stringWithUTF8String:buffer];
        //处理命令
        NSInteger strLength = str.length;
        NSString * ptr1 = [str substringToIndex:strLength-1];
        NSArray *arr = @[@"0", @"0", @"0"];
        //初始化两个数组都为0，查询范围以外的月份信息需要置为0
        arr = [ptr1 componentsSeparatedByString:@" "];
        NSString *str2 = @"cal";
        NSString *str3 = @"-m";
        NSInteger year01,mnth;
        @try {
            if ([arr[0] isEqualTo:str2]) {
                if (strLength-1 == 3) {                 //cal
                    showCal(0,0);
                }
                else if ([arr[1] isEqualTo:str3] && arr[2] !=0){
                    mnth =[arr[2] intValue];
                    if (1 <= mnth && mnth <= 12) {      //cal -m 4
                        showCal(mnth,0);
                    }
                    else{
                        NSException *exception = [NSException exceptionWithName:@"CommandException" reason:@"月份输入错误.（1～12）" userInfo:nil];
                        @throw exception;
                    }
                }
                else{
                    NSUInteger count = [arr count];
                    if (count == 3) {    //cal 2014 4
                        mnth =[arr[1] intValue];
                        year01 = [arr[2] intValue];
                        if (year01 >= 1) {
                            if (1 <= mnth && mnth <= 12 ) {
                                showCal(mnth,year01);
                            }
                            else{
                                NSException *exception = [NSException exceptionWithName:@"CommandException" reason:@"月份输入错误.（1～12）" userInfo:nil];
                                @throw exception;
                            }
                        }else{
                            NSException *exception = [NSException exceptionWithName:@"CommandException" reason:@"年份输入错误.(大于1）" userInfo:nil];
                            @throw exception;
                        }
                        
                    }else if (count == 2){ //cal 2014
                        year01 =[arr[1] intValue];
                        if (year01 >= 1) {
                            showCal(0,year01);
                        }
                        else{
                            NSException *exception = [NSException exceptionWithName:@"CommandException" reason:@"年份输入错误.(大于1））" userInfo:nil];
                            @throw exception;
                        }
                        
                    }
                }
            }
            else{
                NSException *exception = [NSException exceptionWithName:@"CommandException" reason:@"命令输入错误." userInfo:nil];
                @throw exception;
            }
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception);
            NSLog(@"输入格式如下：\n cal [[month] year]\n cal -m month [year]");
        }
        @finally {
        }
    }
    return 0;
}