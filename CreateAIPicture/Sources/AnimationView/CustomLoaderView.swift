//
//  CustomLoaderView.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 18.01.2023.
//

import UIKit
import Lottie
import SnapKit

class CustomLoaderView: UIView {
    
    // MARK: PROPERTIES -
    
    let loaderView: LottieAnimationView = {
        let obj = LottieAnimationView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.animation = LottieAnimation.named("loader")
        obj.loopMode = .loop
        return obj
    }()
    
    let loaderLabel: UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.textColor = .black
        obj.font = .systemFont(ofSize: 15, weight: .semibold)
        obj.textAlignment = .center
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
        backgroundColor = .white
        addSubview(loaderLabel)
        addSubview(loaderView)
    }
    
    func makeConstraints() {
        self.loaderView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        self.loaderLabel.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.top.equalTo(loaderView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    func showLoader() {
        self.isHidden = false
        loaderView.play()
    }
    
    func hideLoader(){
        self.isHidden = true
        loaderView.stop()
    }
}
