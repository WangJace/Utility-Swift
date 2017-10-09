//
//  RegExp.swift
//
//  Created by Jace on 21/09/16.
//  Copyright © 2016年 Darma. All rights reserved.
//

import UIKit

// 正则表达式

// 数字正则表达式
func numberRegExp(_ str: String) -> Bool {
    if str.characters.count == 0 {
        return false
    }
    
    do {
        let regex = "[0-9]"
        let regular = try NSRegularExpression(pattern: regex, options:.caseInsensitive)
        let results = regular.matches(in: str, options: .reportProgress , range: NSMakeRange(0, str.characters.count))
        return results.count == str.characters.count
    }
    catch {
        print(error.localizedDescription)
    }
    return false
}
