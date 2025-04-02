//
//  ClothesTypeEntityView.swift
//  testApp2
//
//  Created by Алексей Патрушев on 03.04.2025.
//

import Foundation
import UIKit
import SnapKit

protocol ClothesTypeEntityViewDelegate: AnyObject {
    
    func typeDidSelected(with type: String)
}

class ClothesTypeEntityView: UIView {
    // MARK: - Variables
    private var type: String?
    
    weak var delegate: ClothesTypeEntityViewDelegate?
    
    // MARK: - UIElements
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 17
        view.backgroundColor = .gray
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "HUI"
        return label
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func bindTypeEntityView(type: String, isSelected: Bool) {
        label.text = type
        self.type = type
        
        containerView.backgroundColor = isSelected ? Resources.FigmaColors.typeEntitySelectColor : Resources.FigmaColors.typeEntityColor
        label.textColor = isSelected ? Resources.FigmaColors.whiteColor : Resources.FigmaColors.blackLabelColor
    }
    
    // MARK: - Actions
    @objc func didTap() {

        guard let type else { return }
        delegate?.typeDidSelected(with: type)
    }
}

extension ClothesTypeEntityView {
    
    func setupUI() {
        
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(34)
        }
        
        containerView.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18)
            make.top.bottom.equalToSuperview().inset(8.5)
        }
    }
}

