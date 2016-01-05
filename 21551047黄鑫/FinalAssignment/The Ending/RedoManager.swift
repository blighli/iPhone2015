//
//  RedoManager.swift
//  The Ending
//
//  Created by Xin on 25/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class RedoManager<T> : NSObject {
    var redoStack: [T]! = [T]()
    var undoStack: [T]! = [T]()
    var numberOfLevel = 100
    
    func push(elem: T) {
        undoStack.append(elem)
    }
    
    func undo(elem: T) -> T? {
        if undoStack.isEmpty { return nil }
        if redoStack.count >= numberOfLevel {
            redoStack.removeFirst()
        }
        redoStack.append(elem)
        let res = undoStack.last
        undoStack.removeLast()
        return res
    }
    
    func redo(elem: T) -> T? {
        if redoStack.isEmpty { return nil }
        if undoStack.count >= numberOfLevel {
            undoStack.removeFirst()
        }
        undoStack.append(elem)
        let res = redoStack.last
        redoStack.removeLast()
        return res
    }
}
