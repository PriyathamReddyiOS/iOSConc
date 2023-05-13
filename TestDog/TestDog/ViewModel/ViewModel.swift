//
//  ViewModel.swift
//  TestDog
//
//  Created by priyatham reddy on 11/3/22.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func didReceiveData(model2: [Model2], dogs: [String], welcome: Welcome)
}

class WelcomeViewModel {
    
    var welcome: Welcome?
    
    var dogs = [String]()
    var specifics = [String]()
    var dict: [Character : [String]]?
    var model2: [Model2]?
    
    weak var delegate: ViewModelDelegate?
    
    init(welcome: Welcome) {
        self.welcome = welcome
    }
    
    func fetchDogs() {
        Network.shared.fetchBreeds {[weak self] result in
            switch result {
            case .success(let welcome):
                self?.welcome = welcome
                let arr = welcome.message.map({    $0.key  })
                self?.dict = Dictionary(grouping: arr) { char in
                    return char.first!
                }
                
                self?.model2 = self?.dict?.map({ (key: Character, value: [String]) in
                    Model2(alpha: key, names: value)
                }).sorted(by: { $0.alpha < $1.alpha
                })
                
                self?.dogs = arr
                guard let model2 = self?.model2, let dogs = self?.dogs else { return }
                
                self?.delegate?.didReceiveData(model2: model2, dogs: dogs, welcome: welcome)
                
                
            case .failure(let error):
                print(error)
            }
        }
    }

    
}
