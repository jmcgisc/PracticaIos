//
//  HeroCellView.swift
//  Fundamentos_iOS1
//
//  Created by jose manuel carreiro galicia on 8/12/20.
//

import UIKit

class HeroeCellView: UITableViewCell {
    @IBOutlet var cellView: UIView?
    @IBOutlet var heroeImage: UIImageView?
    @IBOutlet var name: UILabel?
    @IBOutlet var power: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        cellView?.layer.cornerRadius = 8.0
        cellView?.layer.shadowColor = UIColor.blue.cgColor
        cellView?.layer.shadowOffset = CGSize.zero
        cellView?.layer.shadowOpacity = 0.7
        cellView?.layer.shadowRadius = 4.0
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        heroeImage?.image = nil
        name?.text = nil
        power?.text = nil
    }
    
    //Actualiza la vista.
    func configureViews(heroe: Heroe){
        heroeImage?.image = UIImage(named: heroe.image ?? "")
        name?.text = heroe.name
        power?.text = heroe.power
        
    }
}
