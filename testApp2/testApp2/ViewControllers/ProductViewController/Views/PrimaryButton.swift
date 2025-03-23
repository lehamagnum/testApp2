//
//  PrimaryButton.swift
//  testApp2
//
//  Created by Алексей Патрушев on 20.03.2025.
//

import Foundation
import UIKit

class PrimaryButton: UIButton {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "В корзину 4 950 Р"
        label.textAlignment = .center
        label.textColor = Resources.FigmaColors.buyButtonTextColor
        label.font = UIFont(name: "SFProText-Semibold", size: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configureUI() {
        
        backgroundColor = Resources.FigmaColors.buyButtonColor
        layer.cornerRadius = 10
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        

        
    }
    
}
