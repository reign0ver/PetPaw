//
//  Date+Extensions.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 11/08/24.
//

import Foundation

/// Used to calculate the age from birthday date to now.
/// It returns the date in a DateComponents format.
/// For this case it is returning the year, month and day.
extension Date {
    var age: DateComponents {
        let calendar = Calendar.gregorian
        let age = calendar.dateComponents([.year, .month, .day], from: self, to: .now)
        return age
    }
    
    /// Random date used in previews and mocked data.
    /// Do not use in production.
    static var someRandomPastDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.date(from: "2016/10/08 22:31") ?? now
    }
}

extension Calendar {
    /// Always use this extension to do any operation with dates.
    static var gregorian: Calendar {
        return Calendar(identifier: .gregorian)
    }
}
