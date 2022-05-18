//
//  String+Utils.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import Foundation


extension String {
    func isEmail() -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: self)
    }
    
    func toDateString() -> String {
        // Data entry - date from "dd/MM/yyyy" to Date
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")  // universal date pattern
        formatter.dateFormat = "dd/MM/yyyy"
        
        let dateFormatted = formatter.date(from: self)
        
        guard let dateFormatted = dateFormatted else {
            print("🌱 dateFormatted: \(String(describing: dateFormatted))")
            return ""
        }

        
        // convert Date into "yyyy-MM-dd"
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: dateFormatted)
        return dateString
    }
    
    
    
}
