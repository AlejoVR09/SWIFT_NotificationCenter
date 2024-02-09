//
//  ViewController.swift
//  NotificationCenterKeyboard
//
//  Created by Alejandro Vanegas Rondon on 2/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    var homeView: HomeView? {
        self.view as? HomeView
    }

    lazy var notificationCenter = NotificationManager(notificationManagerDelegate: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeView?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.notificationCenter.registerObserver()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.notificationCenter.removeObserver()
    }
    
    


}

extension ViewController: HomeViewDelegate{
    func homeview(_ homeView: HomeView) {
        print("")
    }
    
    
}

extension ViewController: NotificationManagerDelegate{
    func NotificationManagerDelegate(_ notificationManager: NotificationManager, keyboardWillShow info: NotificationManager.Info) {
        self.homeView?.keyboardAppear(info)
        
    }
    
    func NotificationManagerDelegate(_ notificationManager: NotificationManager, keyboardWillHide info: NotificationManager.Info) 	{
        self.homeView?.keyboardDisappear(info)
    }
}

