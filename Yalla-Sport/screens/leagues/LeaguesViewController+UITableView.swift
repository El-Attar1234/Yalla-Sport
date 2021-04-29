//
//  LeaguesViewController+UITableView.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/22/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import SafariServices

extension LeaguesViewController:UITableViewDelegate,UITableViewDataSource ,YoutubeActionDelegate {
    func buttonPressed(link: String) {
          guard let url=URL(string: link)else {
                     print("error")
                     return}
                   let safariVC = SFSafariViewController(url: url)
                  present(safariVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltered{
            return filteredLeagues.count
        }
        else {     return  allLeagues.count }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "LeagueTableViewCell", for: indexPath) as! LeagueTableViewCell
        
        if isFiltered{
            cell.set(league:filteredLeagues[indexPath.row])
        }
        else { cell.set(league: allLeagues[indexPath.row])}
        cell.youtubeDelegat = self
        
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var league :League!
        
        if isFiltered{
            league = filteredLeagues[indexPath.row]
        }
        else {   league = allLeagues[indexPath.row]}
        
        
        let detailsVC   = self.storyboard?.instantiateViewController(identifier: "LeaguesDetailsViewController") as! LeaguesDetailsViewController
        detailsVC.league=league
     //  self.present(detailsVC, animated: true)
        
      self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
