//
//  VC+TableViewExt.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/24/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

extension LeaguesDetailsViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  3;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
           let cell=tableView.dequeueReusableCell(withIdentifier: "UpcomingTVC", for: indexPath) as! UpcomingTVC
            cell.setData(for: upComingEvents)
              return cell
        case 1:
           let cell=tableView.dequeueReusableCell(withIdentifier: "LastTVC", for: indexPath) as! LastTVC
           cell.setData(for: pastEventsArray)
              return cell
        case 2:
          let  cell=tableView.dequeueReusableCell(withIdentifier: "TeamTVC", for: indexPath) as! TeamTVC
            cell.setData(for: teams)
              return cell
        default:
            return UITableViewCell()
        }
        
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 250
        case 1:
            return 600
        default:
              return 250
        }
        
}
}
