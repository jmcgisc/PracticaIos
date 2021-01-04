//
//  VillianCollectionCellView.swift
//  Fundamentos_iOS1
//
//  Created by jose manuel carreiro galicia on 11/12/20.
//

import UIKit

class VillianCollectionCellView: UICollectionViewCell{
    
    @IBOutlet var cellView: UIView?
    @IBOutlet var villianImage: UIImageView?
    @IBOutlet var bottomView: UIView?
    @IBOutlet var name: UILabel?
    @IBOutlet var power: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView?.layer.cornerRadius = 8.0
        cellView?.layer.shadowColor = UIColor.blue.cgColor
        cellView?.layer.shadowOffset = CGSize.zero
        cellView?.layer.shadowOpacity = 0.7
        cellView?.layer.shadowRadius = 4.0
        
        villianImage?.layer.cornerRadius = 4.0
        bottomView?.layer.cornerRadius = 4.0
        // Aplicamos el corner radius solo a la esquina
        // inferior izquierda y la esquina inferior derecha
        bottomView?.layer.maskedCorners = [.layerMinXMaxYCorner,
                                           .layerMaxXMaxYCorner]
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        villianImage?.image = nil
        name?.text = nil
        power?.text = nil
    }
    
    func configureViews(villain: Villain){
        villianImage?.image = UIImage(named:
                                        villain.image ?? "")
        name?.text = villain.name
        power?.text = villain.power
    }
}
