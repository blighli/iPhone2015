//
//  CircleLocation.swift
//  weizhushenjingmao
//
//  Created by Bor on 15/12/26.
//  Copyright © 2015年 bor. All rights reserved.
//

import Foundation

class CircleLocation{
    var row: Int //存每个点的行
    var col: Int //存每个点的列
    var path: Int = -100 //存每个点的最短路径数
    var cost: Int = -100 //存每个点的连接数
    
    init (row: Int, col: Int){
        self.row = row
        self.col = col
    }
    
    func getLeft() -> CircleLocation? {
        var newp : CircleLocation?
        if (col > 0) {
            newp = allCircleLocations[row][col-1]
        }
        return newp
    }
    func getRight() -> CircleLocation? {
        var newp : CircleLocation? = nil
        if (col < 8) {
            newp = allCircleLocations[row][col+1]
        }
        return newp
    }
    func getLeftDown() -> CircleLocation? {
        var newp : CircleLocation? = nil
        if (row < 8) {
            let p = allCircleLocations[row+1][col]
            if (row % 2 == 0) {
                if (col == 0) {
                    newp = nil
                }
                else {
                    newp = allCircleLocations[row+1][col-1]
                }
            }
            else {
                newp = p
            }
        }
        return newp
    }
    func getRightDown() -> CircleLocation? {
        var newp : CircleLocation? = nil
        if (row < 8) {
            let p = allCircleLocations[row+1][col]
            if (row % 2 == 0) {
                newp = p
            }
            else {
                if col == 8 {
                    newp = nil
                }
                else {
                    newp = allCircleLocations[row+1][col+1]
                }
            }
        }
        return newp
    }
    func getRightUp() -> CircleLocation? {
        var newp : CircleLocation? = nil
        if (row < 8) {
            let p = allCircleLocations[row-1][col]
            if (row % 2 == 0) {
                newp = p
            }
            else {
                if col == 8 {
                    newp = nil
                }
                else {
                    newp = allCircleLocations[row-1][col+1]
                }
            }
        }
        return newp
    }
    func getLeftUp() -> CircleLocation? {
        var newp : CircleLocation? = nil
        if (row < 8) {
            let p = allCircleLocations[row-1][col]
            if (row % 2 == 0) {
                if (col == 0) {
                    newp = nil
                }
                else {
                    newp = allCircleLocations[row-1][col-1]
                }
            }
            else {
                newp = p
            }
        }
        return newp
    }
    func getAllConnectLocation() -> [CircleLocation] {
        var arr = [CircleLocation]()
        var cl = getLeftUp()
        if let temp = cl {
            if map[temp.row][temp.col] == 0 {
                arr.append(temp)
            }
        }
        
        cl = getLeft()
        if let temp = cl {
            if map[temp.row][temp.col] == 0 {
                arr.append(temp)
            }
        }
        
        cl = getLeftDown()
        if let temp = cl {
            if map[temp.row][temp.col] == 0 {
                arr.append(temp)
            }
        }
        
        cl = getRightDown()
        if let temp = cl {
            if map[temp.row][temp.col] == 0 {
                arr.append(temp)
            }
        }
        
        cl = getRight()
        if let temp = cl {
            if map[temp.row][temp.col] == 0 {
                arr.append(temp)
            }
        }
        
        cl = getRightUp()
        if let temp = cl {
            if map[temp.row][temp.col] == 0 {
                arr.append(temp)
            }
        }
        return arr
    }
    func getAllLocation() -> [CircleLocation] {
        var arr = [CircleLocation]()
        var cl = getLeftUp()
        if let temp = cl {
                arr.append(temp)
        }
        
        cl = getLeft()
        if let temp = cl {
                arr.append(temp)
        }
        
        cl = getLeftDown()
        if let temp = cl {
                arr.append(temp)
        }
        
        cl = getRightDown()
        if let temp = cl {
                arr.append(temp)
        }
        
        cl = getRight()
        if let temp = cl {
                arr.append(temp)
        }
        
        cl = getRightUp()
        if let temp = cl {
                arr.append(temp)
        }
        return arr
    }

    func isBoundary() -> Bool {
        if (row == 0 || row == 8 ||
            col == 0 || col == 8) {
                return true;
        }
        else {
            return false;
        }
    }
    func calculateCost() -> Int {
        if map[row][col] == 1 {
            cost = 100
            return cost
        }
        
        if isBoundary() {
            cost = 0
            return cost
        }
        
        let allConnectLocation = getAllConnectLocation()
        cost = allConnectLocation.count
        return cost
    }
    func calculatePath() -> Int {
        let i = self.row
        let j = self.col
        if (map[i][j] == 1) {
            self.path = 100
            return self.path
        }
        if self.isBoundary() {
            self.path = 0
            return self.path
        }
        let allConnectLocation = self.getAllConnectLocation()
        var min = 100
        for obj in allConnectLocation {
            if obj.path > -100 {
                var tmp = obj.path;
                if obj.path < 0 {
                    tmp = -tmp;
                }
                if (min > tmp) {
                    min = tmp;
                }
            }
        }
        if min < 100 {
            self.path = min + 1;
        }
        else {
            self.path += 1;
        }
        return self.path;
    }
    func compare(cl:CircleLocation) -> Bool {
        if hasCircle == 0 {
            return self.isMoreThan(cl)
        }
        else {
            return self.isLessThan(cl)
        }
    }
    func isMoreThan(cl:CircleLocation) -> Bool {
        var spath = self.path
        var cpath = cl.path;
        if spath < 0 {
            spath = -spath
        }
        if cpath < 0 {
            cpath = -cpath
        }
        if spath > cpath {
            return true
        }
        else {
            return false
        }
    }
    func isLessThan(cl:CircleLocation) -> Bool {
        if cost < cl.cost {
            return true
        }
        else {
            return false
        }
    }
    func isInCircle() -> Int {
        //遍历这周围的点，看看他们是否是墙或者是圈内点（它的值是负数，但大于－100.
        
        let allConnects = self.getAllLocation()
        var num = 0;
        for var i = 0; i < allConnects.count; i++ {
            if allConnects[i].path >= 100 {
                num++
            }
        }
        
        if (num == 6) {
            return 1;
        }
        else {
            return 0;
        }
    }
}