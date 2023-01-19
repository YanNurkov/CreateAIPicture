//
//  AppDelegate.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 16.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var orientationLock = UIInterfaceOrientationMask.portrait
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
}
