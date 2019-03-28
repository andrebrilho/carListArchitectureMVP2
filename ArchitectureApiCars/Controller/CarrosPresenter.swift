//
//  fetchCars.swift
//  ArchitectureApiCars
//
//  Created by André Brilho on 05/03/19.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import Foundation

protocol CarsProtocol {
    func getCars()
    var viewControllerReference:updatingViewFromApiProtocol? {get set}
}

class CarrosPresenter:CarsProtocol {
    
    var carros:[Carro] = []
    
    var viewControllerReference:updatingViewFromApiProtocol?
    
    func getCars() {
        ApiCarros.fetchCars { (result) in
            switch result {
            case let .Success(result):
                self.viewControllerReference?.listCars = ((result?.carro)!)
            case let .Error(error):
                print("Error")
            }
        }
    }
}
