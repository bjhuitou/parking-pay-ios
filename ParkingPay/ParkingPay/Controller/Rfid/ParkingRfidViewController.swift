//
//  ParkingRfidViewController.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

public class ParkingRfidViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardNoLabel: UILabel!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var successView: UIView!
    @IBOutlet weak var tagNumberTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var otpTextField: UITextField!
    
    var presenter: ParkingRfidPresenterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
        initNotification()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Init UI
    
    func initUI() {
        self.tagNumberTextField.delegate = self
        self.mobileTextField.delegate = self
        self.otpTextField.delegate = self
    }
    
    // MARK: - Init Data
    
    func initData() {
        self.presenter?.start()
    }

    // MARK: - Notification
    
    func initNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillChange(_ :)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func KeyboardWillChange(_ notification: NSNotification) {
        let info = notification.userInfo
        let kbRect = (info?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let offsetY = kbRect.origin.y - UIScreen.main.bounds.height
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(translationX: 0, y: offsetY / 2)
        }
    }
    
    // MARK: - Action
    
    @IBAction func enterAction() {
        self.successView.isHidden = true;
        self.registerView.isHidden = true
        self.editView.isHidden = false;
    }
    
    @IBAction func submitAction() {
        self.registerView.isHidden = true
        self.editView.isHidden = true
        self.successView.isHidden = false;
    }
    
    // MARK: - Private
}

extension ParkingRfidViewController: ParkingRfidViewProtocol {

    func isActive() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
}

extension ParkingRfidViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view?.endEditing(false)
        return true
    }
}
