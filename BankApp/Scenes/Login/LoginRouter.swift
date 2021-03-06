//
//  LoginRouter.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/29/20.
//  Copyright (c) 2020 Lynneker Souza. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
    func routeToStatement(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    
    func routeToStatement(segue: UIStoryboardSegue?)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ListStatementViewController") as! ListStatementViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToStatement(source: dataStore!, destination: &destinationDS)
        navigateToStatement(source: viewController, destination: destinationVC)
    }
    
    // MARK: Navigation
    
    func navigateToStatement(source: LoginViewController?, destination: ListStatementViewController)
    {
        source?.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToStatement(source: LoginDataStore, destination: inout ListStatementDataStore)
    {
        destination.userAccount = source.userAccount
    }
}
