//
//  CustomButton.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 20.01.2023.
//

import Foundation
import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    func setupButton() {
        setTitleColor(.white, for: .selected)
        backgroundColor = .red
        tintColor = .white
        layer.cornerRadius = 25
        tapFeedback()
    }
}
