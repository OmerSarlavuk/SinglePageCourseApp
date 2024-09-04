//
//  CourseContentCell.swift
//  SwiftTutorial3Eyl
//
//  Created by Ahlatci on 4.09.2024.
//

import UIKit
import SnapKit


class CourseContentCell: UICollectionViewCell {
    
    // Course Content Cell Identifier Key
    static let key = "CourseContentCell"
    
    // content image
    private var contentImage: UIImageView!
    
    // content Title
    private var title: UILabel!
    
    // total Time
    private var totalTime: UILabel!
    
    // cell init method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    // error method
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("CourseContentCell not init!")
    }
    
    // CourseContentCell ViewModel
    struct ViewModel {
        
        let contentImage: UIImage
        let title: String
        let totalTime: String
        
        init(contentImage: UIImage, title: String, totalTime: String) {
            self.contentImage = contentImage
            self.title = title
            self.totalTime = totalTime
        }
    }
    
}

extension CourseContentCell {
    
    // setupCell method
    private func setupCell() {
        
        // self UI settings
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        
        // new object cell properties
        contentImage = UIImageView()
        title = UILabel()
        totalTime = UILabel()
        
        // added cell properties
        contentView.addSubview(contentImage)
        contentView.addSubview(title)
        contentView.addSubview(totalTime)
        
        // trigger order methods
        setupUI()
        setupConstraints()
    }
    
    // cell UI settings method
    private func setupUI() {
        
        // contentImage UI settings
        contentImage.layer.masksToBounds = true
        contentImage.contentMode = .scaleAspectFill
        contentImage.layer.cornerRadius = 10
        
        // title UI setting
        title.font = .systemFont(ofSize: 18, weight: .black)
        
        // totalTime UI setting
        totalTime.font = .systemFont(ofSize: 14, weight: .medium)
        
    }
    
    // cell setup Constraints method
    private func setupConstraints() {
        
        // contentImage setup Constraints
        contentImage.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.equalTo(contentImage.snp.height)
        }
        
        // title setup Constraints
        title.snp.makeConstraints{
            $0.leading.equalTo(contentImage.snp.trailing).offset(16)
            $0.top.equalTo(contentImage.snp.top).offset(10)
        }
        
        // totalTime setup Constraints
        totalTime.snp.makeConstraints{
            $0.leading.equalTo(title.snp.leading)
            $0.top.equalTo(title.snp.bottom).offset(14)
        }
        
    }
    
    // configure method
    func configure(viewModel: ViewModel) {
        
        // contentImage configure
        contentImage.image = viewModel.contentImage
        
        // title configure
        title.text = viewModel.title
        
        // totalTime configure
        totalTime.text = viewModel.totalTime
        
    }
    
}

