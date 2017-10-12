//
//  StringExtention.swift
//
//  Created by Jace on 29/03/17.
//  Copyright © 2017年 Darma. All rights reserved.
//

import Foundation

extension String {
    // MARK: - 根据索引值获取字符串中特定的字母
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
    
    // MARK: - MD5加密
    // Don't forget to add #import <CommonCrypto/CommonCrypto.h> to the ObjC-Swift bridging header that Xcode creates.
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize()
        
        return String(format: hash as String)
    }
    
    // MARK: - 邮箱有效性验证
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    // 数字正则表达式
    func numberRegExp() -> Bool {
        if self.characters.count == 0 {
            return false
        }
        
        do {
            let regex = "[0-9]"
            let regular = try NSRegularExpression(pattern: regex, options:.caseInsensitive)
            let results = regular.matches(in: self, options: .reportProgress , range: NSMakeRange(0, self.characters.count))
            return results.count == self.characters.count
        }
        catch {
            print(error.localizedDescription)
        }
        return false
    }
    
    // 中文正则表达式
    func chineseRegExp() -> Bool {
        if self.characters.count == 0 {
            return false
        }
        
        for (_, value) in self.characters.enumerated() {
            if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
                return true
            }
        }
        return false
    }
    
    //根据开始位置和长度截取字符串
    func subString(start:Int, length:Int = -1) -> String {
        var len = length
        if len == -1 {
            len = characters.count - start
        }
        let st = characters.index(startIndex, offsetBy:start)
        let en = characters.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
}
