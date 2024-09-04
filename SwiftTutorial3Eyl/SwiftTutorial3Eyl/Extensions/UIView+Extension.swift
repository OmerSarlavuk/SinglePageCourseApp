//
//  UIView+Extension.swift
//  SwiftTutorial3Eyl
//
//  Created by Ahlatci on 4.09.2024.
//

import UIKit

extension UIView {
    func onTap(handler: @escaping VoidCallback) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
        objc_setAssociatedObject(self, &AssociatedKeys.tapHandler, handler, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        guard let handler = objc_getAssociatedObject(self, &AssociatedKeys.tapHandler) as? () -> Void else { return }
        handler()
    }
}
private struct AssociatedKeys {
    static var tapHandler = "tapHandler"
}




