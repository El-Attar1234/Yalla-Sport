//
//  LeaguesViewController+UITableView.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/22/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

extension LeaguesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  allLeagues.count;
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell=tableView.dequeueReusableCell(withIdentifier: "LeagueTableViewCell", for: indexPath) as! LeagueTableViewCell
        cell.set(league: allLeagues[indexPath.row])
           return cell
       }
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let league = allLeagues[indexPath.row]
          let detailsVC   = self.storyboard?.instantiateViewController(identifier: "LeaguesDetailsViewController") as! LeaguesDetailsViewController
            detailsVC.league=league
             self.navigationController?.pushViewController(detailsVC, animated: true)
       }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
