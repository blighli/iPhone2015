//
//  main.m
//  cal
//
//  Created by menghaizhang on 15/10/15.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import <Foundation/Foundation.h>

char *monthHeader[12] =
{"               一月            ","               二月            ","               三月            ","                四月           ",
    "               五月            ","               六月            ","               七月            ","                八月           ",
    "               九月            ","               十月            ","               十一月          ","               十二月           ",
};

char *  weekHeader =          "  日  一   二  三   四  五  六    ";


struct MonthMatrix
{
    int matrix[6][7]  ;
} ;


char* formatday(int i )
{
    char c_day [2] ;
    
    c_day[0] = '0' + i/10;
    c_day[1] = '0' + i%10 ;
    return c_day ;
    
}

struct MonthMatrix  getMonthMatrix (int year ,int month   )
{
    NSString *s_year= [NSString stringWithFormat:@"%d",year];
    NSString *s_month= [NSString stringWithFormat:@"%d",month];
    NSString *s_date= [NSString stringWithFormat:@"%@-%@-%@",s_year,s_month,@"01 01:00:00"];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *firstDay  = [df dateFromString:s_date];
    NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:(NSDayCalendarUnit|NSMonthCalendarUnit|NSWeekOfMonthCalendarUnit|NSWeekdayCalendarUnit) fromDate:firstDay];
    long month_of_date = [componets month] ;
    NSDate *tempDate = firstDay ;
    struct MonthMatrix matrix;
    for (int i = 0 ; i < 6 ;i++)
    {
        for(int j = 0 ; j < 7 ;j++ )
        {
            matrix.matrix[i][j] = 0 ;
        }
    }
    do
    {
        NSDate *newdate = [[NSDate date] initWithTimeInterval:24 *60 * 60 sinceDate:tempDate];
        NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:(NSDayCalendarUnit|NSMonthCalendarUnit|NSWeekOfMonthCalendarUnit|NSWeekdayCalendarUnit) fromDate:tempDate];
        long day_week = [componets weekday] ;
        long week_mont = [componets weekOfMonth] ;
        long day = [componets day] ;
        NSString *s_day ;
        
        
        matrix.matrix[week_mont -1] [day_week -1 ] = day;
        
        
        NSDateComponents *componets_next = [[NSCalendar autoupdatingCurrentCalendar] components:(NSDayCalendarUnit|NSMonthCalendarUnit|NSWeekOfMonthCalendarUnit|NSWeekdayCalendarUnit)  fromDate:newdate];
        month = [componets_next month] ;
        tempDate = newdate ;
    }
    while (month == month_of_date );
    
    return matrix ;
}
NSString * get_s_a_week (int week[7])
{
    NSString * result  = [[NSString alloc] init];
    for(int i = 0 ; i < 7 ; i++)
    {
        if (week[i] == 0)
        {
            result = [result stringByAppendingString:@"    "];
        } else
            if (week[i] < 10 )
            {
                NSString *append = [NSString stringWithFormat:@"  0%d", week[i]];
                result = [result stringByAppendingString:append];
            }else{
                
                NSString *append = [NSString stringWithFormat:@"  %d" ,week[i]];
                result = [result stringByAppendingString:append];
            }
    }
    return  result ;
}

void print_month(int year ,int month )
{
    
    NSString *s_mongthHeader= [NSString stringWithUTF8String:monthHeader[month-1]];
    NSString *s_yearHeader= [NSString stringWithFormat:@"             %d年               " ,year ];
    NSString *s_weekHeader= [NSString stringWithUTF8String:weekHeader];
    NSLog(s_yearHeader) ;
    NSLog(s_mongthHeader);
    NSLog(s_weekHeader) ;
    struct MonthMatrix matrix = getMonthMatrix(year, month) ;
    for (int i = 0 ; i< 6;i++)
    {
        NSString *a_week =  get_s_a_week(matrix.matrix[i]) ;
        NSLog(a_week) ;
        
    }
    
    
}


void print_year(int year)
{
    struct MonthMatrix matixes [12] ;
    for(int i = 0 ;i < 12 ;i++)
    {
        matixes[i] = getMonthMatrix(year, i +1);
    }
    
    for (int i = 0 ; i < 3; i++ )
    {
        
        NSString *s_l_mongthHeader = [[NSString alloc] init] ;
        NSString *s_l_yearHeader = [[NSString alloc] init] ;
        for(int j = 0 ; j< 4; j ++)
        {
            NSString *s_yearHeader= [NSString stringWithFormat:@"             %d年            " ,year ];
            NSString *s_mongthHeader= [NSString stringWithUTF8String:monthHeader[i*4+j]];
            s_l_mongthHeader = [s_l_mongthHeader stringByAppendingString:s_mongthHeader] ;
            s_l_yearHeader = [s_l_yearHeader stringByAppendingString:s_yearHeader] ;
        }
        NSLog(s_l_yearHeader) ;
        NSLog(s_l_mongthHeader) ;
        
        NSString *s_l_weekHeader = [[NSString alloc] init] ;
        for(int j = 0 ; j< 4; j ++)
        {
            NSString *s_weekHeader= [NSString stringWithUTF8String:weekHeader];
            s_l_weekHeader = [s_l_weekHeader stringByAppendingString:s_weekHeader ];
        }
        NSLog(s_l_weekHeader) ;
        
        
        
        
        for (int k = 0 ; k< 6;k++)
        {
            NSString *s_l_a_week = [[NSString alloc] init] ;
            for(int j = 0 ; j< 4; j ++)
            {
                NSString *a_week =  get_s_a_week(matixes[i*4+j].matrix[k]) ;
                
                s_l_a_week = [s_l_a_week stringByAppendingString:a_week ];
                s_l_a_week = [s_l_a_week stringByAppendingString:@"    " ];
            }
            NSLog(s_l_a_week) ;
        }
        
        
    }
    
    
}




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        @try {
            
            //   NSDate *date = [NSDate date ] ;
            //   NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
            //   [dateFormatter setDateFormat:@"YYYY-MM-dd"];
            //   NSString *dateString = [dateForm;atter stringFromDate:[NSDate date]];
            char * env_m = getenv("m") ;
            //        if(env_m == NULL)
            //        {
            //            NSLog(@"no -m " );
            //        }
            if(argc > 1 || env_m != NULL)
            {
                int year ,month ;
                if(env_m != NULL)
                {
                    NSDate *now = [NSDate date];
                    NSCalendar *cal = [NSCalendar currentCalendar];
                    unsigned int unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit ;
                    NSDateComponents *dd = [cal components:unitFlags fromDate:now];
                    year  = [dd year] ;
                    month = atoi (env_m) ;
                    print_month(year, month) ;
                }
                else
                    if(argc  >= 3){
                        year  = atoi(argv[1]) ;
                        month = atoi(argv[2]) ;
                        print_month(year, month) ;
                        
                    }else{
                        year = atoi(argv[1]) ;
                        print_year (year ) ;
                        
                        
                    }
                NSString *dateString = [[NSString alloc] initWithCString:argv[0]];
                
            }
            
        }
        
        @catch(NSException *exception)    {
            
            NSLog(@"参数错误啊  亲！！！！" );
        }
    }
    return 0;
}

