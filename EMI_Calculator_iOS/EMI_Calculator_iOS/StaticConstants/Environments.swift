//
//  Environments.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 22/05/25.
//

import Foundation

class Environments {
    
    static let shared = Environments()
    
    //Environment setup for entire project.
    private let currentEnvironment: Environment = .Development
    
    var environment: Environment {
        get{ self.curRnvironment() }
    }
    
    //Environment
    enum Environment: String {
        case Development = "Development"
        case Stage = "Stage"
        case Production = "Production"
    }
    
    private func curRnvironment() -> Environment {
        self.currentEnvironment
    }
}
