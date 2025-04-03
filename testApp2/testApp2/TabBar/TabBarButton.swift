//
//  TabBarButton.swift
//  testApp2
//
//  Created by Алексей Патрушев on 02.04.2025.
//

import Foundation
import UIKit

class TabBarButton: UIButton {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var btnStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        stack.isUserInteractionEnabled = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        addSubview(btnStack)
        btnStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        btnStack.addArrangedSubview(image)
        image.snp.makeConstraints { make in
            make.height.width.equalTo(24)
        }
        
        btnStack.addArrangedSubview(label)
    }
    
    func configure(with image: UIImage?, title: String) {
        self.image.image = image
        self.label.text = title
    }
    
    
}

