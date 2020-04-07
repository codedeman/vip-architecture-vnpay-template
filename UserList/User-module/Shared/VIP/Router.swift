//
//  Router.swift
//  SwiftBaseProject
//
//  Created by PHAM TUAN on 3/19/20.
//  Copyright © 2020 PHAM TUAN. All rights reserved.
//

import Foundation

public protocol Routing: class {

}

open class Router<ViewControllerType>: Routing {
    
    public let uiviewController: ViewControllerType
    
    public init(viewController: ViewControllerType) {
        self.uiviewController = viewController
    }
    
}
