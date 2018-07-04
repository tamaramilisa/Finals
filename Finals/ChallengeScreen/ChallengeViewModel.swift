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


struct ChallengeSectionModel {
    
    var levels: [RMLevel]
    var id: String
    
    init(levels: [RMLevel], id: String) {
        self.levels = levels
        self.id = id
    }
}


extension ChallengeSectionModel: SectionModelType {
    typealias Item = RMLevel
    typealias Identity = String
    
    var identity: String {
        return id
    }
    
    var items: [Item] {
        return levels
    }
    
    init(original: ChallengeSectionModel, items: [Item]) {
        self = ChallengeSectionModel(levels: items, id: original.id)
    }
}

extension RMLevel: IdentifiableType {
    typealias Identity = String
    
    var identity: String {
        return id.description
    }
}

func == (lhs: RMLevel, rhs: RMLevel) -> Bool {
    return (lhs.id == rhs.id)
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
        
        let level1 = RMLevel(id: 1, name: "Lako", isLocked: false)
        let level2 = RMLevel(id: 2, name: "Srednje", isLocked: true)
        let level3 = RMLevel(id: 3, name: "Teško", isLocked: true)
        
        var feedModels: [ChallengeSectionModel] = []
        feedModels.append(ChallengeSectionModel(levels: [level1, level2, level3], id: "Categories"))
        
        self.challengeVariable.value = feedModels
        
    }
}
