//
//  HelperExtentions.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/28/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
extension String{
    func convertToDate()->Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale     = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone   = .current
        return dateFormatter.date(from: self)
    }
    func convertToDisplayFormat() ->String{
        guard let date = self.convertToDate() else {return "N/A"}
        return date.convertToMonthYear()
    }
}


extension Date{
    func convertToMonthYear()->String{
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "E, MMM-d-yyyy h:mm a"
        return dateFormatter.string(from: self)
    }
}
