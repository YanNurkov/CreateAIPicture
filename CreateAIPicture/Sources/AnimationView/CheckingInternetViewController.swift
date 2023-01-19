//
//  CheckingInternetViewController.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 19.01.2023.
//

import UIKit
import Lottie

class CheckingInternetViewController: UIViewController {
    
    // MARK: PROPERTIES -
    
    let loaderView: LottieAnimationView = {
        let obj = LottieAnimationView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.animation = LottieAnimation.named("internet")
        obj.loopMode = .loop
        return obj
    }()
    
    let loaderLabel: UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.textColor = .black
        obj.font = .systemFont(ofSize: 15, weight: .semibold)
        obj.text = "No Connection"
        obj.textAlignment = .center
        return obj
    }()
    
    lazy var getReturnBatton: CustomButton = {
        let obj = CustomButton()
        obj.setTitle("Try again", for: .normal)
        obj.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return obj
    }()
    
    // MARK: MAIN -
    
    override func viewDidLoad() {
        setUpViews()
        makeConstraints()
        loaderView.play()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector:#selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loaderView.play()
    }
    
    init(buttonIsHidden: Bool) {
        super.init(nibName: nil, bundle: nil)
        if buttonIsHidden == true {
            self.buttonIsHidden()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews() {
        view.backgroundColor = .white
        view.addSubview(loaderLabel)
        view.addSubview(loaderView)
        view.addSubview(getReturnBatton)
    }
    
    func makeConstraints() {
        self.loaderView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(200)
        }
        
        self.loaderLabel.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.top.equalTo(loaderView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        self.getReturnBatton.snp.makeConstraints { make in
            make.top.equalTo(loaderLabel.snp.bottom).offset(Constant.top)
            make.width.equalTo(Constant.widthButton)
            make.height.equalTo(Constant.heightButton)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func appMovedToForeground() {
        print("App moved to foreground!")
        loaderView.play()
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func buttonIsHidden() {
        getReturnBatton.isHidden = true
    }
}
