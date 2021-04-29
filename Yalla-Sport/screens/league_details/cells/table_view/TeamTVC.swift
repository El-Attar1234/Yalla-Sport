//
//  TeamTVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/24/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit


protocol TeamDelegate : class {
    func goToTeamDetails(teamName : String)
}





class TeamTVC: UITableViewCell {
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    weak var delegate : TeamDelegate!
    
    var teams=[Team]()
    override func awakeFromNib() {
        super.awakeFromNib()
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setData(for teams :[Team] , delegate : TeamDelegate) {
        self.teams=teams
        self.delegate = delegate
        teamsCollectionView.reloadData()
    }
    
    
}
extension TeamTVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCVC", for: indexPath) as! TeamsCVC
        cell.set(for : teams[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width*0.7, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.goToTeamDetails(teamName: teams[indexPath.row].strTeam ?? "")
        
        /*  let teamDetailsVC   = self.storyboard?.instantiateViewController(identifier: "LeaguesDetailsViewController") as! TeamDetailsVC
         self.navigationController?.pushViewController(detailsVC, animated: true)*/
    }
}
