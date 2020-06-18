//
//  ParkingMainViewController.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit
import SwiftEventBus

public class ParkingMainViewController: PresentBottomVC {

    static let defaultBottomViewHeight: CGFloat = 320.0
    static let rfidBottomViewHeight: CGFloat = 480.0
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var actionView: UIView!
    @IBOutlet weak var mainViewHeighContraint: NSLayoutConstraint!
    @IBOutlet weak var mainViewBottomMaringContraint: NSLayoutConstraint!
    
    var presenter: ParkingMainPresenterProtocol?
    var editVC: UIViewController!
    var homeVC: UIViewController!
    var parkingsVC: UIViewController!
    var rfidVC: UIViewController!
    var currentVC: UIViewController!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Init UI
    
    func initUI() {
        self.bgView.layoutIfNeeded()
        self.containerView.layoutIfNeeded()
        initBgView()
        initControllers()
        initSafeView()
        
        addController(editVC)
        self.mainViewHeighContraint.constant = ParkingMainViewController.defaultBottomViewHeight
    }
    
    func initBgView() {
        let maskPath = UIBezierPath.init(roundedRect: bgView.bounds, byRoundingCorners: UIRectCorner(rawValue: UIRectCorner.topLeft.rawValue | UIRectCorner.topRight.rawValue), cornerRadii: CGSize(width: 20, height: 20))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bgView.bounds
        maskLayer.path = maskPath.cgPath
        maskLayer.lineWidth = 2
        maskLayer.fillColor = UIColor.white.cgColor
        maskLayer.strokeColor = UIColor.gray.cgColor
        bgView.layer.addSublayer(maskLayer)
    }
    
    func initControllers() {
        editVC = ParkingEditWireFrame.create()
        homeVC = ParkingHomeWireFrame.create()
        parkingsVC = ParkingParkingsWireFrame.create()
        rfidVC = ParkingRfidWireFrame.create()
    }
    
    func initSafeView() {
        var safeBottom: CGFloat = 0.0
        if #available(iOS 11.0, *) {
            if let app = UIApplication.shared.delegate as? AppDelegate {
                safeBottom = app.window?.safeAreaInsets.bottom ?? 0
            }
        }
        self.mainViewBottomMaringContraint.constant = safeBottom
    }
    
    // MARK: - Init Data
    
    func initData() {
        initEvent()
        requestLocation()
        self.presenter?.start()
    }

    // MARK: - Action
    
    @IBAction func homeAction() {
        self.replaceController(self.currentVC, newController: homeVC)
        self.mainViewHeighContraint.constant = ParkingMainViewController.defaultBottomViewHeight
    }
    
    @IBAction func parkAction() {
        self.replaceController(self.currentVC, newController: parkingsVC)
        self.mainViewHeighContraint.constant = ParkingMainViewController.defaultBottomViewHeight
    }
    
    @IBAction func rfidAction() {
        self.replaceController(self.currentVC, newController: rfidVC)
        self.mainViewHeighContraint.constant = ParkingMainViewController.rfidBottomViewHeight
    }
    
    @IBAction func historyAction() {
        let navigationController = UINavigationController(rootViewController: ParkingOrdersWireFrame.create())
        self.present(navigationController, animated: true)
    }
    
    @IBAction func contactAction() {
        let navigationController = UINavigationController(rootViewController: ParkingContactWireFrame.create())
        self.present(navigationController, animated: true)
    }
    
    @IBAction func closeControllerAction() {
        self.dismiss(animated: true)
    }
    
    // MARK: - Private
    
    func initEvent() {
        SwiftEventBus.onMainThread(self, name: "parkingEnterHome") { result in
            let plate: String = result?.object as! String
            self.replaceController(self.currentVC, newController: self.homeVC)
            self.actionView.isHidden = false
            let vc = self.homeVC as! ParkingHomeViewController
            vc.setCurrentPlate(plate)
        }
    }
    
    func requestLocation() {
        AHLocationManager.shared.startPositioning(self)
        AHLocationManager.shared.locationType = .WGS
        AHLocationManager.shared.postionUpdateClosure = {[weak self] (locModel) in
            if locModel.locationError != nil {
                // fail
            } else {
                if let coordinate = locModel.coordinate {
                    ParkingManage.shared.saveLocation(coordinate)
                }
            }
        }
    }
    
    override public var controllerHeight: CGFloat {
        return ParkingMainViewController.rfidBottomViewHeight
    }
}

extension ParkingMainViewController: ParkingMainViewProtocol {

    func isActive() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
}

extension ParkingMainViewController {
    
    func addController(_ child: UIViewController)  {
        self.containerView.addSubview(child.view)
        self.addChild(child)
        child.didMove(toParent: self)
        self.currentVC = child
    }
    
    func replaceController(_ oldController: UIViewController, newController: UIViewController)
    {
        if oldController == newController {
            return
        }
        self.addChild(newController)
        self.transition(from: oldController, to: newController, duration: 0.2, options:UIView.AnimationOptions.repeat, animations: nil) { (finished:Bool) -> Void in
            if finished {
                self.containerView.addSubview(newController.view)
                newController.didMove(toParent: self)
                
                oldController.willMove(toParent: self)
                oldController.view.removeFromSuperview()
                oldController.removeFromParent()
                self.currentVC = newController
            } else {
                self.currentVC = oldController
            }
        }
    }
}
