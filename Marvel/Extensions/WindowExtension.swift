//
//  WindowExtension.swift
//  Marvel
//
//  Created by Angelo Esquibel on 4/16/21.
//

import UIKit

extension UIWindow {
    
    func transitionTo(rootViewController: UIViewController, animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard animated else {
            self.rootViewController = rootViewController
            makeKeyAndVisible()
            return
        }
        
        UIView.transition(with: self,
                          duration: 0.3,
                          options: [.transitionCrossDissolve],
                          animations: { [weak self] in
                            guard let self = self else { return }
                            let oldState: Bool = UIView.areAnimationsEnabled
                            UIView.setAnimationsEnabled(false)
                            self.rootViewController = rootViewController
                            UIView.setAnimationsEnabled(oldState)
                            self.makeKeyAndVisible()
            },
                          completion: completion)
    }
    
}
