//
//  OpenAIConfiguration.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 18.01.2023.
//

import Foundation

public struct OpenAIConfiguration {
    
    public var apiKey: String
    
    public init(_apiKey: String) {
        self.apiKey = _apiKey
    }
    
    var getAuthToken: String {
        return "Bearer \(apiKey)"
    }
}
