//
//  LearnSinglePresenter.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class LearnSinglePresenter: BasePresenter {
    
    private struct LearnSingleStatic {
        static var title: String { get { return "Učenje" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: LearnSingleViewController! {
        return baseViewController as! LearnSingleViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = LearnSingleStatic.title
        
        viewController.titleLabel.text = viewController.titlee
        
        viewController.contentTextView.text = "Geografija je znanost koja proučava prostornu stvarnost Zemljine površine. Naziv potječe iz klasične starine, a upućuje na prvotno značenje geografije, pa je prema tome nastala i riječ zemljopis. Najprihvatljivija definicija geografije bila bi da je to znanost koja proučava međuovisnost utjecaja prirodnih i društvenih procesa, uzročno objašnjavajući i niz pojava na Zemlji. Geografija tada nije bila znanost s određenim objektom i ciljem proučavanja, već neka vrsta opće enciklopedije o Zemlji. Riječ geografija prvi je skovao Eratosten oko 200 pr. Kr. kako bi označio opisno učenje o Zemlji. Uz filozofiju i povijest, geografija pripada među najstarije znanosti ljudske civilizacije. Ona se za objašnjavanje geografskog prostora koristi metodama prirodnih i društvenih znanosti. S obzirom na raznoznačnost geoprostora, geografija je kao znanost vrlo kompleksna. To je jedina dualna ili mosna znanost, koja povezuje prirodne i društvene znanosti. Naziva se i svjetskom disciplinom. Geografija je, dakle, sintetička znanost, koja spaja mnoga dostignuća brojnih znanosti radi objašnjavanja geografskog prostora. Ona pripada u skupinu prirodnih znanosti jer joj je osnovno polazište u prirodnim značajkama geoprostora."
        
    }
    
}
