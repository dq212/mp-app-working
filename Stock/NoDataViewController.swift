//
//  NoDataViewController.swift
//  MotoPreserve-App
//
//  Created by DANIEL I QUINTERO on 12/5/17.
//  Copyright © 2017 DANIEL I QUINTERO. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import MessageUI

class NoDataViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    var backBarButton:UIBarButtonItem?
    
    var titleBar:TitleBar = TitleBar()
    
    let contactView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.1)
        return view
    }()
    
    let contactText:UITextView = {
        let tv = UITextView()
        tv.font = UIFont(name: "Avenir-Medium", size: 16)
        tv.textAlignment = .left
        tv.textColor = UIColor.black
        tv.backgroundColor = UIColor(white: 0, alpha: 0.0)
        tv.text = "Uh oh.\n\nIt looks like we don't currently have any STOCK DATA for this bike.\n\nPlease send us an email with your make, model and year and we'll do our best to include your bike.\n\nWe are constantly adding new STOCK DATA, so look out for push notifications regarding new models."
        return tv
    }()
    
    let contactEmailButton:UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 17)
        button.setTitle("E-mail Us", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .mainRed()
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         titleBar.addTitleBarAndLabel(page: view, initialTitle: "STOCK DATA", ypos: 64)
        navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "logo_2"))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(cancelThisView))
//        navigationItem.leftBarButtonItem?.tintColor = .mainRed()
            // remove left buttons (in case you added some)
 
        
        contactEmailButton.addTarget(self, action: #selector(emailButtonHandler), for: .touchUpInside)
        
        view.backgroundColor = .white
        //view.addSubview(contactView)
        // contactView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 44, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(contactText)
        contactText.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 120, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height:300)
        
        view.addSubview(contactEmailButton)
        contactEmailButton.anchor(top: contactText.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 0)
        contactEmailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc func cancelThisView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func emailButtonHandler() {
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(["info@motopreserve.com"])
        composeVC.setSubject("MotoPreserve Customer Feedback")
        //composeVC.setMessageBody("Hello from California!", isHTML: false)
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
}

