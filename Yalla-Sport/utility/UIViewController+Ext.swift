//
//  UIViewController+Ext.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/26/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SwiftMessages

fileprivate var activityIndicator : NVActivityIndicatorView!
fileprivate var imageView : UIImageView?
extension UIViewController{
    func showLoadingIndicator(){
        let xAxis = self.view.center.x
        let yAxis = self.view.center.y
        let frame = CGRect(x: (xAxis - 50), y: (yAxis - 50), width: 60, height: 60)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.type = . orbit
        activityIndicator.color = UIColor.red
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            activityIndicator?.removeFromSuperview()
            activityIndicator = nil
        }
    }
    func showConnectivityMessage(isOnline : Bool) {
        let myView = MessageView.viewFromNib(layout: MessageView.Layout.messageView)
        if isOnline == true {
            myView.configureTheme(.success)
            myView.bodyLabel?.text = "You are connected"
            
        } else {
            myView.configureTheme(.error)
            myView.bodyLabel?.text = "No Internet Connection"
        }
        
        myView.iconImageView?.isHidden = true
        myView.iconLabel?.isHidden = true
        myView.titleLabel?.isHidden = true
        myView.titleLabel?.textColor = UIColor.white
        myView.bodyLabel?.textColor = UIColor.white
        myView.button?.isHidden = true
        
        var myConfig = SwiftMessages.Config()
        myConfig.presentationStyle = .top
        SwiftMessages.show(config: myConfig, view: myView)
    }
    func addConnectionlessImage(){
        imageView=UIImageView()
        view.addSubview(imageView!)
        imageView?.image = UIImage(named: "no-wifi")
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.contentMode = .scaleAspectFit
        imageView?.tintColor   = .label
        
        NSLayoutConstraint.activate([
            imageView!.topAnchor.constraint(equalTo: view.topAnchor),
            imageView!.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            imageView!.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView!.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
            ]
        )
    }
    
    func removeConnectionMessage(){
        
        imageView?.removeFromSuperview()
        imageView = nil
    }
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = AlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    
}
