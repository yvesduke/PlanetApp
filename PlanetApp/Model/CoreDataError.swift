//
//  CoreDataError.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 12/05/2023.
//

import Foundation

enum CoreDataError:Error{
    case savingError
    case gettingError
}

extension CoreDataError: LocalizedError{
    
    var errorDescription: String?{
        switch self{
        case .savingError:
            return NSLocalizedString("Got Error while saving into DB", comment: " saving to the DB Error")
        case .gettingError:
            return NSLocalizedString("Got Error while getting data from DB", comment: "Get from DB Error")
        }
    }
}
