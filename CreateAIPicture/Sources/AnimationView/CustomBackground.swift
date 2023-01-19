//
//  CustomBackground.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 18.01.2023.
//

import Foundation
import UIKit
import Lottie
import SnapKit

class CustomBackground: UIView {
    
    // MARK: PROPERTIES -
    
    let backgroundView: LottieAnimationView = {
        let obj = LottieAnimationView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.animation = LottieAnimation.named("background")
        obj.loopMode = .loop
        return obj
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews() {
        backgroundColor = .black
        addSubview(backgroundView)
    }
    
    func makeConstraints() {
        self.backgroundView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    func showLoader() {
        self.isHidden = false
        backgroundView.play()
    }
    
    func hideLoader(){
        self.isHidden = true
        backgroundView.stop()
    }
}
