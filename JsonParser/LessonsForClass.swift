//
//  LessonsForClass.swift
//  JsonParser
//
//  Created by admin on 09.05.16.
//  Copyright © 2016 Stepan. All rights reserved.
//

import Foundation

class LessonsForClass {
    var Lessons = [NSString: [NSInteger]]() //data : lessonId
    
    init (data: NSDictionary?) {
        guard let dict = data as? [NSString: [NSInteger]]
            else {
            print("LessonsForClass: init error")
            exit(0)
        }
        Lessons = dict
    }
}
