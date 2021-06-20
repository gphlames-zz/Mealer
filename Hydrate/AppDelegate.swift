//
//  AppDelegate.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2020 swift tech. All rights reserved.
//

import UIKit
import Firebase
import CoreData
import IQKeyboardManagerSwift


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var ispaid: Bool?
    let myAppfontAttributes12: [NSAttributedString.Key:UIFont] = [.font: UIFont(name: "Arial", size: 12)!]
    let myAppfontAttributes14: [NSAttributedString.Key:UIFont] = [.font: UIFont(name: "Arial", size: 14)!]
    let myAppfontAttributes16: [NSAttributedString.Key:UIFont] = [.font: UIFont(name: "Arial", size: 16)!]
    let myAppfontAttributesBold12: [NSAttributedString.Key:UIFont] = [.font: UIFont(name: "Arial Bold", size: 12)!]
    let myAppfontAttributesBold14: [NSAttributedString.Key:UIFont] = [.font: UIFont(name: "Arial Bold", size: 14)!]
    let myAppfontAttributesBold16: [NSAttributedString.Key:UIFont] = [.font: UIFont(name: "Arial Bold", size: 16)!]
    let myAppfontAttributesItalic12: [NSAttributedString.Key:UIFont] = [.font: UIFont(name: "Arial Italic", size: 12)!]
    let myAppfontAttributesItalic14: [NSAttributedString.Key:UIFont] = [.font: UIFont(name: "Arial Italic", size: 14)!]
    let myAppfontAttributesItalic16: [NSAttributedString.Key:UIFont] = [.font: UIFont(name: "Arial Italic", size: 16)!]
    let buttonColors = UIColor(named: "firstshade")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert,.sound]
        center.requestAuthorization(options: options) { (granted, error) in
            if !granted{
                
            }
        }
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "paid account"){
            ispaid = true
        }else{
            
           ispaid = false
        }
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        // Define the menus

        return true
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
