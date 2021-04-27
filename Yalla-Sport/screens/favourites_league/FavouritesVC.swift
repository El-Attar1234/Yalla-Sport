//
//  FavouritesVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/25/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

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
            self.favourites.append(league)
          }
        self.favouritesTableView.reloadData()
        
        }
    
        
    }



extension FavouritesVC :UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell=tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell
        
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
    
    
}



