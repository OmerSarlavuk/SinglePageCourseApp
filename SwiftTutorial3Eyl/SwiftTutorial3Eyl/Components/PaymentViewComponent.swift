//
//  PaymentViewComponent.swift
//  SwiftTutorial3Eyl
//
//  Created by Ahlatci on 4.09.2024.
//

import UIKit
import SnapKit

class PaymentViewComponent: UIView {
    
    // total Price, discount, last Price
    private var totalPrice: UILabel!
    private var discount: UILabel!
    private var lastPrice: UILabel!
    
    // last Price on Line
    private var line: UIView!
    
    // buy Now button
    private var buyNow: UIButton!
    
    // UIView initialize method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    // Error method UIView
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init not success!")
    }
    
    // ViewComponent ViewModel
    struct ViewModel {
        
        let totalPrice: Decimal
        let discount: Int
        let lastPrice: Decimal
        let buyNowAction: VoidCallbackButton
        
        init(totalPrice: Decimal, discount: Int, lastPrice: Decimal, buyNowAction: VoidCallbackButton = nil) {
            self.totalPrice = totalPrice
            self.discount = discount
            self.lastPrice = lastPrice
            self.buyNowAction = buyNowAction
        }
        
    }
    
}

extension PaymentViewComponent {
    
    // setupViews method
    private func setupViews() {
        
        // new object properties
        totalPrice = UILabel()
        discount = UILabel()
        lastPrice = UILabel()
        line = UIView()
        buyNow = UIButton()
        
        // added view
        addSubview(totalPrice)
        addSubview(discount)
        addSubview(lastPrice)
        addSubview(line)
        addSubview(buyNow)
        
        // trigger order methods
        setupUI()
        setupConstraints()
    }
    
    // view UI settings method
    private func setupUI() {
        
        // self UI setting
        self.backgroundColor = .white
        
        // total Price UI setting
        totalPrice.font = .systemFont(ofSize: 24, weight: .bold)
        
        // discount UI settings
        discount.font = .systemFont(ofSize: 16)
        discount.textColor = .lightGray
        
        // last Price UI settings
        lastPrice.font = .systemFont(ofSize: 16)
            
        // line UI setting
        line.backgroundColor = .black
        
        // buy Now UI settings
        buyNow.backgroundColor = .buyNowButton
        buyNow.layer.cornerRadius = 10
        buyNow.setTitle("Buy Now", for: .normal)
        buyNow.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buyNow.setTitleColor(.white, for: .normal)
        
    }
    
    // view setup Constraints
    private func setupConstraints() {
        
        // total Price setup Constraints
        totalPrice.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(24)
            $0.top.equalToSuperview().offset(12)
        }
        
        // discount setup Constraints
        discount.snp.makeConstraints{
            $0.leading.equalTo(totalPrice.snp.leading)
            $0.top.equalTo(totalPrice.snp.bottom).offset(4)
        }
        
        // last Price setup Constraints
        lastPrice.snp.makeConstraints{
            $0.leading.equalTo(discount.snp.trailing).offset(6)
            $0.centerY.equalTo(discount.snp.centerY)
        }
        
        // line setup Constraints
        line.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.centerY.equalTo(lastPrice.snp.centerY)
            $0.leading.equalTo(lastPrice.snp.leading).offset(-5)
            $0.trailing.equalTo(lastPrice.snp.trailing).offset(5)
        }
        
        // buy Now setup Constraints
        buyNow.snp.makeConstraints{
            $0.trailing.bottom.equalToSuperview().offset(-24)
            $0.top.equalTo(totalPrice.snp.top)
            $0.width.equalTo(180)
        }
    }
    
    // this method trigger to outside
    func configure(viewModel: ViewModel) {
        totalPrice.text = "\(viewModel.totalPrice) US$"
        discount.text = "\(viewModel.discount)% Disc."
        lastPrice.text = "\(viewModel.lastPrice)US$"
        buyNow.addAction(UIAction(handler: { handler in
            viewModel.buyNowAction?()
        }), for: .touchUpInside)
    }
    
}
