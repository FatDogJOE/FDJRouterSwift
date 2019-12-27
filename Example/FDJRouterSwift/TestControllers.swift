//
//  TestControllers.swift
//  FDJRouterSwift_Example
//
//  Created by mac on 2019/12/27.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class TestController1 : UIViewController, FDJRouterProtocol {
    
    required init(params: [String : Any]?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func configNavigationBar() {
        self.navigationItem.title = "VC1"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openClicked))
    }
    
    @objc func openClicked() {
        FDJRouter.instance.openURL(url: "https://www.router.com/path1/path4", type: .auto, params: nil, finish: nil)
    }
    
}

class TestController2 : UIViewController, FDJRouterProtocol {
    
    required init(params: [String : Any]?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func configNavigationBar() {
        self.navigationItem.title = "VC2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openClicked))
    }
    
    @objc func openClicked() {
        
    }
    
}

class TestController3 : UIViewController, FDJRouterProtocol {
    
    required init(params: [String : Any]?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func configNavigationBar() {
        self.navigationItem.title = "VC3"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openClicked))
    }
    
    @objc func openClicked() {
        
    }
}

class TestController4 : UIViewController, FDJRouterProtocol {
    
    required init(params: [String : Any]?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func configNavigationBar() {
        self.navigationItem.title = "VC4"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openClicked))
    }
    
    @objc func openClicked() {
        FDJRouter.instance.openURL(url: "https://www.router.com/path2/path5", type: .auto, params: nil, finish: nil)
    }
    
}

class TestController5 : UIViewController, FDJRouterProtocol {
    
    required init(params: [String : Any]?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func configNavigationBar() {
        self.navigationItem.title = "VC5"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openClicked))
    }
    
    @objc func openClicked() {
        
    }
}

class TestController6 : UIViewController, FDJRouterProtocol {
    
    required init(params: [String : Any]?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func configNavigationBar() {
        self.navigationItem.title = "VC6"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openClicked))
    }
    
    @objc func openClicked() {
        
    }
}

class TestController7 : UIViewController, FDJRouterProtocol {
    
    required init(params: [String : Any]?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func configNavigationBar() {
        self.navigationItem.title = "VC7"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openClicked))
    }
    
    @objc func openClicked() {
        
    }
}

class TestController8 : UIViewController, FDJRouterProtocol {
    
    required init(params: [String : Any]?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func configNavigationBar() {
        self.navigationItem.title = "VC8"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openClicked))
    }
    
    @objc func openClicked() {
        
    }
    
}

class TestController9 : UIViewController, FDJRouterProtocol {
    
    required init(params: [String : Any]?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func configNavigationBar() {
        self.navigationItem.title = "VC9"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openClicked))
    }
    
    @objc func openClicked() {
        
    }
    
}

