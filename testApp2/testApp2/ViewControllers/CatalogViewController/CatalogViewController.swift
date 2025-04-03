//
//  MainViewController.swift
//  testApp2
//
//  Created by Алексей Патрушев on 18.03.2025.
//

import Foundation
import UIKit
import SnapKit

class CatalogViewController: UIViewController {
    
    private let typeOfClothes = ["Каталог", "Новинки","Джинсы", "Футболки"]
    
    // MARK: - UIElements
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.dropShadow(offset: CGSizeMake(0, 3))
        return view
    }()
    
    private lazy var sizeScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private lazy var sizeContentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindCatalogViewController(type: typeOfClothes, isSelected: typeOfClothes[0])
    }
    
    // MARK: - Methods
    func bindCatalogViewController(type: [String], isSelected: String?) {
        sizeContentStack.subviews.forEach { $0.removeFromSuperview() }
        sizeContentStack.subviews.forEach { sizeContentStack.removeArrangedSubview($0) }
        
        for type in typeOfClothes {
            let view = ClothesTypeEntityView()
            view.delegate = self
            view.bindTypeEntityView(type: type, isSelected: isSelected == type)
            sizeContentStack.addArrangedSubview(view)
        }
    }
}

extension CatalogViewController: ClothesTypeEntityViewDelegate {
    func typeDidSelected(with type: String) {
        bindCatalogViewController(type: typeOfClothes, isSelected: type)
    }
}

extension CatalogViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(58)
        }
        //add sizeScroll
        containerView.addSubview(sizeScrollView)
        sizeScrollView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            make.leading.trailing.equalToSuperview()
        }
        
        sizeScrollView.addSubview(sizeContentStack)
        sizeContentStack.snp.makeConstraints { make in
            make.edges.equalTo(sizeScrollView.contentLayoutGuide)
            make.height.equalTo(sizeScrollView.snp.height)
        }
    }
}
