//
//  MainViewController.swift
//  testApp2
//
//  Created by Алексей Патрушев on 18.03.2025.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    private let button: UIButton = {
        let but = UIButton()
        but.setTitle("НА 2 ЭКРАН", for: .normal)
        but.backgroundColor = .systemBrown
        but.layer.cornerRadius = 10
        return but
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    @objc private func buttonTapped() {
        let viewController = ViewController()
        viewController.modalPresentationStyle = .pageSheet
        present(viewController, animated: true)
    }
    
    
}

extension MainViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            
            
            
        ])
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    

}
