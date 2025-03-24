//
//  InfoButton.swift
//  testApp2
//
//  Created by Алексей Патрушев on 22.03.2025.
//

import Foundation
import UIKit

class InfoButton: UIButton {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Images.infoButtonImage
        return image
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
    
    }
    
}
