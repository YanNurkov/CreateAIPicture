//
//  SceneDelegate.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 16.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if Reachability.isConnectedToNetwork() == true {
            print("good internet")
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let apiKey = Constant.apiKey
            OpenAIWrapper.getInstance().createConfiguration(apiKey: apiKey)
            let openAIWrapperInstance = OpenAIWrapper.getInstance()
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            UIBarButtonItem.appearance().tintColor = .white
            let vc = UINavigationController(rootViewController: SearchScreenViewController(_openAIWrapper: openAIWrapperInstance))
            self.window?.rootViewController = vc
            window?.overrideUserInterfaceStyle = .dark
            window?.makeKeyAndVisible()
        } else {
            print("error internet")
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            UIBarButtonItem.appearance().tintColor = .white
            let vc = UINavigationController(rootViewController: CheckingInternetViewController(buttonIsHidden: true))
            self.window?.rootViewController = vc
            window?.overrideUserInterfaceStyle = .dark
            window?.makeKeyAndVisible()
        }
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        if Reachability.isConnectedToNetwork() == true {
            print("good internet")
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let apiKey = Constant.apiKey
            OpenAIWrapper.getInstance().createConfiguration(apiKey: apiKey)
            let openAIWrapperInstance = OpenAIWrapper.getInstance()
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            UIBarButtonItem.appearance().tintColor = .white
            let vc = UINavigationController(rootViewController: SearchScreenViewController(_openAIWrapper: openAIWrapperInstance))
            self.window?.rootViewController = vc
            window?.overrideUserInterfaceStyle = .dark
            window?.makeKeyAndVisible()
        } else {
            print("error internet")
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            UIBarButtonItem.appearance().tintColor = .white
            let vc = UINavigationController(rootViewController: CheckingInternetViewController(buttonIsHidden: true))
            self.window?.rootViewController = vc
            window?.overrideUserInterfaceStyle = .dark
            window?.makeKeyAndVisible()
        }
    }
}
