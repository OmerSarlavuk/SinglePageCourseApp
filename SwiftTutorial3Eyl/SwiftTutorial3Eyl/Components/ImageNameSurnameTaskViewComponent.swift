//
//  ImageNameSurnameTaskViewComponent.swift
//  SwiftTutorial3Eyl
//
//  Created by Ö.Ş on 4.09.2024.
//

import UIKit
import SnapKit

class ImageNameSurnameTaskViewComponent: UIView {
    
    // left profile photo image
    private var profile: UIImageView!
    
    // name-surname and Task
    private var nameSurname: UILabel!
    private var task: UILabel!
    
    // right button
    private var right: UIButton!
    
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
    
    // configure ViewModel
    struct ViewModel {
        
        let profile: UIImage
        let nameSurname: String
        let task: String
        let handleTap: VoidCallback
        
        init(profile: UIImage, nameSurname: String, task: String, handleTap: @escaping VoidCallback) {
            self.profile = profile
            self.nameSurname = nameSurname
            self.task = task
            self.handleTap = handleTap
        }
        
    }
    
}

extension ImageNameSurnameTaskViewComponent {
    
    // setupViews method
    private func setupViews() {
        
        // new object properties
        profile = UIImageView()
        nameSurname = UILabel()
        task = UILabel()
        right = UIButton()
        
        // added view
        addSubview(profile)
        addSubview(nameSurname)
        addSubview(task)
        addSubview(right)
        
        // trigger order methods
        setupUI()
        setupConstraints()
    }
    
    // view UI settings method
    private func setupUI() {
        
        // self UI settings
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 2.1
        self.layer.borderColor = UIColor.white.cgColor
        
        // profile UI setting
        profile.layer.masksToBounds = true
        profile.contentMode = .scaleAspectFill
        profile.layer.cornerRadius = 30
        
        // nameSurname UI settings
        nameSurname.textColor = .darkGray
        nameSurname.font = .boldSystemFont(ofSize: 16)
        
        // task UI settings
        task.textColor = .lightGray
        task.font = .systemFont(ofSize: 14)
        
        // right button UI settings
        right.setImage(.right, for: .normal)
        right.isUserInteractionEnabled = false
        
    }
    
    // view setup Constraints
    private func setupConstraints() {
        
        // profile setup Constraints
        profile.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
        }
        
        // nameSurname setup Constraints
        nameSurname.snp.makeConstraints{
            $0.leading.equalTo(profile.snp.trailing).offset(16)
            $0.top.equalTo(profile.snp.top).offset(8)
        }
        
        // task setup Constraints
        task.snp.makeConstraints{
            $0.leading.equalTo(nameSurname.snp.leading)
            $0.top.equalTo(nameSurname.snp.bottom).offset(6)
        }
        
        // right setup Constraints
        right.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-24)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(36)
        }
        
    }
    
    // configure method, this method trigger to outside
    func configure(viewModel: ViewModel) {
        profile.image = viewModel.profile
        nameSurname.text = viewModel.nameSurname
        task.text = viewModel.task
        self.onTap(handler: viewModel.handleTap)
        
    }
    
}

