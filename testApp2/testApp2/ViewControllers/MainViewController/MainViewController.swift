//
//  MainViewController.swift
//  testApp2
//
//  Created by Алексей Патрушев on 18.03.2025.
//

import Foundation
import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - UIElements
    
    private lazy var button: UIButton = {
        let but = UIButton()
        but.setTitle("НА 2 ЭКРАН", for: .normal)
        but.backgroundColor = .systemBrown
        but.layer.cornerRadius = 10
        return but
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    // MARK: - Methods
    
    @objc private func buttonTapped() {
        let viewController = ProductViewController()
        viewController.modalPresentationStyle = .pageSheet
        present(viewController, animated: true)
    }
}

extension MainViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(150)
        }
        
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
}
