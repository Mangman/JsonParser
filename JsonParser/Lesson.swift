
//
//  lesson.swift
//  JsonParser
//
//  Created by admin on 09.05.16.
//  Copyright © 2016 Stepan. All rights reserved.
//

import Foundation

class Lesson {
    private(set) var name : NSString
    private(set) var room: NSString
    
    private(set) var homeTaskId: NSInteger
    private(set) var teacherId: NSInteger
    
    init (name: NSString, room: NSString, homeTaskId: NSInteger, teacherId: NSInteger) {
        self.name = name
        self.room = room
        self.homeTaskId = homeTaskId
        self.teacherId = teacherId
    }
}

