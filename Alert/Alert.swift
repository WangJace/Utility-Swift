//
//  Alert.swift
//
//  Created by Jace on 01/11/16.
//  Copyright © 2016年 Darma. All rights reserved.
//

import UIKit

// MARK: - 根据提供的字符串弹出提示框(此提示框只有一个按钮)
func showAlert(title: String, msg: String, confirmTitle: String, confirmAction: ((_ sender:UIAlertAction) -> Void)?) -> UIAlertController {
    let alert = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)
    alert.addAction(UIAlertAction.init(title: confirmTitle, style: .default, handler: { (sender:UIAlertAction) in
        if confirmAction != nil {
            confirmAction!(sender)
        }
    }))
    return alert
}
