//
//  FavouritesVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/25/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import SafariServices
class FavouritesVC: UIViewController {
    
    @IBOutlet weak var favouritesTableView: UITableView!
    var favourites = [League]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favourites.removeAll()
        retrieveFavourites()
    }
    
    private func retrieveFavourites(){
        let localDataBase=PersistenceManager.shared
        let storesFavourites = localDataBase.retrieveFavourites()
        guard let favourites=storesFavourites else {
            return
        }
        
        for fav in favourites {
            var league = League()
            league.strLeague = fav.value(forKey: "strLeague") as! String
            league.strYoutube = fav.value(forKey: "strYoutube") as! String
            league.idLeague = fav.value(forKey: "idLeague") as! String
            league.strBadge = fav.value(forKey: "strImage") as? String
            self.favourites.append(league)
        }
        self.favouritesTableView.reloadData()
        
    }
    
    
}



extension FavouritesVC :UITableViewDelegate ,UITableViewDataSource,YoutubeActionDelegate {
    func buttonPressed(link: String) {
        let isOnline = ConnectivityManager.shared.isOnline()
        if isOnline {guard let url=URL(string: link)else {
                print("error")
                return}
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)}
        else{
            self.presentGFAlertOnMainThread(title: "Error", message: "No Internet Connection , please check your connection and try again", buttonTitle: "OK")
        }
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        print("length--favourites------->>\(favourites[0])")
        return favourites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell
        cell.youtubeDelegat = self
        cell.setData(for: favourites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let localDataBase=PersistenceManager.shared
            localDataBase.removeLeague(strLeague: favourites[indexPath.row].strLeague!)
            self.favourites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var league :League!
        let isOnline = ConnectivityManager.shared.isOnline()
        if isOnline {
            league = favourites[indexPath.row]
            let detailsVC   = self.storyboard?.instantiateViewController(identifier: "LeaguesDetailsViewController") as! LeaguesDetailsViewController
            detailsVC.league=league
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
        else{
            self.presentGFAlertOnMainThread(title: "Error", message: "No Internet Connection , please check your connection and try again", buttonTitle: "OK")
        }
        
    }
    
    
}



