//
//  FDJRouter.swift
//  FDJRouterSwift_Example
//
//  Created by mac on 2019/12/27.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public enum PageOpenType : Int8 {
    case unknown
    case push
    case present
    case auto
}

public typealias FinishClosure = ([String : Any]?)->Void

open class FDJRouter: NSObject {
    
    public lazy var tabBarController : UITabBarController = {
        let tabVC = UITabBarController()
        tabVC.delegate = self
        return tabVC
    }()
    
    private lazy var constructors : [String:RouterConstructor] = {
        return [String:RouterConstructor]()
    }()
    
    public static let instance : FDJRouter = { return FDJRouter() }()
    
    public func register(url:String, constructor:@escaping RouterConstructor) {
        self.constructors[url] = constructor
    }
    
    public func setupRootPages(rootURLs:[String]) {
        
        var rootVCs : [UIViewController] = []
        
        for url in rootURLs {
            
            if let vc = self.getVC(url: url, params: nil) {
                let nav = FDJNavigationController(rootViewController: vc)
                nav.delegate = self
                
                vc.configTabbar()
                
                rootVCs.append(nav)
            }

        }
        
        self.tabBarController.viewControllers = rootVCs
    }
    
    public func openURL(url:String, type:PageOpenType, params:[String:Any]?, finish:FinishClosure?) {
        switch type {
        case .push:
            self.pushURL(url: url, params: params, finish: finish)
        case .present:
            self.presentURL(url: url, params: params, finish: finish)
        case .auto:
            if let pushURL = URL(string:url), let currentURL = self.currentURL() {
                if (currentURL.host == pushURL.host) && (pushURL.path.contains(currentURL.path) || pushURL.path == currentURL.path) {
                    self.pushURL(url: url, params: params, finish: finish)
                }else {
                    self.presentURL(url: url, params: params, finish: finish)
                }
            }
        case .unknown: break
        }
    }
    
    private func pushURL(url:String, params:[String:Any]?, finish:FinishClosure?) {
        
        if let pushURL = URL(string:url), let currentURL = self.currentURL() {
            if (currentURL.host == pushURL.host) && (pushURL.path.contains(currentURL.path) || pushURL.path == currentURL.path)  {
                
                if let vc = self.getVC(url: url, params: params) {
                    vc.hidesBottomBarWhenPushed = true
                    vc.closeClosure = finish
                    vc.openType = .push
                    let nav = self.currentNav()
                    
                    nav.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    private func presentURL(url:String, params:[String:Any]?, finish:FinishClosure?) {
        
        if let vc = self.getVC(url: url, params: params) {
            vc.hidesBottomBarWhenPushed = true
            vc.closeClosure = finish
            vc.openType = .present
            
            let modelStyle = vc.preferredPresentationStyle()
            
            let nav = self.currentNav()
            let presentNav = FDJNavigationController(rootViewController: vc)
            presentNav.closeClosure = finish
            presentNav.delegate = self
            presentNav.modalPresentationStyle = modelStyle
            
            nav.present(presentNav, animated: true, completion: nil)
        }
        
    }
    
    private func getVC(url:String, params:[String:Any]?) -> FDJRouterProtocol? {
        
        if let constructor = self.constructors[url] {
            let vc = constructor(params)
            vc.pageUrl = url
            return vc
        }else {
            return nil
        }
        
    }
    
    private func currentNav() -> FDJNavigationController {
        
        var nav = self.tabBarController.selectedViewController;
        
        var resultNav : FDJNavigationController = nav as! FDJNavigationController
        while let presented = nav?.presentingViewController {
            nav = presented.presentingViewController
            
            if nav is FDJNavigationController {
                resultNav = (nav as! FDJNavigationController)
            }
        }
        
        return resultNav
        
    }
    
    private func currentURL() -> URL? {
        let nav = self.currentNav()
        
        if let top = nav.topViewController as? FDJRouterProtocol {
            return URL(string:top.pageUrl)
        }else {
            return nil
        }
    }
    
}

extension FDJRouter : UITabBarControllerDelegate {
    open func tabBarControllerSupportedInterfaceOrientations(_ tabBarController: UITabBarController) -> UIInterfaceOrientationMask {
        return tabBarController.selectedViewController?.supportedInterfaceOrientations ?? .portrait
    }
        
    open func tabBarControllerPreferredInterfaceOrientationForPresentation(_ tabBarController: UITabBarController) -> UIInterfaceOrientation {
        return tabBarController.selectedViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }
}

extension FDJRouter : UINavigationControllerDelegate {
    
    open func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if let routerVC = viewController as? FDJRouterProtocol {
            routerVC.configNavigationBar()
        }
    }
    
    open func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    open func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return navigationController.topViewController?.supportedInterfaceOrientations ?? .portrait
    }
    
    open func navigationControllerPreferredInterfaceOrientationForPresentation(_ navigationController: UINavigationController) -> UIInterfaceOrientation {
        return navigationController.topViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }
    
}
