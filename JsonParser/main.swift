//
//  main.swift
//  JsonParser
//
//  Created by admin on 08.05.16.
//  Copyright © 2016 Stepan. All rights reserved.
//

import Foundation

let filePath = Process.arguments[1]
let fileManager = NSFileManager()

guard filePath.hasSuffix(".json") == true
    else {
        print ("\ncrashed1 \(Process.arguments)")
        exit(0)
}

guard let file = fileManager.contentsAtPath(filePath)
    else {
        print ("crashed2")
        exit(0)
}
let weekSchedule = ScheduleJsonContainer(data: file)

print (weekSchedule.allLessons["8"]!.Lessons["1"]!)
