//
//  PostDataBase.m
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import "PostDataBase.h"
#import "DB.h"
#import "PostModel.h"

@implementation PostDataBase

+ (void)insertWithModel:(PostModel *)model
{
    sqlite3 *db = [DB shareDataBase];
    
    NSString *sqlstr = [NSString stringWithFormat:@"insert into infomation values (%ld,'%@','%@','%@','%@')", (long)model.infoId, model.photo, model.locate, model.content, model.stamp];
    
    int result = sqlite3_exec(db, [sqlstr UTF8String], nil, nil, nil);
    NSLog(@"%d", result);
    if (result == SQLITE_OK) {
        NSLog(@"添加成功");
    } else {
        NSLog(@"添加失败");
    }
}

+ (NSMutableArray *)selectAll
{
    sqlite3 *db = [DB shareDataBase];
    sqlite3_stmt *stmt = nil;
    
    NSString *sqlStr = [NSString stringWithFormat:@"select * from infomation"];
    int result = sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &stmt, nil);
    NSMutableArray *array =[NSMutableArray array];
    if (result == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            int infoid = sqlite3_column_int(stmt, 0);
            const unsigned char *photo = sqlite3_column_text(stmt, 1);
            const unsigned char *locate = sqlite3_column_text(stmt, 2);
            const unsigned char *content = sqlite3_column_text(stmt, 3);
            const unsigned char *stamp = sqlite3_column_text(stmt, 4);
            
            NSString *infoid1 = [NSString stringWithFormat:@"%d", infoid];
            NSString *photo1 = [NSString stringWithUTF8String:(const char *)photo];
            NSString *locate1 = [NSString stringWithUTF8String:(const char *)locate];
            NSString *content1 = [NSString stringWithUTF8String:(const char *)content];
            NSString *stamp1 = [NSString stringWithUTF8String:(const char *)stamp];
            
            
            PostModel *model = [PostModel postModelWithId:[infoid1 integerValue] photo:photo1 locate:locate1 content:content1 stamp:stamp1];
            [array addObject:model];
            
        }
    }
    sqlite3_finalize(stmt);
    return array;
    
}

+ (NSString *)selectByModel:(PostModel *)model
{
    sqlite3 *db = [DB shareDataBase];
    sqlite3_stmt *stmt = nil;
    NSString *sqlstr = [NSString stringWithFormat:@"select * from infomation where infoid = %ld",(long)model.infoId];
    int result = sqlite3_prepare_v2(db, [sqlstr UTF8String], -1, &stmt, nil);
    
    if (result == SQLITE_OK) {
        if (sqlite3_step(stmt) == SQLITE_ROW) {
            int infoid = sqlite3_column_int(stmt, 0);
            NSString *infoid1 = [NSString stringWithFormat:@"%d", infoid];
            
            sqlite3_finalize(stmt);
            return infoid1;
            
        }
        
    }
    sqlite3_finalize(stmt);
    return nil;
    
}

+ (void)deleteWithModel:(PostModel *)model
{
    sqlite3 *db = [DB shareDataBase];
    
    NSString *sqlStr = [NSString stringWithFormat:@"delete from infomation where infoid = %ld", (long)model.infoId];
    
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, nil);
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    }
    else {
        NSLog(@"删除失败");
    }
}

+ (void)updateWithModle:(PostModel *)model
{
    sqlite3 *db = [DB shareDataBase];
    NSString *sqlStr = [NSString stringWithFormat:@"update infomation set photo ='%@',locate='%@',content='%@',stamp='%@', where infoid = %ld", model.photo, model.locate, model.content, model.stamp, (long)model.infoId];
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, nil);
    if (result == SQLITE_OK) {
        NSLog(@"修改成功");
    } else {
        NSLog(@"修改失败");
    }
}









@end
