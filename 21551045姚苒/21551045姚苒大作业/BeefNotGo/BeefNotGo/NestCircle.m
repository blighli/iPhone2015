//
//  NestCircle.m
//  BeefNotGo
//
//  Created by 幽儿 on 15/12/29.
//  Copyright © 2015年 幽儿. All rights reserved.
//

#import "NestCircle.h"

extern NestCircle *allNest[9][9];
extern int map[9][9];
extern int hasCircle;

@implementation NestCircle

-(NSMutableArray*) getAllConnectNest{
    NSMutableArray* array=[[NSMutableArray alloc]initWithCapacity:6];
    [array insertObject:[self getLeft] atIndex:0];
    [array insertObject:[self getRight] atIndex:1];
    [array insertObject:[self getLeftUp] atIndex:2];
    [array insertObject:[self getRightUp] atIndex:3];
    [array insertObject:[self getLeftDown] atIndex:4];
    [array insertObject:[self getRightDown] atIndex:5];
    return array;
}

-(NestCircle*) getLeft
{
    NestCircle *newp=NULL;
    if(self.col>0){
        newp=allNest[self.row][self.col-1];
    }
    return newp;
}

-(NestCircle*) getRight
{
    NestCircle *newp=NULL;
    if(self.col<8){
        newp=allNest[self.row][self.col+1];
    }
    return newp;
}

-(NestCircle*) getLeftUp
{
    NestCircle *newp=NULL;
    if (self.row>0) {
        if(self.row%2==0){
            if(self.col==0){
                newp=NULL;
            }
            else{
                newp=allNest[self.row-1][self.col-1];
            }
        }
        else{
            newp=allNest[self.row-1][self.col];
        }
    }
    return newp;
}

-(NestCircle*) getRightUp
{
    NestCircle *newp=NULL;
    if(self.row>0){
        if (self.row%2==0) {
            newp=allNest[self.row-1][self.col];
        }
        else{
            if(self.col==8){
                newp=NULL;
            }
            else{
                newp=allNest[self.row-1][self.col+1];
            }
        }
    }
    return newp;
}

-(NestCircle*) getLeftDown
{
    NestCircle *newp=NULL;
    if (self.row<8) {
        if(self.row%2==0){
            if(self.col==0){
                newp=NULL;
            }
            else{
                newp=allNest[self.row+1][self.col-1];
            }
        }
        else{
            newp=allNest[self.row+1][self.col];
        }
    }
    return newp;
}

-(NestCircle*) getRightDown
{
    NestCircle *newp=NULL;
    if(self.row<8){
        if(self.row%2==0){
            newp=allNest[self.row+1][self.col];
        }
        else{
            if(self.col==8){
                newp=NULL;
            }
            else{
                newp=allNest[self.row+1][self.col+1]
                ;            }
        }
    }
    return newp;
}

-(BOOL) isBoundary
{
    if (self.row == 0 || self.row == 8 ||
        self.col == 0 || self.col == 8) {
        return YES;
    }
    else {
        return NO;
    }
}



-(int)calculateCost
{
    int i=self.row;
    int j=self.col;
    if (map[i][j]==1) {
        self.cost=100;
        return self.cost;
    }
    if ([self isBoundary]) {
        self.cost=0;
        return self.cost;
    }
    NSArray *allConnectNest=[self getAllConnectNest];
    int number=0;
    for (NestCircle *obj in allConnectNest) {
        if (map[obj.row][obj.col]==0) {
            number++;
        }
    }
    self.cost=number;
    return self.cost;
}

-(int)calculatePath
{
    int i=self.row;
    int j=self.col;
    if (map[i][j]==1) {
        self.path=100;
        return self.path;
    }
    if([self isBoundary]){
        self.path=0;
        return self.path;
    }
    NSArray *allConnectNest=[self getAllConnectNest];
    int min=100;
    for(NestCircle *obj in allConnectNest){
        if (obj.path>-100) {
            int tmp=obj.path;
            if (obj.path<0) {
                tmp=-tmp;
            }
            if (min>tmp) {
                min=tmp;
            }
        }
    }
    if (min<100) {
        self.path=min+1;
    }
    else{
        self.path+=1;
    }
    return self.path;
}

-(int) isInCircle
{
    NSArray *array=[self getAllConnectNest];
    int number=0;
    for(NestCircle *obj in array){
        if (obj.path>100||(obj.path>-100&&obj.path<0)||obj.path==100) {
            number++;
        }
    }
    if (number==6) {
        return 1;
    }
    else{
        return 0;
    }
}

-(int)compare:(NestCircle*)p1
{
    if (self.path>=0&&p1.path>=0) {
        if (self.path<p1.path) {
            return 1;
        }
    }
    else if (hasCircle==1){
        if (self.cost>p1.cost) {
            return 1;
        }
        else{
            return 0;
        }
    }
    else{
        int p=-self.path;
        int p2=-p1.path;
        if (p<p2) {
            return 1;
        }
        else return 0;
    }
    return 0;
}

@end
