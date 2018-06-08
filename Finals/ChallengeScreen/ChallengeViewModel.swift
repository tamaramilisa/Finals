//
//  ChallengeViewModel.swift
//  Finals
//
//  Created by tamara on 07/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import Alamofire

enum ChallengeSectionModel {
    case ChallengeSection(lists: Array<String>)
}


extension ChallengeSectionModel: SectionModelType {
    typealias Item = String
    
    var items: [Item] {
        switch  self {
        case .ChallengeSection(let lists):
            return lists
        }
    }
    
    init(original: ChallengeSectionModel, items: [Item]) {
        self = original
    }
}

class ChallengeViewModel: BaseViewModel {
    
    var navigationService: NavigationService!
    var networking: AlamofireNetworking!
    var realmManager = RealmManager()
    
    let bag = DisposeBag()
    
    required init() {
        setChallengeVariable()
    }
    
    var challengeVariable = Variable<[ChallengeSectionModel]>([])
    
    func setChallengeVariable() {
        
        var lists: [String] = []
        
        lists = ["Lako","Srednje", "Teško"]
        
        let challengeModels = [ChallengeSectionModel.ChallengeSection(lists: lists)]
        
        challengeVariable.value = challengeModels
        
    }
}
