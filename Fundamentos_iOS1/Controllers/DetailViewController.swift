//
//  DetailViewController.swift
//  Fundamentos_iOS1
//
//  Created by jose manuel carreiro galicia on 08/12/20.
//

import Foundation

import UIKit

//protocol DetailViewDelegate {

class DetailViewController: UIViewController {
    
    var heroe: Heroe? = nil
    var villain: Villain? = nil
    
    //MARK:- IBOutlets
    @IBOutlet var imageBio: UIImageView?
    @IBOutlet var powerBio: UILabel?
    @IBOutlet var descBio: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if heroe != nil {
            title =  heroe?.name
            imageBio?.image = UIImage(named: heroe?.image ?? "")
            powerBio?.text = heroe?.power
            descBio?.text = heroe?.bio
        } else {
            title = villain?.name
            imageBio?.image = UIImage(named: villain?.image ?? "")
            powerBio?.text = villain?.power
            descBio?.text = villain?.bio
        }
    }
}
