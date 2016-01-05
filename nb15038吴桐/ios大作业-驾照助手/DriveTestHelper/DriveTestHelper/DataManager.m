//
//  dataManager.m
//  DriveTestHelper
//
//  Created by wp on 15/12/16.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "DataManager.h"
#import "FMDatabase.h"
#import "TestChoiceModel.h"
#import "AnswerModel.h"
#import "SubTestSelectModel.h"

@implementation DataManager
+(NSArray *)getData:(DataType)type{
    static FMDatabase *dataBase;
    NSMutableArray *dataObjArr = [[NSMutableArray alloc]init];
    if (dataBase==nil) { //检查数据库是否已存在，不存在则创建
        NSString *path=[[NSBundle mainBundle]pathForResource:@"data" ofType:@"sqlite"];//数据库文件地址
        dataBase=[[FMDatabase alloc]initWithPath:path];
    }
    if ([dataBase open]) {
//        NSLog(@"打开数据库成功");
    } else {
        return [dataObjArr copy];//打开失败，直接返回空数组
    }
    switch (type) {//根据不同的场景选择对应的数据
        case chapter:
        {
            //章节
            NSString *sql=@"select pid,pname,pcount FROM firstlevel";
            FMResultSet *rs=[dataBase executeQuery:sql];
            while ([rs next]) {
                TestChoiceModel *model=[[TestChoiceModel alloc]init];
                model.pid=[NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname=[rs stringForColumn:@"pname"];
                model.pcount=[NSString stringWithFormat:@"%d",[rs intForColumn:@"pcount"]];
                [dataObjArr addObject:model];
            }
        }
            break;
        case answer:
        {
            //题目
            NSString *sql=@"select mquestion,mdesc,mid,manswer,mimage,pid,pname,sid,sname,mtype FROM leaflevel";
            FMResultSet *rs=[dataBase executeQuery:sql];
            while ([rs next]) {
                AnswerModel *model=[[AnswerModel alloc]init];
                model.mQuestion=[rs stringForColumn:@"mquestion"];
                model.mDesc=[rs stringForColumn:@"mdesc"];
                model.mid=[NSString stringWithFormat:@"%d",[rs intForColumn:@"mid"]];
                model.mAnswer=[rs stringForColumn:@"manswer"];
                model.mImage=[rs stringForColumn:@"mimage"];
                model.pid=[NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname=[rs stringForColumn:@"pname"];
                model.sid=[rs stringForColumn:@"sid"];
                model.sname=[rs stringForColumn:@"sname"];
                model.mtype=[NSString stringWithFormat:@"%d",[rs intForColumn:@"mtype"]];
                [dataObjArr addObject:model];
            }
        }
            break;
        case speciality:
        {
            //专项
            NSString *sql=@"select pid,sname,scount,sid,serial FROM secondlevel";
            FMResultSet *rs=[dataBase executeQuery:sql];
            while ([rs next]) {
                SubTestSelectModel *model=[[SubTestSelectModel alloc]init];
                model.pid=[NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.sid=[rs stringForColumn:@"sid"];
                model.sname=[rs stringForColumn:@"sname"];
                model.scount=[NSString stringWithFormat:@"%d",[rs intForColumn:@"scount"]];
                model.serial=[NSString stringWithFormat:@"%d",[rs intForColumn:@"serial"]];
                [dataObjArr addObject:model];
            }
        }
            break;
        default:
            break;
    }
    return dataObjArr;
}
@end
