//
//  StringExtention.swift
//
//  Created by Jace on 29/03/17.
//  Copyright © 2017年 Darma. All rights reserved.
//

import Foundation

extension String {
    func characterAtIndex(index: Int) -> Character? {
        var i = 0
        for char in characters {
            if i == index {
                return char
            }
            i += 1
        }
        return nil
    }
}
