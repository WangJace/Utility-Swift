//
//  Utility.swift
//
//  Created by Jace on 21/09/16.
//  Copyright © 2016年 Darma. All rights reserved.
//

import UIKit
import SystemConfiguration

// MARK: - ScreenBounds
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
let iPhone6Height: CGFloat = 667.0
let kScreenPercent = kScreenHeight/iPhone6Height

// MARK: - UIColor
func rgba(_ red:CGFloat, _ green:CGFloat, _ blue:CGFloat, _ alpha:CGFloat) -> UIColor {
    return UIColor(red: red/255.0, green: green/255.0, blue:blue/255.0, alpha:alpha)
}

func RGBA(_ red:CGFloat, _ green:CGFloat, _ blue:CGFloat, _ alpha:CGFloat) -> UIColor {
    return UIColor(red: red, green: green, blue:blue, alpha:alpha)
}

// MARK: - AppVersion
let infoDictionary: Dictionary = Bundle.main.infoDictionary!
let appVersion = infoDictionary["CFBundleShortVersionString"]
let appBuildVersion = infoDictionary["CFBundleVersion"]

// MARK: - UIAlertView
func alert(title: String, _ message: String) -> UIAlertController {
    let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
    let confirmAction = UIAlertAction.init(title: NSLocalizedString("OK", comment: "OK"), style: .default, handler: nil)
    alert.addAction(confirmAction)
    return alert
}

// MARK: - @synchronized
func synchronized(lock: AnyObject, closure: () -> ()) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}

// MARK: - Localizable
func localizable(_ str: String) -> String {
    return NSLocalizedString(str, comment: str)
}

// MARK: - NetworkState
func isInternetAvailable() -> Bool
{
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
            SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
        }
    }
    
    var flags = SCNetworkReachabilityFlags()
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
        return false
    }
    let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
    let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
    return (isReachable && !needsConnection)
}

let delaySecond:Double = 4
func delay(seconds: Double, completion: @escaping () -> ()) {
    let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
    
    DispatchQueue.main.asyncAfter(deadline: popTime) {
        completion()
    }
}
