//
//  FDJRouterProtocol.swift
//  FDJRouterSwift_Example
//
//  Created by mac on 2019/12/27.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

public protocol FDJNavigation {
    
    func configNavigationBar()
    
    //dismiss
    func close(info:[String:Any]?)
    //navigation pop
    func back(info:[String:Any]?)
    //navigation pop
    func backToURL(url:String)
    
}

public protocol FDJTabBar {
    
    func configTabbar()
    
}

public typealias RouterConstructor = ([String:Any]?)->FDJRouterProtocol

public protocol FDJRouterProtocol:UIViewController, FDJNavigation, FDJTabBar {

    init(params:[String:Any]?)
    
    func preferredPresentationStyle() -> UIModalPresentationStyle
    
    var openType:PageOpenType { set get }
    var pageUrl:String { set get }
    
    static var constructor : RouterConstructor { get }
    
}

extension FDJRouterProtocol where Self:UIViewController {
    
    var pageUrl : String {
        set {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "PageUrl".hashValue)
            objc_setAssociatedObject(self, key, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
        
        get {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "PageUrl".hashValue)
            if let url = objc_getAssociatedObject(self, key) as? String {
                return url
            }else {
                return ""
            }
        }
    }
    
    var openType : PageOpenType {
        set {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "PageOpenType".hashValue)
            objc_setAssociatedObject(self, key, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
        
        get {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "PageOpenType".hashValue)
            if let type = objc_getAssociatedObject(self, key) as? PageOpenType {
                return type
            }else {
                return .unknown
            }
            
        }
    }
    
    static var constructor : RouterConstructor {
        get {
            return { (params) -> FDJRouterProtocol in
                return Self(params: params)
            }
        }
    }
    
    func preferredPresentationStyle() -> UIModalPresentationStyle {
        if #available(iOS 13.0, *) {
            return .automatic
        }else {
            return .fullScreen
        }
    }
}

extension FDJNavigation where Self:UIViewController {
    
    func configNavigationBar() {
        
    }
    
    func close(info:[String:Any]?) {
        self.navigationController?.closeClosure?(info)
    }
    
    func back(info:[String:Any]?) {
        self.closeClosure?(info)
        self.navigationController?.popViewController(animated: true)
    }
    
    func backToURL(url:String) {
        
        for vc in self.navigationController?.viewControllers ?? [] {
            
            guard vc is FDJRouterProtocol else {
                continue
            }
            
            if (vc as! FDJRouterProtocol).pageUrl == url {
                self.navigationController?.popToViewController(vc, animated: true)
                break
            }
        }
    }
}

extension FDJTabBar where Self:UIViewController {
    
    func configTabbar() {
        
    }
    
}

extension UIViewController {
    
    var closeClosure : FinishClosure? {
        
        set {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "CloseClosure".hashValue)
            objc_setAssociatedObject(self, key, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
        
        get {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "CloseClosure".hashValue)
            if let closure = objc_getAssociatedObject(self, key) as? FinishClosure{
                return closure
            }else {
                return nil
            }
        }
        
    }
    
}

class FDJNavigationController : UINavigationController {
    
}

