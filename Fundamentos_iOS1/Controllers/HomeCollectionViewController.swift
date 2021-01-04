//
//  HomeCollectionViewController.swift
//  Fundamentos_iOS1
//
//  Created by jose manuel carreiro galicia on 11/12/20.
//

import UIKit

class HomeCollectionViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView?
    
    private let villianRepository = VillianRepository()
    private var villians : Villains = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Villanos"
        
        loadData()
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as?
                DetailViewController,
              let data = sender as? Villain else{
            return
        }
        destination.villain = data
    }
}

extension HomeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return villians.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 8, height: 160.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VillianCollectionCellView", for: indexPath) as? VillianCollectionCellView
        
        if (indexPath.row < villians.count){ 
            cell?.configureViews(villain: villians[indexPath.row])
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(indexPath.row < villians.count){
            performSegue(withIdentifier: "SEGUE_FROM_COLLECTION_TO_DETAIL",
                         sender:villians[indexPath.row])
        }
    }
    
    // MARK: - Private functions
    private func loadData() {
        villians = villianRepository.villianData
    }
}
