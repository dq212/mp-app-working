//
//  BikeCell.swift
//  mp
//
//  Created by DANIEL I QUINTERO on 2/6/17.
//  Copyright © 2017 DanielIQuintero. All rights reserved.
//

import UIKit

class BikeCell: UITableViewCell {
    
    var indexPath:IndexPath!
    var bike:FB_Bike!
    
    let thumbNailImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFill
        iv.layer.borderColor = UIColor.lightGray.cgColor
        iv.layer.borderWidth = 1
        return iv
    }()
    
    // first create UIImageView
    let acc:UIImageView = {
       // let img = UIImageView()
       let img = UIImageView(frame:CGRect(x: 10, y: 10, width: 25, height: 12))
           img.image = #imageLiteral(resourceName: "swipeArrows")
        return img
    }()
    
  
    
   
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Medium", size: 17)
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        label.text = ""
        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .veryLightGray()
        return view
    }()
    let divider2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.veryLightGray()
        return view
    }()
    
    let makeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 13)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    let modelLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 13)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 10)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    let unitsLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 11)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
    
        label.text = "Current Mileage"
        return label
    }()
    
    let mileageButton:UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 10)
        button.setTitle("Enter Mileage", for: .normal)
        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .lightGray
        button.backgroundColor = UIColor.mainRed()
        
        button.layer.cornerRadius = 2
        return button
    }()
    
    override init(style:UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubview(thumbNailImageView)
        addSubview(divider)
        addSubview(unitsLabel)
        self.accessoryView = acc
       // addSubview(divider2)
        thumbNailImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 25, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: (frame.width / 3.5) , height: (frame.width / 3.5) )
        setupLabels()
        divider.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 1.5, paddingRight: 20, width: 0, height: 0.5)
        //divider2.anchor(top: divider.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0.5)
        thumbNailImageView.contentMode = .scaleAspectFill
        thumbNailImageView.layer.cornerRadius = (self.frame.width/3.5) / 2
        thumbNailImageView.clipsToBounds = true
    }
    
    fileprivate func setupLabels() {
        let stackView = UIStackView(arrangedSubviews: [ makeLabel, modelLabel, yearLabel, unitsLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .top
       // stackView.spacing = 1.0
        //stackView.distribution = UIStackViewDistribution(rawValue: Int(1.0))!
        addSubview(stackView)
        addSubview(mileageButton)
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: thumbNailImageView.rightAnchor, bottom: nil, right: nil, paddingTop:26, paddingLeft: 14, paddingBottom: 0, paddingRight: 10, width:180, height: 0)

        stackView.anchor(top: titleLabel.bottomAnchor, left: thumbNailImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 3, paddingLeft: 14, paddingBottom: 0, paddingRight: 10, width:130, height: 70)
        //unitsLabel.anchor(top:stackView.bottomAnchor, left: stackView.leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 7, paddingRight: 20, width: 0, height: 20)
        mileageButton.anchor(top: nil, left:nil, bottom: stackView.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 3, paddingRight: 15, width: 80, height: 18)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

