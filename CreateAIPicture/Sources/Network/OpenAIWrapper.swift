//
//  OpenAIWrapper.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 18.01.2023.
//

import Foundation

public class OpenAIWrapper {
    
    private var networking: HttpRequestHelper?
    private static var sharedInstance: OpenAIWrapper!
    
    public static func getInstance() -> OpenAIWrapper {
        if sharedInstance == nil {
            sharedInstance = OpenAIWrapper()
        }
        return sharedInstance
    }
    
    public func createConfiguration(apiKey: String) {
        if apiKey.isEmpty {
            fatalError("Pass a valid api key for initialization.")
        }
        let configuration = OpenAIConfiguration(_apiKey: apiKey)
        let utility = HttpUtility()
        self.networking = HttpRequestHelper(_httpUtility: utility, _configuration: configuration)
    }
    
    func getNetworking() -> HttpRequestHelper {
        if networking == nil {
            fatalError("Create configuration before trying to access networking session object")
        }
        return networking!
    }
    
    func getAuthToken() -> String {
        if networking == nil {
            fatalError("Create configuration before trying to access networking session object")
        }
        return "\(networking?.configuration.getAuthToken ?? "")"
    }
}
