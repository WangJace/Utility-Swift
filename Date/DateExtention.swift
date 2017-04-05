//
//  DateExtention.swift
//
//  Created by Jace on 03/01/17.
//  Copyright © 2017年 Darma. All rights reserved.
//

import Foundation

// MARK: - 月份枚举，其中getMonthStr是根据不同的月份返回相应的月份简写字符串
enum Month_En:Int {
    case Jan = 1, Feb = 2, Mar = 3, Apr = 4, May = 5, Jun = 6, Jul = 7, Aug = 8, Sept = 9, Oct = 10, Nov = 11, Dec = 12
    func getMonthStr() -> String{
        switch self {
        case .Jan:
            return "Jan"
        case .Feb:
            return "Feb"
        case .Mar:
            return "Mar"
        case .Apr:
            return "Apr"
        case .May:
            return "May"
        case .Jun:
            return "Jun"
        case .Jul:
            return "Jul"
        case .Aug:
            return "Aug"
        case .Sept:
            return "Sept"
        case .Oct:
            return "Oct"
        case .Nov:
            return "Nov"
        case .Dec:
            return "Dec"
        }
    }
}

// MARK: - 星期枚举，其中getWeekdayAbbreviationStr是根据不同天返回相应的星期简写字符串，而getWeekdayFullStr是返回当天相应的星期字符串
enum Weekday_En:Int {
    case Sun = 1, Mon = 2, Tue = 3, Wed = 4, Thurs = 5, Fri = 6, Sat = 7
    func getWeekdayAbbreviationStr() -> String {
        switch self {
        case .Sun:
            return "Sun"
        case .Mon:
            return "Mon"
        case .Tue:
            return "Tue"
        case .Wed:
            return "Wed"
        case .Thurs:
            return "Thurs"
        case .Fri:
            return "Fri"
        case .Sat:
            return "Sat"
        }
    }
    
    func getWeekdayFullStr() -> String {
        switch self {
        case .Sun:
            return "Sunday"
        case .Mon:
            return "Monday"
        case .Tue:
            return "Tuesday"
        case .Wed:
            return "Wednesday"
        case .Thurs:
            return "Thunsday"
        case .Fri:
            return "Friday"
        case .Sat:
            return "Saturday"
        }
    }
}

extension Date {
    // 判断两天是否为同一天
    func isSameDay(temp: Date) -> Bool {
        let calendar = NSCalendar.current
        let components1 = calendar.dateComponents([.year, .month, .day], from: self)
        let components2 = calendar.dateComponents([.year, .month, .day], from: temp)
        if components1.year == components2.year && components1.month == components2.month && components1.day == components2.day {
            return true
        }
        return false
    }
    
    func getDateStartTime() -> Date {
        let calendar = NSCalendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.hour = 0
        components.minute = 0
        components.second = 0
        return calendar.date(from: components)!
    }
    
    func getDateEndTime() -> Date {
        let calendar = NSCalendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.hour = 23
        components.minute = 59
        components.second = 59
        return calendar.date(from: components)!
    }
    
    // 获取星期值
    func getWeekday() -> Int {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.weekday], from: self)
        return components.weekday!
    }
    
    // 获取年月日中的日
    func getDay() -> Int {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day], from: self)
        return components.day!
    }
    
    // 获取年月日中的月
    func getMonth() -> Int {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.month], from: self)
        return components.month!
    }
    
    // 获取年月日中的年
    func getYear() -> Int {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year], from: self)
        return components.year!
    }
    
    // 获取小时
    func getHour() -> Int {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.hour], from: self)
        return components.hour!
    }
    
    // 获取分钟
    func getMinute() -> Int {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.minute], from: self)
        return components.minute!
    }
    
    // 获取秒
    func getSecond() -> Int {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.second], from: self)
        return components.second!
    }
}
