//
//  TopIntroductionViewComponent.swift
//  SwiftTutorial3Eyl
//
//  Created by Ö.Ş on 3.09.2024.
//

import UIKit
import SnapKit

class TopIntroductionViewComponent: UIView {
    
    // background Image
    private var backImage: UIImageView!
    
    // left and share button
    private var left: UIButton!
    private var share: UIButton!
    
    // contentView
    private var contentView: UIView!
    
    // init method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    // error init method
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init not success!")
    }
    
    // configure ViewModel
    struct ViewModel {
        let student: String
        let reviews: String
        let positive: String
        let leftCallBack: VoidCallbackButton
        let shareCallBack: VoidCallbackButton
        
        init(student: String, reviews: String, positive: String, leftCallBack: VoidCallbackButton = nil, shareCallBack: VoidCallbackButton = nil) {
            self.student = student
            self.reviews = reviews
            self.positive = positive
            self.leftCallBack = leftCallBack
            self.shareCallBack = shareCallBack
        }
    }
    
}

extension TopIntroductionViewComponent {
    
    // setupView method
    private func setupViews() {
        
        // new object properties
        backImage = UIImageView()
        left = UIButton()
        share = UIButton()
        contentView = UIView()
        
        // added view properties
        addSubview(backImage)
        addSubview(left)
        addSubview(share)
        backImage.addSubview(contentView)
        
        // trigger to order methods
        setupUI()
        setupConstraints()
    }
    
    // view UI settings method
    private func setupUI() {
        
        // backImage UI settings
        backImage.contentMode = .scaleAspectFill
        backImage.image = .tech
        backImage.backgroundColor = .clear
        
        // left button UI settings
        left.backgroundColor = .leftButton
        left.layer.cornerRadius = 10
        left.setImage(.left, for: .normal)
        
        // share button UI settings
        share.backgroundColor = .rightButton
        share.layer.cornerRadius = 10
        share.setImage(.share, for: .normal)
        
        // contentView UI settings
        contentView.layer.cornerRadius = 15
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.borderWidth = 0.3
        
    }
    
    // constraints Properties
    private func setupConstraints() {
        
        // backImage setup Constraints
        backImage.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        // left button setup Constraints
        left.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(24)
            $0.top.equalToSuperview().offset(40)
            $0.width.height.equalTo(44)
        }
        
        // share button setup Constraints
        share.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-24)
            $0.top.equalToSuperview().offset(40)
            $0.width.height.equalTo(44)
        }
        
        // contentView setup Constraints
        contentView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.bottom.equalToSuperview().offset(-24)
            $0.height.equalTo(backImage).dividedBy(5)
        }
        
    }
    
    // configure method will be triggered from outside
    func configure(viewModel: ViewModel) {
    
        // 3 stacksView inside outer stackView
        let stackOut = self.sender_UIStackView(spacing: 0, axis: .horizontal)
        
        contentView.addSubview(stackOut)
        
        // stackOut setup Constraints
        stackOut.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        // stackOut in stackViews
        let stackIn1 = self.sender_UIStackView(spacing: 0, axis: .vertical)
        let stackIn2 = self.sender_UIStackView(spacing: 0, axis: .vertical)
        let stackIn3 = self.sender_UIStackView(spacing: 0, axis: .vertical)
        
        // stackOut configure
        stackOut.addArrangedSubview(stackIn1)
        stackOut.addArrangedSubview(stackIn2)
        stackOut.addArrangedSubview(stackIn3)
        
        // stackIn1 configure
        stackIn1.addArrangedSubview(self.sender_UILabel(text: viewModel.student, font: .boldSystemFont(ofSize: 18)))
        stackIn1.addArrangedSubview(self.sender_UILabel(text: "Students", font: .systemFont(ofSize: 15)))
        
        // stackIn2 configure
        stackIn2.addArrangedSubview(self.sender_UILabel(text: viewModel.reviews, font: .boldSystemFont(ofSize: 18)))
        stackIn2.addArrangedSubview(self.sender_UILabel(text: "Reviews", font: .systemFont(ofSize: 15)))
        
        // stackIn3 configure
        stackIn3.addArrangedSubview(self.sender_UILabel(text: viewModel.positive, font: .boldSystemFont(ofSize: 18)))
        stackIn3.addArrangedSubview(self.sender_UILabel(text: "Positive", font: .systemFont(ofSize: 15)))
        
        // left button action
        left.addAction(UIAction(handler: { handler in
            viewModel.leftCallBack?()
        }), for: .touchUpInside)
        
        // share button action
        share.addAction(UIAction(handler: { handler in
            viewModel.shareCallBack?()
        }), for: .touchUpInside)
        
    }
    
}

//MARK: sender UILabel or UIStackView extension methods
extension TopIntroductionViewComponent {
    private func sender_UIStackView(spacing: CGFloat, axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stack_view = UIStackView()
        stack_view.spacing = spacing
        stack_view.distribution = .equalSpacing
        stack_view.axis = axis
        return stack_view
    }
    private func sender_UILabel(text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
}

