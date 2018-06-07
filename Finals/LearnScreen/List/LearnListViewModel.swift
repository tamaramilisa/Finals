//
//  LearnListViewModel.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxDataSources
import RxSwift
import Alamofire
import RealmSwift


struct CategoriesSectionModel {
    
    var categories: [RMCategory]
    var id: String
    
    init(categories: [RMCategory], id: String) {
        self.categories = categories
        self.id = id
    }
}

extension CategoriesSectionModel: AnimatableSectionModelType {
    typealias Item = RMCategory
    typealias Identity = String
    
    var identity: String {
        return id
    }
    
    var items: [Item] {
        return categories
    }
    
    init(original: CategoriesSectionModel, items: [Item]) {
        self = CategoriesSectionModel(categories: items, id: original.id)
    }
}


extension RMCategory: IdentifiableType {
    typealias Identity = String
    
    var identity: String {
        return id.description
    }
}

func == (lhs: RMCategory, rhs: RMCategory) -> Bool {
    return (lhs.id == rhs.id)
}

class LearnListViewModel: BaseViewModel {
    
    var navigationService: NavigationService!
    var networking: AlamofireNetworking!
    var realmManager = RealmManager()
    
    var categoriesVariable = Variable<[CategoriesSectionModel]>([])
    var meVariable = Variable<RMUser?>(nil)
    
    let bag = DisposeBag()
    
    required init() {
        setCategoriesVariable()
    }
    
    func setCategoriesVariable() {
        
        let category1 = RMCategory(id: 1, name: "Opće znanje")
        let category2 = RMCategory(id: 2, name: "Zastave")
        let category3 = RMCategory(id: 3, name: "Europa")
        let category4 = RMCategory(id: 4, name: "Hrvatska")
        
        var feedModels: [CategoriesSectionModel] = []
        feedModels.append(CategoriesSectionModel(categories: [category1, category2, category3, category4], id: "Categories"))
            
        self.categoriesVariable.value = feedModels
    }
    
}

