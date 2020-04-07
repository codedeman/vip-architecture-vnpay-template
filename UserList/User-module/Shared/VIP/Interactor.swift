//
//  Interactor.swift
//  SwiftBaseProject
//
//  Created by PHAM TUAN on 3/19/20.
//  Copyright © 2020 PHAM TUAN. All rights reserved.
//

import Foundation

public protocol Interactable: class {
    
}

open class Interactor: Interactable {
    
    /// Initializer.
    public init() {
        // No-op
    }
    
    /// The interactor did become active.
    ///
    /// - note: This method is driven by the attachment of this interactor's owner router. Subclasses should override
    ///   this method to setup subscriptions and initial states.
    open func didBecomeActive() {
        // No-op
    }
    
    /// Callend when the `Interactor` will resign the active state.
    ///
    /// This method is driven by the detachment of this interactor's owner router. Subclasses should override this
    /// method to cleanup any resources and states of the `Interactor`. The default implementation does nothing.
    open func willResignActive() {
        // No-op
    }
}
