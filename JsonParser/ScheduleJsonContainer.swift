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
    
    var lessons : LessonsForClass? //Class, lessons by date for a particular class
    
    init (data: NSData) {
        parse(data)
        
        print ("\nScheduleJsonContainer: parsing succeeded")

    }
    
    func parse(data: NSData){
        
        guard let json = try? NSJSONSerialization.JSONObjectWithData (data, options: []) as? [NSString: [NSInteger]]
            else {
                print ("\nScheduleJsonContaier: jsonerror\n")
                return
        }
       
        print ("HERE COMES JSON\n \(json)\n")
        
        lessons = LessonsForClass (data: json)
        
    }
    
    
}