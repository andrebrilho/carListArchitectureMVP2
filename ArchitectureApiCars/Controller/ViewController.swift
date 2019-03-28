//
//  ViewController.swift
//  ArchitectureApiCars
//
//  Created by André Brilho on 20/02/2019.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import UIKit

protocol updatingViewFromApiProtocol {
    var listCars:[Carro] {get set}
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, updatingViewFromApiProtocol {
    
    var carrosProtocol:CarsProtocol = CarrosPresenter()
    var listCars: [Carro] = []{
        didSet{
            tbl.reloadData()
        }
    }
    
    @IBOutlet weak var tbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.register(UINib(nibName: "CarTableViewCell", bundle: nil), forCellReuseIdentifier: "CarTableViewCell")
        carrosProtocol.viewControllerReference = self
        carrosProtocol.getCars()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tbl.dequeueReusableCell(withIdentifier: "CarTableViewCell", for: indexPath) as? CarTableViewCell{
            cell.carro = listCars[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}

