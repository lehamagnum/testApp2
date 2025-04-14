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
    
    var data: [TestModel] = []
    
    // MARK: - UIElements
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.dropShadow(offset: CGSizeMake(0, 3))
        return view
    }()
    
    private lazy var clothesScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return scroll
    }()
    
    private lazy var clothesContentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        return table
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        registerCell()
        setupTableView()
        registerCells()
        bindCatalogViewController(type: typeOfClothes, isSelected: typeOfClothes[0])
        
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let JSONdata):

                self.data = JSONdata
                print("\(JSONdata)")
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Methods
    func bindCatalogViewController(type: [String], isSelected: String?) {
        clothesContentStack.subviews.forEach { $0.removeFromSuperview() }
        clothesContentStack.subviews.forEach { clothesContentStack.removeArrangedSubview($0) }
        
        for type in typeOfClothes {
            let view = ClothesTypeEntityView()
            view.delegate = self
            view.bindTypeEntityView(type: type, isSelected: isSelected == type)
            clothesContentStack.addArrangedSubview(view)
        }
    }
}

extension CatalogViewController: ClothesTypeEntityViewDelegate {
    func typeDidSelected(with type: String) {
        bindCatalogViewController(type: typeOfClothes, isSelected: type)
    }
}

extension CatalogViewController {
    
    private func registerCell() {
        tableView.register(CatalogProductCell.self, forCellReuseIdentifier: CatalogProductCell.cellId)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func registerCells() {
        tableView.register(CatalogProductCell.self, forCellReuseIdentifier: CatalogProductCell.cellId)
    }

    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(58)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(58)
        }
        //add sizeScroll
        containerView.addSubview(clothesScrollView)
        clothesScrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(12)
        }
        
        clothesScrollView.addSubview(clothesContentStack)
        clothesContentStack.snp.makeConstraints { make in
            make.edges.equalTo(clothesScrollView.contentLayoutGuide)
            make.height.equalTo(clothesScrollView.snp.height)
        }
    }
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogProductCell.cellId, for: indexPath) as? CatalogProductCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.delegate = self
        
        let data = self.data[indexPath.row]
        
        cell.configureCell(title: data.title,
                           description: data.body,
                           btnTextColor: Resources.FigmaColors.secondaryButtonTitleBrown,
                           btnFont: UIFont.systemFont(ofSize: 15, weight: .semibold))
        
        return cell
    }
}

extension CatalogViewController: CatalogProductCellDelegate {
    
    func didTapButton(productId: String) {
        let viewController = ProductViewController(productId: productId)
        viewController.productId = productId
        present(viewController, animated: true)
    }
}
