//
//  SIzeEntityView.swift
//  testApp2
//
//  Created by Алексей Патрушев on 23.03.2025.
//

import Foundation
import UIKit

protocol SizeEntityViewDelegate: AnyObject {
    
    func didSelectSize(with size: String)
    
}

class SizeEntityView: UIView {
    // MARK: - Variables
    weak var delegate: SizeEntityViewDelegate?
    
    private var size: String?
    // MARK: - UIElements
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 17
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
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
    func bind(size: String, isSelected: Bool) {
        label.text = size
        self.size = size
        
        containerView.backgroundColor = isSelected ? Resources.FigmaColors.sizeEntitySelectColor : Resources.FigmaColors.sizeEntityColor
        
        label.textColor = isSelected ? Resources.FigmaColors.whiteColor : Resources.FigmaColors.blackLabelColor
    }
    
    // MARK: - Actions
    
    @objc private func didTap() {
        guard let size else { return }
        delegate?.didSelectSize(with: size)
    }
}

extension SizeEntityView {
    
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
