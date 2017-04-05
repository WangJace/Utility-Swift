//
//  UIImageExtention.swift
//
//  Created by Jace on 04/01/17.
//  Copyright © 2017年 Darma. All rights reserved.
//

import UIKit

extension UIImage {
    // MARK: - 根据提供的CGRect给图片新增一个颜色层
    func imageWithTintColor(_ tintColor: UIColor, _ bounds: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(x:0, y:0, width:size.width, height: size.height))
        let context = UIGraphicsGetCurrentContext()
        context?.setBlendMode(.sourceIn)
        context?.setFillColor(tintColor.cgColor)
        context?.fill(bounds)
        
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
}
