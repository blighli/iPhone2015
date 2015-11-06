#import "Calendar.h"
#import "Foundation/Foundation.h"

@implementation Calendar


-(void)setDayNum{
    dayNum[0]=31;
    dayNum[1]=28;
    dayNum[2]=31;
    
    dayNum[3]=30;
    dayNum[4]=31;
    dayNum[5]=30;

    dayNum[6]=31;
    dayNum[7]=31;
    dayNum[8]=30;

    dayNum[9]=31;
    dayNum[10]=30;
    dayNum[11]=31;
}
-(void)setWeek
{
    strcpy(week[0],"sun");
    strcpy(week[1],"mon");
    strcpy(week[2],"tue");
    strcpy(week[3],"wed");
    strcpy(week[4],"thu");
    strcpy(week[5],"fri");
    strcpy(week[6],"sat");
}

-(void)setMonth
{
    strcpy(month[0], "一月");
    strcpy(month[1], "二月");
    strcpy(month[2], "三月");
    strcpy(month[3], "四月");
    strcpy(month[4], "五月");
    strcpy(month[5], "六月");
    strcpy(month[6], "七月");
    strcpy(month[7], "八月");
    strcpy(month[8], "九月");
    strcpy(month[9], "十月");
    strcpy(month[10], "十一月");
    strcpy(month[11], "十二月");
}

- (int) calstr:(char*)st
{
    int j=0,sum=0;
    int num[10] ;
    while (*st!='\0')
    {
        num[j++] = *st - '0';
        st++;
    }
    for (int k = 0; k <j;k++)
    {
        sum += num[k]*pow((float)10,(int)(j-k-1));
    }
    return sum;
}

- (int) HandString:(NSString*)string
{
    NSMutableArray *array=[NSMutableArray arrayWithCapacity:42];
    //去掉前后的空格
    NSString *strs=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //            按照空格切分数组
    //遍历切分后的数组，将数组中的空格去掉
    for(NSString *judge in [strs componentsSeparatedByString:@" "]){
              if(![judge isEqualToString:@""]){
            [array addObject:judge];
            //                   NSLog(@"%@",judge);
        }
    }
    if([array count]==1){
     //   NSLog(@"%@",[array objectAtIndex:0]);
        if([[array objectAtIndex:0] isEqualToString:@"cal"]){
            return 1;
        }
        else{
            return 0;
        }
    }
    if([array count]==2){
        int year;
        @try {
            year=[[array objectAtIndex:1] intValue];
             yyy=year;
        }
        @catch (NSException *exception) {
           // NSLog(@"cal: year 0 not in range 1..9999");
            return 0;
        }
        @finally {
            if(year<1||year>9999){
              //  NSLog(@"cal: year 0 not in range 1..9999");
                return 0;
            }
        }
       
        return 2;
    }
    if([array count]==3){
        
        if([[array objectAtIndex:1]  isEqualToString:@"-m"])
        {
            NSDateFormatter *dateFormatter =[NSDateFormatter new];
            // 设置日期格式
            [dateFormatter setDateFormat:@"YYYY-MM-dd"];
            NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
            NSArray *arr=[dateString componentsSeparatedByString:@"-"];
            int year=[[arr objectAtIndex:0] intValue];
            yyy=year;
            @try {
                mmm=[[array objectAtIndex:2] intValue];
                //            NSLog(@"%d",month);
            }
            @catch (NSException *exception) {
               // NSLog(@"cal: %@ is neither a month number (1..12) nor a name",[array objectAtIndex:1]);
                return 0;
            }
            @finally {
                if(mmm<1||mmm>12){
                  //  NSLog(@"cal: %@ is neither a month number (1..12) nor a name",[array objectAtIndex:1]);
                    return 0;
                }
            }
            

        }else{
            @try {
                yyy=[[array objectAtIndex:2] intValue];
            }
            @catch (NSException *exception) {
              //  NSLog(@"cal: year 0 not in range 1..9999");
                return 0;
            }
            @finally {
                if(yyy<1||yyy>9999){
                 //   NSLog(@"cal: year 0 not in range 1..9999");
                    return 0;
                }
            }
            @try {
                mmm=[[array objectAtIndex:1] intValue];
                //            NSLog(@"%d",month);
            }
            @catch (NSException *exception) {
              //  NSLog(@"cal: %@ is neither a month number (1..12) nor a name",[array objectAtIndex:1]);
                return 0;
            }
            @finally {
                if(mmm<1||mmm>12){
                  //  NSLog(@"cal: %@ is neither a month number (1..12) nor a name",[array objectAtIndex:1]);
                    return 0;
                }
            }

        }
        return 3;
    }
    return -1;

//    char p[5],*t,q[5],r[5];
//    int i=0;
//    while (*str != ' '&&*str!='\0')
//    {
//        p[i++] = *str;
//        str++;
//    }
//    p[i] = '\0';
//    t = str;
//    i = 0;
//    if (strcmp(p,"cal")==0)
//    {
//        if (*t==' ')
//        {
//            t++;
//            while (*t != ' ' && *t != '\0')
//            {
//                q[i++] = *t;
//                t++;
//            }
//            q[i] = '\0';
//            i = 0;
//            if (*t == ' ')
//            {
//                t++;
//                while ( *t != '\0')
//                {
//                    r[i++] = *t;
//                    t++;
//                }
//                r[i] = '\0';
//                yyy = [self calstr:r];
//                mmm=[self calstr:q];
//                return 3;
//            }
//            else
//            {
//                yyy = [self calstr:q];
//                return 2;
//            }
//        }
//        else
//        {
//            return 1;
//        }
//    }
//    else
//    {
//        return 0;
//    }
}

- (bool) isLeapYear:(int)year
{
    if (year <= 1752 && year % 4 == 0)
    {
        return true;
    }
    else if (year>1752 && year % 4 == 0 && year % 100 != 0)
    {
        return true;
    }
    else if (year>1752 && year % 4 == 0 && year % 100 == 0 && year % 400 == 0)
    {
        return true;
    }
    else
        return false;
}

- (int) judgeDayDay:(int)year Month:(int)m Day:(int)day
{
    day -= 1;
    return ([self judgeMonthDay:year Month:m] + day % 7) % 7;
}

- (int) judgeMonthDay:(int)year Month:(int)m
{
    int sumday = 0;
    if ([self isLeapYear:year])
    {
        dayNum[1] = 29;
    }
    if (m == 1)
    {
        return [self judgeYearFirstDay:year];
    }
    else
    {
        for (int i = 1; i < m; i++)
        {
            sumday += dayNum[i - 1];
        }
        return ([self judgeYearFirstDay:year] + sumday % 7) % 7;
    }
}

- (int) judgeYearFirstDay:(int)year
{
    if (year == 1)
        return 6;
    else if (year <= 1752)
    {
        int sum = 0;
        for (int i = 1; i <= year - 1; i++)
        {
            if (![self isLeapYear:i])
            {
                sum += 365;
            }
            else
            {
                sum += 366;
            }
        }
        return (6+sum % 7)%7;
    }
    else if (year >= 1753)
    {
        int num = 0;
        for (int i = 1; i <= 1751; i++)
        {
            if (![self isLeapYear:i])
            {
                num += 365;
            }
            else
            {
                num += 366;
            }
        }
        num += 355;
        for (int j = 1752; j<year - 1; j++)
        {
            if (![self isLeapYear:j])
            {
                num += 365;
            }
            else
            {
                num += 366;
            }
        }
        if (![self isLeapYear:(year-1)])
        {
            return (5 + num % 7) % 7;
        }
        else
            return (6+ num % 7) % 7;
    }
    return  0;
}

- (void) print:(int)year Month:(int)m
{
    for (int i = 0; i < 13; i++)
    {
        printf(" ");
    }
    printf("%d\n", year);
    
    for (int i = 0; i < 13; i++)
    {
        printf(" ");
    }
    printf("%s\n", month[m-1]);
    
    for (int j = 0; j < 7; j++)
    {
        printf("%s ", week[j]);
    }
    printf("\n");
    int calen[7][7] = {0};
    int MLine = ([self judgeMonthDay:year Month:m] -1+ dayNum[m - 1]) / 7;
    if ([self isLeapYear:year])
    {
        dayNum[1] = 29;
    }
    for (int i = 1; i <= dayNum[m - 1]; i++)
    {
        int line = ([self judgeMonthDay:year Month:m] - 1 + i) / 7;
        int row = ([self judgeDayDay:year Month:m Day:i]);
        calen[line][row] = i;
    }
    for (int i = 0; i <= MLine; i++)
    {
        for (int j = 0; j < 7; j++)
        {
            if (calen[i][j] != 0)
            {
                printf("%3d ", calen[i][j]);
            }
            else
            {
                printf("    ");
            }
        }
        printf("\n");
    }
}

- (void) printY:(int)year
{
    int calen[12][6][7] = { 0 };
    if ([self isLeapYear:year])
    {
        dayNum[1] = 29;
    }
    
    for (int i = 0; i < 41; i++)
    {
        printf(" ");
    }
    printf("%d\n", year);
    for (int l = 0; l < 4; l++)
    {
        for (int i = 0; i < 2; i++)
        {
            for (int j = 0; j < 12; j++)
            {
                printf(" ");
            }
            printf("%s", month[i + l * 3]);
            for (int j = 0; j < 16; j++)
            {
                printf(" ");
            }
        }

            for (int j = 0; j < 12; j++)
            {
                printf(" ");
            }
            printf("%s\n", month[2 + l * 3]);
    
        
        for (int i = 0; i < 12; i++)
        {
            for (int j = 1; j <= dayNum[i]; j++)
            {
                int line = ([self judgeMonthDay:year Month:(i+1)] - 1 + j) / 7;
                int row = ([self judgeDayDay:year Month:(i+1) Day:j]);
                calen[i][line][row] = j;
            }
        }
        
        for (int i = 1; i <= 3; i++)
        {
            for (int j = 0; j < 7; j++)
            {
                printf("%s ", week[j]);
            }
            printf("    ");
        }
        printf("\n");
        
        for (int i = 0; i < 6; i++)
        {
            for (int j = l * 3; j < (l + 1) * 3; j++)
            {
                for (int k = 0; k < 7; k++)
                {
                    if (calen[j][i][k] != 0)
                        printf("%3d ", calen[j][i][k]);
                    else
                        printf("    ");
                }
                printf("    ");
            }
            printf("\n");
        }
    }
    dayNum[1]=28;
}

-(int)yyy{
    return yyy;
}

-(int)mmm{
    return mmm;
}

@end
