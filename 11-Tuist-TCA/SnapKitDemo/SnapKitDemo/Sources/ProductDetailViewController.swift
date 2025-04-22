//
//  ProductDetailViewController.swift
//  SnapKitDemo
//
//  Created by KimJunsoo on 4/22/25.
//

import UIKit
import SnapKit

class ProductDetailViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIStackView()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cart.circle.fill")
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Product Name"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$99.99"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .systemGreen
        return label
    }()
    
    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Product description goes here."
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private var addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add to Cart", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product Detail"
        
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.axis = .vertical
        contentView.spacing = 200
        contentView.alignment = .fill
        contentView.distribution = .fill
        
        contentView.addArrangedSubview(productImageView)
        contentView.addArrangedSubview(productNameLabel)
        contentView.addArrangedSubview(productPriceLabel)
        contentView.addArrangedSubview(productDescriptionLabel)
        view.addSubview(addToCartButton)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(addToCartButton.snp.top).offset(-20)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
        }
        
        productImageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(productImageView)
        }
    }

}

#Preview {
  UINavigationController(rootViewController: ProductDetailViewController())
}
