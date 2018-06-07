//
//  TopListViewModel.swift
//  Finals
//
//  Created by tamara on 06/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import Alamofire

enum TopListSectionModel {
    case TopListSection(lists: Array<String>)
}


extension TopListSectionModel: SectionModelType {
    typealias Item = String
    
    var items: [Item] {
        switch  self {
        case .TopListSection(let lists):
            return lists
        }
    }
    
    init(original: TopListSectionModel, items: [Item]) {
        self = original
    }
}

struct Lists {
    
    static var basic: String {
        get {
            return "Opće znanje"
        }
    }
    static var flags: String {
        get {
            return "Zastave"
        }
    }
    static var europe: String {
        get {
            return "Europa"
        }
    }
    static var cro: String {
        get {
            return "Hrvatska"
        }
    }
    static var all: String {
        get {
            return "Opća top lista"
        }
    }
}

class TopListViewModel: BaseViewModel {
    
    var navigationService: NavigationService!
    var networking: AlamofireNetworking!
    var realmManager = RealmManager()
    
    let bag = DisposeBag()
    
    required init() {
        setTopListVariable()
    }
    
    var topListVariable = Variable<[TopListSectionModel]>([])
    
    func setTopListVariable() {
        
        var lists: [String] = []
        
        lists = [Lists.basic, Lists.flags, Lists.europe, Lists.cro, Lists.all]

        let listsModels = [TopListSectionModel.TopListSection(lists: lists)]
        
        topListVariable.value = listsModels
        
    }
}
