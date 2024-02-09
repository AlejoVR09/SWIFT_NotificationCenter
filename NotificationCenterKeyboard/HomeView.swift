//
//  HomeView.swift
//  NotificationCenterKeyboard
//
//  Created by Alejandro Vanegas Rondon on 2/02/24.
//

import UIKit

protocol HomeViewDelegate {
    func homeview(_ homeView: HomeView)
}

class HomeView: UIView {
    var delegate: HomeViewDelegate?
    @IBOutlet private weak var view: UIView!
    @IBOutlet weak var centerContraint: NSLayoutConstraint!
    
    
    @IBAction private func didTabToCloseKeyboard(_ sender: Any) {
        self.endEditing(true)
    }
    
    func keyboardAppear (_ info: NotificationManager.Info){
        if info.frame.origin.y < self.view.frame.maxY {
            UIView.animate(withDuration: info.animation) {
                self.centerContraint.constant = info.frame.origin.y - self.view.frame.maxY
                self.layoutIfNeeded()
            }
        }
    }
    
    func keyboardDisappear (_ info: NotificationManager.Info){
        UIView.animate(withDuration: info.animation) {
            self.centerContraint.constant = 0
            self.layoutIfNeeded()
        }
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
