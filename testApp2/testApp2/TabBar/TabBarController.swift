//
//  TabBarController.swift
//  testApp2
//
//  Created by Алексей Патрушев on 02.04.2025.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    private enum Tab: Int {
        case catalog = 0
        case basket = 1
    }
    
    //MARK: - UIElements
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.dropShadow(offset: CGSize(width: 0, height: -3))
        return view
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .white
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    private lazy var catalogButton: TabBarButton = {
        let btn = TabBarButton()
        btn.configure(with: Resources.Images.catalogIcon, title: "Каталог")
        let action = UIAction { [weak self] _ in
            self?.selectTab(.catalog)
        }
        btn.addAction(action, for: .primaryActionTriggered)
        return btn
    }()
    
    private lazy var basketButton: TabBarButton = {
        let btn = TabBarButton()
        btn.configure(with: Resources.Images.basketIcon, title: "Корзина")
        let action = UIAction { [weak self] _ in
            self?.selectTab(.basket)
        }
        btn.addAction(action, for: .primaryActionTriggered)
        return btn
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        selectTab(.catalog)
    }
    
    // MARK: - Methods
    
    private func selectTab(_ tab: Tab) {
        selectedIndex = tab.rawValue
        updateTabAppearance(catalogButton, isSelected: tab == .catalog)
        updateTabAppearance(basketButton, isSelected: tab == .basket)
    }
    
    private func updateTabAppearance(_ button: TabBarButton, isSelected: Bool) {
        button.alpha = isSelected ? Resources.Alpha.activeAlpha : Resources.Alpha.inactiveAlpha
        button.tintColor = isSelected ? Resources.FigmaColors.blackLabelColor : Resources.FigmaColors.grayLabelColor
        }
}

extension TabBarController {
    
    private func setupUI() {
        // set and configure VC
        tabBar.isHidden = true
        
        let catalogVC = UINavigationController(rootViewController: CatalogViewController())
        let basketVC = UINavigationController(rootViewController: BasketViewController())
        
        setViewControllers([catalogVC, basketVC], animated: true)
        
        //add UIelements and constraints
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(64)
        }
        
        contentView.addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(10)
        }
        
        contentStack.addArrangedSubview(UIView())
        
        contentStack.addArrangedSubview(catalogButton)
        catalogButton.snp.makeConstraints { make in
            make.height.equalToSuperview()
            
        }
        contentStack.addArrangedSubview(basketButton)
        basketButton.snp.makeConstraints { make in
            make.height.equalToSuperview()
        }
        
        contentStack.addArrangedSubview(UIView())
    }
}

