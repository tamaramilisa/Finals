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
        
        let category1 = RMCategory(id: 1, name: "Opće znanje", desc: "Geografija je znanost koja proučava prostornu stvarnost Zemljine površine. Naziv potječe iz klasične starine, a upućuje na prvotno značenje geografije, pa je prema tome nastala i riječ zemljopis. Najprihvatljivija definicija geografije bila bi da je to znanost koja proučava međuovisnost utjecaja prirodnih i društvenih procesa, uzročno objašnjavajući i niz pojava na Zemlji. Geografija tada nije bila znanost s određenim objektom i ciljem proučavanja, već neka vrsta opće enciklopedije o Zemlji. Riječ geografija prvi je skovao Eratosten oko 200 pr. Kr. kako bi označio opisno učenje o Zemlji. Uz filozofiju i povijest, geografija pripada među najstarije znanosti ljudske civilizacije. Ona se za objašnjavanje geografskog prostora koristi metodama prirodnih i društvenih znanosti. S obzirom na raznoznačnost geoprostora, geografija je kao znanost vrlo kompleksna. To je jedina dualna ili mosna znanost, koja povezuje prirodne i društvene znanosti. Naziva se i svjetskom disciplinom. Geografija je, dakle, sintetička znanost, koja spaja mnoga dostignuća brojnih znanosti radi objašnjavanja geografskog prostora. Ona pripada u skupinu prirodnih znanosti jer joj je osnovno polazište u prirodnim značajkama geoprostora.")
        let category2 = RMCategory(id: 2, name: "Zastave", desc: "Zastava, stijeg ili barjak (turcizam) simbol je neovisnosti zemlje i državne pripadnosti. Svaka država ima svoju zastavu, a svaka zastava svoju povijest. Slavne ratne zastave, koje su prošle kroz mnoge bojeve, čuvaju se u povijesnim i vojnim muzejima. Pojedine pokrajine, gradovi, vojne jedinice, organizacije, društva, ustanove i sl. mogu imati svoje zastave. Zastava je najčešće komad jednobojne ili višebojne tkanine, katkad i s ukrasnim znakovima. Pričvršćuje se na uspravan stijeg (motku ili koplje). U svečanim vojnim i drugim povorkama zastave nose stjegonoše. Malene zastavice u određenim bojama upotrebljavaju se u vojsci, pomorstvu, športu itd. Zastave su nastale još u starom vijeku. Tada vojnici nisu imali posebnih uniformi. U bojnoj vrevi nije bilo lako prepoznati svoje vojnike od neprijateljskih. Tada su se vojnici počeli skupljati oko svojih zastava, a one su im pokazivale i smjer kretanja vojske.")
        let category3 = RMCategory(id: 3, name: "Europa", desc: "Europa je zapadni dio Euroazije. Izdvajanje Europe od Azije potječe još od antičkog doba. Stari Grci razlikovali su Europu kao kopno zapadno od morskih prolaza Bospor i Dardaneli i Aziju kao kopno istočno od tih prolaza. U kasnijim stoljećima došlo je do spoznaje da su Europa i Azija široko povezane i da neke izrazite prirodne granice na kopnu nema. Ipak, zbog tradicije, ali i zbog povijesnih i kulturnih razlika sačuvala se podjela na Europu i Aziju. Možemo zaključiti da je u tradicionalnoj podjeli Europe i Azije granica dogovorena. Kopnena granica Europe i Azije polazi od Jugorskog poluotoka na sjeveru, prolazi gorjem Uralom i nastavlja rijekom Ural do Kaspijskoga jezera. Između Kaspijskoga jezera i Crnoga mora prolazi Kavkazom. Na moru granica prolazi kroz morske prolaze Bospor i Dardanele. Površina tradicionalno omeđene Europe približno iznosi 10,1 milijuna četvornih kilometara. Svakako treba uočiti da se tradicionalna granica Europe i političke granice, odnosno granice pojednih država ne poklapaju. Jasno je da iz tradicionalne podjele Europe i Azije slijedi da su Rusija, Kazahstan i Turska istodobno i europske i azijske zemlje. Europa je zapadni dio Euroazije i zasebni kontinent. Granice kontinenta određuje gorje i rijeka Ural, Kaspijsko jezero i Kavkaz na istoku, Atlantski ocean na zapadu, Sredozemno more, Crno more i Gibraltarski tjesnac na jugu te Sjeverno ledeno more na sjeveru. Proteže se od 9° 30' zapadne zemljopisne dužine do 68° 5' istočne zemljopisne dužine i od 71° 11' sjeverne zemljopisne širine. do 36° sjeverne zemljopisne širine. Ukupan broj država u Europi je 44, a nekoliko države spada u Euroazijske države: Kazahstan, Ruska Federacija, Turska, Azerbajdžan i Turkmenistan. Europu neki nazivaju 'potkontinentom', jer smatraju da zajedno s Azijom čini kontinent Euroaziju. Činjenica je da je Europa više kulturni")
        let category4 = RMCategory(id: 4, name: "Hrvatska", desc: "Hrvatska (službeni naziv: Republika Hrvatska) je europska država, u geopolitičkom smislu srednjoeuropska i sredozemna država, a zemljopisno smještena u južnom dijelu Srednje Europe te u sjevernom dijelu Sredozemlja.[3] Na sjeveru graniči sa Slovenijom i Mađarskom, na istoku sa Srbijom i Bosnom i Hercegovinom, na jugu s Crnom Gorom, dok na zapadu s Italijom ima morsku granicu. Kopnena površina iznosi 56.578 km², a površina obalnog mora 31.067 km² što Hrvatsku svrstava među srednje velike europske zemlje. Glavni grad je Zagreb, koji je političko, kulturno, znanstveno i gospodarsko središte Republike Hrvatske. Tijekom hrvatske povijesti najznačajniji kulturološki utjecaji dolazili su iz srednjoeuropskog i sredozemnog kulturnog kruga. Temelji hrvatske države nalaze se u razdoblju ranog srednjeg vijeka kada su Hrvati osnovali svoje dvije kneževine, Panonsku i Primorsku Hrvatsku. Potom, pod vladarskom dinastijom Trpimirović Hrvatska postaje jedinstvena kneževina, a 7. lipnja 876. godine za vrijeme vladavine kneza Branimira po prvi puta i nezavisna država. Godine 925. pod vodstvom kralja Tomislava Hrvatska postaje kraljevina. Posljednji hrvatski kralj bio je Petar Snačić, a nakon njega Hrvatska stupa u personalnu uniju s Ugarskom na temelju ugovora poznatog kao Pacta conventa sklopljenog 1102. godine. Tim je ugovorom Hrvatska zadržala sve značajke države, jedino je kralj bio zajednički. Godine 1527., uslijed Osmanlijskog napada na Hrvatsku, na hrvatsko prijestolje dolazi dinastija Habsburg. Kroz cijelo vrijeme Habsburške vladavine, Hrvatska je također zadržala sve državnopravne značajke što se najviše ogleda kroz Pragmatičku sankciju iz 1712. godine te Hrvatsko-ugarsku nagodbu iz 1868. godine. Pri kraju Prvoga svjetskog rata, godine 1918. Hrvatska raskida veze s Austro-Ugarskom te sudjeluje u osnivanju Države SHS. Nedugo zatim, Hrvatska je (u sklopu Države SHS) uključena u Kraljevstvo SHS (kasnije Kraljevina Jugoslavija), iako Hrvatski sabor tu odluku nije nikada ratificirao. Nakon Drugoga svjetskog rata, godine 1945. režim srpskog kralja zamijenio je komunistički režim. U tom vremenu, Hrvatska je bila socijalistička republika i kao federalna jedinica tvorila SFR Jugoslaviju. Godine 1990. provedeni su prvi demokratski višestranački izbori nakon 45 godina jednostranačkog sustava, a 30. svibnja iste godine konstituiran je demokratski izabrani višestranački državni sabor u Hrvatskoj. Dana 25. lipnja 1991. godine, Republika Hrvatska je ustavnom odlukom državnog sabora postala samostalna i nezavisna država. U Hrvatskoj se službeno koristi hrvatski jezik i latinično pismo.")
        
        var feedModels: [CategoriesSectionModel] = []
        feedModels.append(CategoriesSectionModel(categories: [category1, category2, category3, category4], id: "Categories"))
            
        self.categoriesVariable.value = feedModels
    }
    
}

