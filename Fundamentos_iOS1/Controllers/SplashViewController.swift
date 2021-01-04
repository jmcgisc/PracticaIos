//
//  AppDelegate.swift
//  Practica_iOS
//
//  Created by jose manuel carreiro galicia on 8/12/20.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let SEGUE_TO_HOME = "SEGUE_FROM_SPLASH_TO_HOME"
    
    @IBOutlet var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading.startAnimating()
        navigateNext()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: -FUNCIONES PRIVADAS
    private func navigateNext() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in 
            let storyboardHome = UIStoryboard(name:"Home",
                                              bundle: nil)
            if let destination = storyboardHome.instantiateInitialViewController() {
                self?.navigationController?.setViewControllers([destination], animated: true)
            }
        }
    }
}
