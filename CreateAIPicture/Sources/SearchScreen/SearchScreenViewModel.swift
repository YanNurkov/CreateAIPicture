//
//  SearchScreenViewModel.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 18.01.2023.
//

import Foundation

class SearchScreenViewModel {
    
    var openAIWrapper: OpenAIWrapper?
    
    func getGenerateImage(text: String, complition: @escaping(ImageModelResponse) -> Void) {
        openAIWrapper?.getNetworking().generateImageWithText(text: text) { response in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                complition(response)
            }
        }
    }
}
