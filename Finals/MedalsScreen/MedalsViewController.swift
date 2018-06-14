//
//  MedalsViewController.swift
//  Finals
//
//  Created by tamara on 01/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD
import RxDataSources
import EssentialPod

class MedalsViewController: BaseViewController {
    
    var viewModel: MedalsViewModel! {
        return baseViewModel as! MedalsViewModel
    }
    var presenter: MedalsPresenter! {
        return basePresenter as! MedalsPresenter
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let bag = DisposeBag()
//    var dataSource: RxTableViewSectionedAnimatedDataSource<MedalsSectionModel>!
//    var user: RMUser?
    
    var fromWelcome: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
        
        setupRx()
    }
    
    func setupRx() {
        tableView.registerWithNib(AllMedalsCell.self)
        tableView.registerWithNib(TypeMedalsCell.self)
        
        let dataSource = RxTableViewSectionedReloadDataSource<MedalsSectionModel>(configureCell: { [weak self] (dataSrc, tv, idxPath, item) in
            guard let `self` = self else { return UITableViewCell() }
            
            switch dataSrc[idxPath.section] {
            case .AllMedalsSection(let images):
                let cell: AllMedalsCell = tv.dequeueReusableCell()
                return self.presenter.configureAllMedalsCell(cell: cell, item: images)
            case .BasicMedalsSection(let basics):
                let cell: TypeMedalsCell = tv.dequeueReusableCell()
                return self.presenter.configureTypeMedalsCell(cell: cell, item: basics)
            case .FlagsMedalsSection(let flags):
                let cell: TypeMedalsCell = tv.dequeueReusableCell()
                return self.presenter.configureTypeMedalsCell(cell: cell, item: flags)
            case .EuropeMedalsSection(let europe):
                let cell: TypeMedalsCell = tv.dequeueReusableCell()
                return self.presenter.configureTypeMedalsCell(cell: cell, item: europe)
            case .CroMedalsSection(let cro):
                let cell: TypeMedalsCell = tv.dequeueReusableCell()
                return self.presenter.configureTypeMedalsCell(cell: cell, item: cro)
            }
        })
        
        viewModel.medalsVariable.asObservable().bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: bag)
        
        tableView.rx.itemSelected.subscribe( onNext: { [weak self] (indexPath) in
            guard let `self` = self else { return }
            
        }).disposed(by: bag)
        
    }
    
    func addTapRecognizer(imageView: UIImageView, medalNo: String) {
        
        let tapRecognizer = UITapGestureRecognizer()
        imageView.addGestureRecognizer(tapRecognizer)
        tapRecognizer.rx.event.asDriver().drive(onNext: { [weak self] (sender) in
            guard let `self` = self else { return }
            
            self.showMedalPopover(sourceView: self.view, medalNo: medalNo)
        }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
    }
    
    func showMedalPopover(sourceView: UIView, medalNo: String) {
        
        let vc : MedalsPopoverViewController = storyboard!.instantiateViewController()
        let screenWidth = Int(UIScreen.main.bounds.width)
        let height = 295
        vc.preferredContentSize = CGSize(width: screenWidth-80, height: height)
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        popover.sourceView = sourceView
        popover.sourceRect = sourceView.bounds
        popover.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        popover.delegate = self
        
        vc.medalNo = medalNo
        
        present(vc, animated: true, completion: nil)
        
    }
    
}

extension MedalsViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}
