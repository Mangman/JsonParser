//
//  main.swift
//  JsonParser
//
//  Created by admin on 08.05.16.
//  Copyright © 2016 Stepan. All rights reserved.
//

import Foundation

guard Process.arguments.count == 3
    else {
        print("parameter error")
        exit(0)
}

let filePathForScheduleFile = Process.arguments[1]
let filePathForLessonsFile = Process.arguments[2]

let fileManager = NSFileManager()

guard filePathForScheduleFile.hasSuffix(".json") == true
    else {
        print ("\ncrashed1 \(Process.arguments)")
        exit(0)
}

guard filePathForLessonsFile.hasSuffix(".json") == true
    else {
        print ("\ncrashed2 \(Process.arguments)")
        exit(0)
}

guard let scheduleFile = fileManager.contentsAtPath (filePathForScheduleFile)
    else {
        print ("\ncrashed3")
        exit(0)
}

guard let lessonsFile = fileManager.contentsAtPath (filePathForLessonsFile)
    else {
        print ("\ncrashed4")
        exit(0)
}

guard let weekSchedule = ScheduleJsonContainer (data: scheduleFile).lessons?.Lessons
    else {
        print ("\ncrashed5")
        exit(0)
}

let lessonArray = lessonDataJsonContainer (data: lessonsFile).lessons


//HERE
guard let lesson = lessonArray[weekSchedule["1"]![0]]
    else {
        print ("\ncrashed6")
        exit (0)
    }

print ("\nlesson -> \(lesson.name), \(lesson.room), \(lesson.homeTaskId), \(lesson.teacherId)\n")

