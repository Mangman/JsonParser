//
//  lessonDataJsonContainer.swift
//  JsonParser
//
//  Created by admin on 09.05.16.
//  Copyright © 2016 Stepan. All rights reserved.
//



// NOT TESTED YET

import Foundation

class lessonDataJsonContainer {

    var lessons = [NSInteger: Lesson]() //Id, lesson
    
    init (data: NSData) {
        parse(data)
        print ("\nLessonDataJsonContainer: parsing succeeded")
    }
    
    func parse (data: NSData){
        
        // citiesFromDataStore = CityDataStore (cities: citiesFrom.map (readCity))
        // cant understand Mikhails code...
        
        guard let json = try? NSJSONSerialization.JSONObjectWithData (data, options: []) as? [AnyObject]
            else {
                print ("\nLessonDataJsonContainer: jsonerror\n")
                exit(0)
        }
        
        //print ("HERE COMES JSON\n \(json)\n")
        
        guard let unwrappedJson = json
            else {
                print("broken json")
                exit(0)
        }
        
        for id in 0..<unwrappedJson.count  {
            lessons[id] = readLesson(unwrappedJson[id])
        }
        
    }
    
    private func readLesson (lesson: AnyObject) -> Lesson {
        
        //var result = Lesson()
        
        guard let unwrappedLesson = lesson as? [NSString: AnyObject]
            else {
            print ("lesson unwraping issue\n")
            exit(0)
        }
        
        let name = unwrappedLesson["name"] as? NSString ?? ""
        let room = unwrappedLesson["room"] as? NSString ?? ""
        let teacherId = unwrappedLesson["teacherId"] as? NSInteger ?? -1
        let hometaskId = unwrappedLesson["teacherId"] as? NSInteger ?? -1
        
        let result = Lesson (name: name, room: room,  homeTaskId: hometaskId, teacherId: teacherId)
        
        return result
    }
    
}
