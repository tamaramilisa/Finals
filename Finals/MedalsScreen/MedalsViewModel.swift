//
//  MedalsViewModel.swift
//  Finals
//
//  Created by tamara on 01/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import Alamofire

enum MedalsSectionModel {
    case AllMedalsSection(lists: Array<String>)
    case BasicMedalsSection(lists: Array<String>)
    case FlagsMedalsSection(lists: Array<String>)
    case EuropeMedalsSection(lists: Array<String>)
    case CroMedalsSection(lists: Array<String>)
}


extension MedalsSectionModel: SectionModelType {
    typealias Item = String
    
    var items: [Item] {
        switch  self {
        case .AllMedalsSection(let lists):
            return lists
        case .BasicMedalsSection(let lists):
            return lists
        case .FlagsMedalsSection(let lists):
            return lists
        case .EuropeMedalsSection(let lists):
            return lists
        case .CroMedalsSection(let lists):
            return lists
        }
    }
    
    init(original: MedalsSectionModel, items: [Item]) {
        self = original
    }
}

class MedalsViewModel: BaseViewModel {
    
    var navigationService: NavigationService!
    var networking: AlamofireNetworking!
    var realmManager = RealmManager()
    
    let bag = DisposeBag()
    
    required init() {
        setMedalsVariable()
    }
    
    var medalsVariable = Variable<[MedalsSectionModel]>([])
    
    func setMedalsVariable() {
        
        var allMedals: [String] = []
        var basicMedals: [String] = []
        
        allMedals = ["trophy-singIn", "star", "3-stars", "Question-marks", "boxWithFireworks", "5 stars"]
        
        basicMedals = ["goldMedal", "silverMedal", "bronzeMedal"]
        
        let medalsModels = [MedalsSectionModel.AllMedalsSection(lists: allMedals), MedalsSectionModel.BasicMedalsSection(lists: basicMedals), MedalsSectionModel.FlagsMedalsSection(lists: basicMedals), MedalsSectionModel.EuropeMedalsSection(lists: basicMedals), MedalsSectionModel.CroMedalsSection(lists: basicMedals)]
        
        medalsVariable.value = medalsModels
        
    }
}
