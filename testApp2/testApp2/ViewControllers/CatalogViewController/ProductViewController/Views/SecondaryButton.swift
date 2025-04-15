//
//  InfoButton.swift
//  testApp2
//
//  Created by Алексей Патрушев on 22.03.2025.
//

import Foundation
import UIKit

class SecondaryButton: UIButton {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()

        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        addSubview(image)
        image.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func configureButton(image: UIImage? = nil, title: String? = nil, textColor: UIColor? = nil, font: UIFont? = nil) {
        self.image.image = image
        label.text = title
        label.textColor = textColor
        label.font = font
    }
}
