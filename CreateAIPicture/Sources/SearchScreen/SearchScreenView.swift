//
//  SearchScreenView.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 16.01.2023.
//

import UIKit
import SnapKit

class SearchScreenView: UIView {
    private weak var searchScreenViewController: SearchScreenViewController?
    var openAIWrapper: OpenAIWrapper?
    let viewModel = SearchScreenViewModel()
    
    // MARK: PROPERTIES -
    
    lazy var customeViewImage: CustomBackground = {
        let obj = CustomBackground()
        obj.contentMode = .scaleAspectFill
        obj.isHidden = false
        return obj
    }()
    
    lazy var searchText: UITextField = {
        let obj = UITextField()
        obj.backgroundColor = .white
        obj.textAlignment = .center
        obj.textColor = .black
        obj.attributedPlaceholder = NSAttributedString(
            string: "Enter your request",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        obj.layer.cornerRadius = 25
        obj.delegate = searchScreenViewController
        return obj
    }()
    
    lazy var searchButton: CustomButton = {
        let obj = CustomButton()
        obj.setTitle("Search", for: .normal)
        obj.addTarget(self, action: #selector(generationPhoto), for: .touchUpInside)
        obj.alpha = 0.3
        obj.isEnabled = false
        return obj
    }()
    
    let loaderView: CustomLoaderView = {
        let obj = CustomLoaderView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.loaderLabel.text = "Generating Image..."
        obj.isHidden = true
        return obj
    }()
}

// MARK: EXTENSIONS -

private extension SearchScreenView {
    
    // MARK: FUNCTIONS -
    
    func configView() {
        backgroundColor = .black
        addSubview(customeViewImage)
        addSubview(searchText)
        addSubview(searchButton)
        addSubview(loaderView)
    }
    
    func makeConstraints() {
        self.customeViewImage.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        self.searchText.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(Constant.left)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.right.equalTo(searchButton.snp.left).offset(-6)
        }
        
        self.searchButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(Constant.right)
            make.width.equalTo(Constant.widthButton)
            make.height.equalTo(Constant.heightButton)
            make.top.equalTo(searchText)
        }
        
        self.loaderView.snp.makeConstraints { make in
            make.right.left.top.bottom.equalToSuperview()
        }
    }
}

extension SearchScreenView {
    func didLoadUI(controller: SearchScreenViewController) {
        self.searchScreenViewController = controller
        configView()
        makeConstraints()
        super.updateConstraints()
    }
    
    @objc func generationPhoto() {
        searchScreenViewController?.generationPhoto()
    }
}
