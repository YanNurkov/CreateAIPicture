//
//  SearchScreenViewController.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 16.01.2023.
//

import UIKit

class SearchScreenViewController: UIViewController {
    
    private let searchScreenView = SearchScreenView()
    private let viewModel = SearchScreenViewModel()
    var openAIWrapper: OpenAIWrapper?
    
    // MARK: MAIN -
    
    override func loadView() {
        super.loadView()
        view = searchScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchScreenView.didLoadUI(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchScreenView.customeViewImage.showLoader()
    }
    
    init(_openAIWrapper: OpenAIWrapper?) {
        super.init(nibName: nil, bundle: nil)
        self.openAIWrapper = _openAIWrapper
        self.viewModel.openAIWrapper = _openAIWrapper
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func generationPhoto() {
        if Reachability.isConnectedToNetwork() == true {
            if searchScreenView.searchText.text != "" {
                let text = searchScreenView.searchText.text ?? ""
                searchScreenView.searchText.endEditing(true)
                searchScreenView.customeViewImage.hideLoader()
                searchScreenView.loaderView.showLoader()
                viewModel.getGenerateImage(text: text) { response in
                    self.searchScreenView.loaderView.hideLoader()
                    self.resetToDefault()
                    if response.error == nil {
                        let vc = GeneratedPhotoViewController()
                        vc.imageURL = response.data?.first?.url ?? ""
                        self.navigationController?.pushViewController(vc, animated: true)
                    } else {
                        let message = response.error?.message ?? ""
                        let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(ac, animated: true, completion: nil)
                    }
                }
            }
        } else {
            let vc = CheckingInternetViewController(buttonIsHidden: false)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func resetToDefault() {
        searchScreenView.searchText.text = ""
        searchScreenView.searchButton.alpha = 0.5
        searchScreenView.searchButton.isEnabled = false
    }
}

// MARK: EXTENSION -

extension SearchScreenViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if searchScreenView.searchText.text == "" {
            searchScreenView.searchButton.alpha = 0.5
            searchScreenView.searchButton.isEnabled = false
        } else {
            searchScreenView.searchButton.alpha = 1
            searchScreenView.searchButton.isEnabled = true
        }
    }
}
