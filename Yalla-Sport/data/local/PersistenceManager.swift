//
//  PersistenceManager.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/25/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import CoreData

let entityName="Favourite_League"

class PersistenceManager{
    var context:NSManagedObjectContext!
    var entity:NSEntityDescription!
    
    static let shared = PersistenceManager()
    
    private init(){
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        entity=NSEntityDescription.entity(forEntityName: entityName, in: context)  }
    
    
    func retrieveFavourites()->[NSManagedObject]?{
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName:entityName)
        let storedFavourites=try?self.context.fetch(fetchRequest)
        guard let favourites = storedFavourites else {
            return nil
        }
        
        return favourites
    }
    
    
    
    
    func addToFavourites(favLeague :League){
        let entityRow=NSManagedObject(entity: self.entity, insertInto: self.context)
        entityRow.setValue(favLeague.strLeague, forKey: "strLeague")
        entityRow.setValue(favLeague.idLeague, forKey: "idLeague")
        entityRow.setValue(favLeague.strYoutube, forKey: "strYoutube")
        let strImage = favLeague.strFanart1 ?? favLeague.strFanart2 ?? favLeague.strFanart3 ?? favLeague.strFanart4 ?? favLeague.strBadge ?? favLeague.strLogo ?? favLeague.strTrophy ??  "aliiiiii"
      //  print(favLeague)
               entityRow.setValue(strImage, forKey: "strImage")
        try?self.context.save()
        print("added successfully")
    }
    
    func removeLeague(strLeague :String ){
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName:entityName)
        let storedFavourites=try?self.context.fetch(fetchRequest)
        guard let favourites = storedFavourites else {
                   return
               }
        for league in favourites {
            if league.value(forKey: "strLeague") as! String == strLeague {
                context.delete(league)
                }
        }
        
        
    }
    func isFavourited(strLeague :String )->Bool{
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName:entityName)
        let storedFavourites=try?self.context.fetch(fetchRequest)
        guard let favourites = storedFavourites else {
                   return false
               }
        for league in favourites {
            if league.value(forKey: "strLeague") as! String == strLeague {
              return true
                }
        }
        return false
        
    }
    
    
}
