//
//  TeamDetails+Extension.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/28/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import SafariServices

extension TeamDetailsVC{
    
    func addTapsToFaceBook(image :UIImageView){
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.faceBookTaped))
        image.addGestureRecognizer(tapGR)
        image.isUserInteractionEnabled = true
    }
    @objc func faceBookTaped(_ sender: UITapGestureRecognizer ) {
        print("UIImageView tapped")
        guard let url=URL(string: "https://\(faceBookURL!)")else {
            print("error")
            return}
        let safariVC=SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    func addTapsToTwitter(image :UIImageView){
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.twitterTapedTaped))
        image.addGestureRecognizer(tapGR)
        image.isUserInteractionEnabled = true
    }
    @objc func twitterTapedTaped(_ sender: UITapGestureRecognizer ) {
        print("UIImageView tapped")
        guard let url=URL(string: "https://\(twitterURL!)")else {
            print("error")
            return}
        let safariVC=SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    func addTapsToInstgram(image :UIImageView){
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.instgramTapedTaped))
        image.addGestureRecognizer(tapGR)
        image.isUserInteractionEnabled = true
    }
    @objc func instgramTapedTaped(_ sender: UITapGestureRecognizer ) {
        print("UIImageView tapped")
        guard let url=URL(string: "https://\(instgramURL!)")else {
            print("error")
            return}
        let safariVC=SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    func addTapsToWebsite(image :UIImageView){
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.websiteTapedTaped))
        image.addGestureRecognizer(tapGR)
        image.isUserInteractionEnabled = true
    }
    @objc func websiteTapedTaped(_ sender: UITapGestureRecognizer ) {
        print("UIImageView tapped")
        guard let url=URL(string: "https://\(websiteURL!)")else {
            print("error")
            return}
        let safariVC=SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
