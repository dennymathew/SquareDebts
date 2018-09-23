//
//  Logger.swift
//  ErudyteDevelopment
//
//  Created by Denny Mathew on 17/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import Foundation

class Logger {
    
    //Date Formatter
    private static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    //Time Stamp
    private static var timeStamp: String {
        return Logger.dateFormatter.string(from: Date())
    }
    
    //Extract Filename
    private static func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
    //Custom Log
    public static func log(_ message: String, fileName: String = #file, line: Int = #line, funcName: String = #function) {
        #if DEVELOPMENT || MOCK || STAGING
        print("""
            \n-------------------------------
            Time    | \(Logger.timeStamp)
            File    | \(sourceFileName(filePath: fileName))
            Line    | \(line)
            Method  | \(funcName)
            Message | \(message)
            -------------------------------\n
            """)
        #endif
    }
}
