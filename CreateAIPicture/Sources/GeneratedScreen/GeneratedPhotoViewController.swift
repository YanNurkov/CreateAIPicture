//
//  GeneratedPhotoViewController.swift
//  CreateAIPicture
//
//  Created by Ян Нурков on 16.01.2023.
//

import UIKit
import SDWebImage

class GeneratedPhotoViewController: UIViewController {
    
    // MARK: PROPERTIES -
    
    private let generatedPhotoScreenView = GeneratedPhotoScreenView()
    var imageURL: String? {
        didSet {
            guard let imageURL = imageURL else {
                return
            }
            if let url = URL(string: imageURL) {
                print(url)
                generatedPhotoScreenView.generatedImage.sd_setImage(with: URL(string: imageURL))
            }
        }
    }
    
    // MARK: MAIN -
    
    override func loadView() {
        super.loadView()
        view = generatedPhotoScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatedPhotoScreenView.didLoadUI(controller: self)
    }
    
    // MARK: FUNCTIONS -
    
    func saveImage() {
        guard let image = generatedPhotoScreenView.generatedImage.image else { return }
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if error == nil {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        } else {
            let ac = UIAlertController(title: "Save error", message: error?.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }
    }
}
