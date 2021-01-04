//
//  HomeViewController.swift
//  Fundamentos_iOS1
//
//  Created by jose manuel carreiro galicia on 8/12/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView?
    
    // MARK: - Propiedades privadas 
    
    private let heroeRepository = HeroRepository()
    private var heroes: Heroes = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SuperHeroes"
        
        loadData()
        
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as?
                DetailViewController           ,
              let data = sender as? Heroe else{ 
            return
        }
        
        destination.heroe = data
    }
}

//TableView para Heroes
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    "HeroeCellView", for: indexPath) as? HeroeCellView
        
        if (indexPath.row < heroes.count){
            cell?.configureViews(heroe: heroes[indexPath.row])
        }
        
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Private functions
    private func loadData() {
        heroes = heroeRepository.heroeData
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < heroes.count){
            performSegue(withIdentifier: "SEGUE_FROM_TABLE_TO_DETAIL",
                         sender: heroes[indexPath.row])
        }
    }
}


