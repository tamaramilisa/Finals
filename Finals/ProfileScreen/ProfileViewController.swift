//
//  ProfileViewController.swift
//  Finals
//
//  Created by tamara on 30/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import NVActivityIndicatorView
import RxDataSources
import MobileCoreServices

class ProfileViewController: BaseViewController {
    
    var viewModel: ProfileViewModel! {
        return baseViewModel as! ProfileViewModel
    }
    var presenter: ProfilePresenter! {
        return basePresenter as! ProfilePresenter
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    let bag = DisposeBag()
    let pickerController = UIImagePickerController()
    
    var fromWelcome: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
        
        pickerController.delegate = self
        
        setupRx()
    }
    
    func setupRx() {
        
        let tapRecognizer = UITapGestureRecognizer()
        profileImageView.addGestureRecognizer(tapRecognizer)
        tapRecognizer.rx.event.asDriver().drive(onNext: { [weak self] (sender) in
            
            self?.showModalAlert()
        }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
        logoutButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            guard let `self` = self else { return }
            
            self.viewModel.navigationService.pushToLoginScreen(navigationController: self.navigationController, registration: true, animated: false)
        }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
    }

    func showModalAlert() {
        let alertController = UIAlertController(title: "Promijeni sliku", message: nil, preferredStyle: .actionSheet)
        
        let choosePhotoButton = UIAlertAction(title: "Izaberi sliku", style: .default) { [weak self] (action) in
            guard let `self` = self else { return }
            
            self.pickerController.sourceType = .photoLibrary
            self.present(self.pickerController, animated: true, completion: nil)
        }
        let takePhotoButton = UIAlertAction(title: "Slikaj", style: .default) { [weak self] (action) in
            guard let `self` = self else { return }
            
            self.pickerController.sourceType = .camera
            self.pickerController.showsCameraControls = true
            self.pickerController.cameraDevice = .front
            self.present(self.pickerController, animated: true, completion: nil)
        }
        let cancelButton = UIAlertAction(title: "Odustani", style: .cancel) { (action) in
            
        }
        
        alertController.addAction(choosePhotoButton)
        alertController.addAction(takePhotoButton)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let mediaType = info[UIImagePickerControllerMediaType] as? String else {
            return
        }
        
        if mediaType == kUTTypeImage as String {
            guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
                return
            }
            presenter.configureHeader(image: image)
//            viewModel.uploadPhoto(image: image)
        }
    }
    
    
}
