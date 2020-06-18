//
//  BaseViewController.swift
//  IgSDK
//
//  Created by apple on 2018/9/3.
//  Copyright © 2018年 itgoo. All rights reserved.
//

import UIKit
import StatusProvider
import KRProgressHUD
import Async

extension UIViewController: StatusController {
    
    public func showLoadingView() {
        show(status: Status(isLoading: true, description: R.string.parkingLocalizable.loading()))
    }
    
    public func hideLoadingView() {
        show(status: Status(isLoading: false, description: nil))
    }
    
    public func showErrorView(withMessage message: String? = nil, completion: (() -> Void)? = nil) {
        let status = Status(title: message, description: "", actionTitle: R.string.parkingLocalizable.retryLoadData()) {
            completion?()
        }
        show(status: status)
    }
    
    public func hideStatusView() {
        hideStatus()
    }
}

extension UIViewController {
    
    public func showProgressStatus(withMessage message: String? = nil, completion: (() -> Void)? = nil) {
        KRProgressHUD.show(withMessage: message) {
            completion?()
        }
    }
    
    public func hideProgressStatus(completion: (() -> Void)? = nil) {
        KRProgressHUD.dismiss {
            completion?()
        }
    }
    
    public func showSuccessStatus(withMessage message: String? = nil, completion: (() -> Void)? = nil) {
        KRProgressHUD.showSuccess(withMessage: message)
        Async.main(after: 0.5) {
            completion?()
        }
    }
    
    public func showErrorStatus(withMessage message: String? = nil, completion: (() -> Void)? = nil) {
        KRProgressHUD.showError(withMessage: message)
        Async.main(after: 0.5) {
            completion?()
        }
    }
}

extension UIViewController {
    
    private struct AssociatedKey {
        static var clicked: Bool = false
    }

    public var clicked: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.clicked) as? Bool ?? false
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKey.clicked, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    public func checkClicked() -> Bool {
        if (clicked) {
            return false
        }

        clicked = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.clicked = false
        }
        return true
    }
}
