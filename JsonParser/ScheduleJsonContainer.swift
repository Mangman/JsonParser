//
//  ScheduleJsonContainer.swift
//  JsonParser
//
//  Created by admin on 08.05.16.
//  Copyright © 2016 Stepan. All rights reserved.
//

import Foundation
import MapKit

class ScheduleJsonContainer /*:CustomStringConvertible*/ {
    
    var allLessons = [NSString: LessonsForClass]() //Class, lessons by date for a particular class
    
    init (data: NSData) {
        parse(data)
    }
    
    func parse(data: NSData){
        
        guard let json = try? NSJSONSerialization.JSONObjectWithData (data, options: []) as? [NSString: AnyObject]
            else {
                print ("\njsonerror\n")
                return
        }
       
        //print ("HERE COMES JSON\n \(json)\n")
        
        // citiesFromDataStore = CityDataStore (cities: citiesFrom.map (readCity))
        // cant understand Mikhails code...
        
        
        guard let unwrappedJson = json
            else {
            return
        }
        for (ClassName, value) in unwrappedJson {
            if let lessonsFromJson = value as? [NSString: [NSInteger]] {
                allLessons[ClassName] = LessonsForClass (data: lessonsFromJson)
            }
            else {
                print ("aw shit")
                exit(0)
            }
        }
        
    }
}