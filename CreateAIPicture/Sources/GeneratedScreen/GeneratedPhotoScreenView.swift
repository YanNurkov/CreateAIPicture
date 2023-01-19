//
//  GeneratedPhotoScreenView.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 16.01.2023.
//

import UIKit

class GeneratedPhotoScreenView: UIView {
    
    // MARK: PROPERTIES -
    
    private weak var generatedPhotoViewController: GeneratedPhotoViewController?
    
    lazy var generatedImage: UIImageView = {
        let obj = UIImageView()
        obj.contentMode = .scaleAspectFill
        obj.layer.cornerRadius = 25
        obj.clipsToBounds = true
        return obj
    }()
    
    lazy var saveImageButton: CustomButton = {
        let obj = CustomButton()
        obj.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        obj.setTitle(" Save", for: .normal)
        obj.addTarget(self, action: #selector(saveImage), for: .touchUpInside)
        return obj
    }()
    
}

// MARK: EXTENSIONS -

private extension GeneratedPhotoScreenView {
    
    // MARK: FUNCTIONS -
    
    func configView() {
        backgroundColor = .black
        addSubview(generatedImage)
        addSubview(saveImageButton)
    }
    
    func makeConstraints() {
        self.generatedImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(Constant.left)
            make.right.equalToSuperview().offset(Constant.right)
            make.height.equalTo(400)
            make.center.equalToSuperview()
        }
        self.saveImageButton.snp.makeConstraints { make in
            make.top.equalTo(generatedImage.snp.bottom).offset(Constant.top)
            make.width.equalTo(Constant.widthButton)
            make.height.equalTo(Constant.heightButton)
            make.centerX.equalToSuperview()
        }
    }
}

extension GeneratedPhotoScreenView {
    
    // MARK: FUNCTIONS -
    
    func didLoadUI(controller: GeneratedPhotoViewController) {
        self.generatedPhotoViewController = controller
        configView()
        makeConstraints()
        super.updateConstraints()
    }
    
    @objc func saveImage() {
        generatedPhotoViewController?.saveImage()
    }
}
