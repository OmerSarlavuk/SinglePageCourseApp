//
//  ViewController.swift
//  SwiftTutorial3Eyl
//
//  Created by Ahlatci on 3.09.2024.
//

import UIKit
import SnapKit

class HomePageViewController: UIViewController {
    
    // topView Comp
    private var topViewComponent: TopIntroductionViewComponent!
    
    // new Button
    private var new: UIButton!
    
    // top title
    private var topTitle: UILabel!
    
    // course author
    private var courseAuthor: ImageNameSurnameTaskViewComponent!
    
    // courseContent
    private var courseContent: UILabel!
    
    // bottom payment View Component
    private var payment: PaymentViewComponent!
    
    // SourceContent collectionView
    private var sourceCollectionView: UICollectionView!
    
    //MARK: SourceContent DataSource -> FakeData
    private let dataSource: [(UIImage, String, String)] = [
        (UIImage.intro, "Introduction", "1:51"),
        (UIImage.privacy, "The Modo Interface", "7:12")
    ]
    
}

extension HomePageViewController {
    
    // didlodad method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // setupView method
    private func setupViews() {
        // initialize properties
        topViewComponent = TopIntroductionViewComponent()
        new = UIButton()
        topTitle = UILabel()
        courseAuthor = ImageNameSurnameTaskViewComponent()
        courseContent = UILabel()
        sourceCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        payment = PaymentViewComponent()
        
        // added properties
        view.addSubview(topViewComponent)
        view.addSubview(new)
        view.addSubview(topTitle)
        view.addSubview(courseAuthor)
        view.addSubview(courseContent)
        view.addSubview(sourceCollectionView)
        view.addSubview(payment)
        
        // trigger the order methods
        setupUI()
        setupConstraints()
        configure()
    }
    
    // UI properties settings
    private func setupUI() {
        
        // view UI setting
        view.backgroundColor = .arkaPlan
        
        // new button UI settings
        new.backgroundColor = .newButton
        new.setTitle("New", for: .normal)
        new.setTitleColor(.white, for: .normal)
     
        // topTitle UI settings
        topTitle.textColor = .black
        topTitle.font = .boldSystemFont(ofSize: 20)
        topTitle.numberOfLines = 0
        topTitle.textAlignment = .left
        
        // courseContent UI settings
        courseContent.textColor = .black
        courseContent.font = .boldSystemFont(ofSize: 24)
        
        // sourceCollectionView UI settings
        sourceCollectionView.backgroundColor = .clear
        sourceCollectionView.register(CourseContentCell.self, forCellWithReuseIdentifier: CourseContentCell.key)
        sourceCollectionView.showsHorizontalScrollIndicator = false
        sourceCollectionView.showsVerticalScrollIndicator   = false
        sourceCollectionView.delegate = self
        sourceCollectionView.dataSource = self
        
    }
    
    // properties setup Constraints
    private func setupConstraints() {
        
        // topViewComp setup Constraints
        topViewComponent.snp.makeConstraints{
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(350)
        }
        
        // new button setup Constraints
        new.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(24)
            $0.top.equalTo(topViewComponent.snp.bottom).offset(24)
            $0.height.equalTo(36)
            $0.width.equalTo(75)
        }
        
        // topTitle setup Constraints
        topTitle.snp.makeConstraints{
            $0.leading.equalTo(new.snp.leading)
            $0.top.equalTo(new.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().offset(-48)
        }
        
        // courseAuthor setup Constraints
        courseAuthor.snp.makeConstraints{
            $0.leading.equalTo(new.snp.leading)
            $0.trailing.equalToSuperview().offset(-24)
            $0.top.equalTo(topTitle.snp.bottom).offset(16)
            $0.height.equalTo(85)
        }
        
        // courseContent setup Constraints
        courseContent.snp.makeConstraints{
            $0.leading.equalTo(new.snp.leading)
            $0.top.equalTo(courseAuthor.snp.bottom).offset(24)
        }
    
        // sourceCollectionView setup Constraints
        sourceCollectionView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(courseContent.snp.bottom).offset(24)
            $0.bottom.equalTo(payment.snp.top).offset(-16)
        }
        
        // payment setup Constraints
        payment.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(100)
        }
        
    }
    
    // configure method
    private func configure() {
        
        // topViewComponent configure
        topViewComponent.configure(viewModel: TopIntroductionViewComponent.ViewModel(
            student: "80.6k",
            reviews: "2.5k",
            positive: "98%",
            leftCallBack: {
                print("left button tapped!")
            },
            shareCallBack: {
                print("share button tapped")
            }))
        
        // topTitle configure
        topTitle.text = "Learn The besics of 3d modelling In modo 3d"
        
        // courseAuthor configure
        courseAuthor.configure(viewModel: ImageNameSurnameTaskViewComponent.ViewModel(
            profile: .girl,
            nameSurname: "Shakira Malisova",
            task: "3d Designer",
            handleTap: {
                print("Shakira Malisova UIView tapped")
            }))
        
        // courseContent configure
        courseContent.text = "Course Content"
        
        // payment Configure
        payment.configure(viewModel: PaymentViewComponent.ViewModel(
            totalPrice: 11.99,
            discount: 32,
            lastPrice: 44.99,
            buyNowAction: {
                print("buy now button tapped")
            }))
        
    }
    
}

//MARK: collection view delegate and data source
extension HomePageViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // data source item count -> cell count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // cell configure -> create
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = dataSource[indexPath.row]
        let cell = sourceCollectionView.dequeueReusableCell(withReuseIdentifier: CourseContentCell.key, for: indexPath) as! CourseContentCell
        cell.configure(viewModel: CourseContentCell.ViewModel(
            contentImage: data.0,
            title: data.1,
            totalTime: data.2))
        return cell
    }
    
    // cell size -> width, height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 100)
    }
    
    // cells spacing -> 20
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // cell snp -> left, right values
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    // click cell event
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedData = dataSource[indexPath.row]
        print("selected_item -> \(selectedData.1)")
    }
    
}

