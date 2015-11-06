#import <Foundation/Foundation.h>
#import "Calendar.h"
int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        int year, month;
        
        while (true)
        {
            NSMutableString *str=[NSMutableString stringWithCapacity:42];
            char c;
//            gets(str);
            while((c=getc(stdin))!='\n'){
                [str appendFormat:@"%c",c];
            }

            Calendar *calObj=[[Calendar alloc]init];
            [calObj setDayNum];
            [calObj setWeek];
            [calObj setMonth];
           
            if ([calObj HandString:str]== 3)
            {
                year=[calObj yyy];
                month=[calObj mmm];
                [calObj print:year Month:month];
            }
            else if ([calObj HandString:str]== 2)
            {
                year=[calObj yyy];
                [calObj printY:year];
            }
            else  if ([calObj HandString:str]== 1)
            {
                NSDateFormatter *dateFormatter =[NSDateFormatter new];
                // 设置日期格式
                [dateFormatter setDateFormat:@"YYYY-MM-dd"];
                NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
                NSArray *arr=[dateString componentsSeparatedByString:@"-"];
                int year=[[arr objectAtIndex:0] intValue];
                int month=[[arr objectAtIndex:1] intValue];
                [calObj print:year Month:month];
            }
            else if ([calObj HandString:str] == 0)
            {
                printf("Input Error\n");
            }
        }
        return 0;
    }
}
