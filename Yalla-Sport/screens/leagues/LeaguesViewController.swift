//
//  LeaguesViewController.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/22/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController {
    
    @IBOutlet weak var leagueTableView: UITableView!
    var sport      : String!
    var allLeagues = [League]()
    var filteredLeagues=[League]()
    var isFiltered=false
    var viewModel = LeaguesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadAllLeagues()
        configureSearchController()
        // downloadLeagueDataById(leagueId : "4328")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func downloadAllLeagues(){
        viewModel.checkIfDataIsLoading = { isLoading in
            if isLoading {self.showLoadingIndicator()}
            else{ self.hideLoadingIndicator()}
        }
        viewModel.checkIfResponseIsSuccess = { isSuccess in
            if isSuccess {
                //       updateTableView
                self.allLeagues = self.viewModel.allLeagues
                
                DispatchQueue.main.async {
                    self.leagueTableView.reloadData()
                }
            }
            else{
                //internet error
                
                self.addConnectionlessImage()
            }
        }
        
        viewModel.downloadAllLeagues(sport :sport)
    }
    
    
    
}
extension LeaguesViewController :UISearchResultsUpdating{
    
    func configureSearchController(){
        let searchController                                  = UISearchController()
        searchController.searchResultsUpdater                 = self
        searchController.searchBar.placeholder                = "search for a league"
        searchController.obscuresBackgroundDuringPresentation = false
        self.definesPresentationContext = true
        navigationItem.searchController                       = searchController
        searchController.hidesNavigationBarDuringPresentation = true
        navigationItem.hidesSearchBarWhenScrolling = false
        self.definesPresentationContext = true
        searchController.searchBar.searchBarStyle = .minimal
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchInput=searchController.searchBar.text,!searchInput.isEmpty else {
            isFiltered=false
            self.leagueTableView.reloadData()
            return
        }
        
        if searchController.isActive{
            filteredLeagues = allLeagues.filter {$0.strLeague!.lowercased().range(of: searchInput.lowercased()) != nil}
            if filteredLeagues.isEmpty {
            //   addConnectionlessImage()
            }
            isFiltered=true
            self.leagueTableView.reloadData()
        }
    }
    
    
}
