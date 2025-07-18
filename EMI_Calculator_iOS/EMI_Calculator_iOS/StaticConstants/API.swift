//
//  API.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 22/05/25.
//

import Foundation

class API {
    
    //Base URL:- based on selected Environment
    var BaseURL: String {
        var finalURL = ""
        
        switch Environments.shared.environment {
            case .Development:
                finalURL = "https://food2fork.ca/api/recipe/"
            break
        case .Stage:
                finalURL = "https://food2fork.ca/api/recipe/"
            break
        case .Production:
                finalURL = "https://food2fork.ca/api/recipe/"
            break
        }
        
        return finalURL
    }
    
    //API list which will going to use to get data
    struct API {
        static let GetRecipes = "search/?page="
        static let SearchRecipes = "query="
    }
    
    //Params
    struct Params {
        static let Authorization = "Authorization"
    }
}
