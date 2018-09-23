//
//  DateHandler.swift
//  Erudyte
//
//  Created by Denny Mathew on 18/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

class DateHandler {
    
    static func convertToServerFormat(_ dateString: String?) -> String {
        
        let clientFormatter = DateFormatter()
        clientFormatter.dateStyle = .medium
        clientFormatter.timeStyle = .none
        
        guard let dateString = dateString, let date = clientFormatter.date(from: dateString) else {
            return ""
        }
        
        let serverFormatter = DateFormatter()
        serverFormatter.dateFormat = "yyyy-MM-dd"
        return serverFormatter.string(from: date)
    }
    
    static func formattedTime(from timeString: String?) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let timeString = timeString,
            let date = formatter.date(from: timeString) else {
                return ""
        }
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm a"
        let time = timeFormatter.string(from: date)
        return time
    }

    static func dateFromString(_ string: String?) -> Date? {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        guard let string = string,
            let date = formatter.date(from: string) else {
            return nil
        }

        return date
    }
    
    static func formattedTime(from date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm a"
        let time = timeFormatter.string(from: date)
        return time
    }

    static func simpleDateFromString(_ string: String?) -> Date? {

        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"

        guard let string = string,
            let date = formatter.date(from: string) else {
            return nil
        }

        return date
    }

    static func latest(date1: Date, date2: Date) -> (Date, Int) {
        if date1.timeIntervalSince(date2) > 0 {
            return (date1, 0)
        } else {
            return (date2, 1)
        }
    }
}
