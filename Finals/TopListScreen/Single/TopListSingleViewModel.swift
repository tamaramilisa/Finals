//
//  TopListSingleViewModel.swift
//  Finals
//
//  Created by tamara on 08/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import Alamofire

enum TopListSingleSectionModel {
    case TopListSingleSection(lists: Array<String>)
}


extension TopListSingleSectionModel: SectionModelType {
    typealias Item = String
    
    var items: [Item] {
        switch  self {
        case .TopListSingleSection(let lists):
            return lists
        }
    }
    
    init(original: TopListSingleSectionModel, items: [Item]) {
        self = original
    }
}

class TopListSingleViewModel: BaseViewModel {
    
    var navigationService: NavigationService!
    var networking: AlamofireNetworking!
    var realmManager = RealmManager()
    
    let bag = DisposeBag()
    
    required init() {
        setTopListSingleVariable()
    }
    
    var topListSingleVariable = Variable<[TopListSingleSectionModel]>([])
    
    func setTopListSingleVariable() {
        
        var lists: [String] = []
        
        lists = ["Tamara", "Tami"]
        
        let listsModels = [TopListSingleSectionModel.TopListSingleSection(lists: lists)]
        
        topListSingleVariable.value = listsModels
        
    }
}
