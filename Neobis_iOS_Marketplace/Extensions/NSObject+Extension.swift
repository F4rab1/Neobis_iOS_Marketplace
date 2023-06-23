//
//  NSObject+Extension.swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 24.06.2023.
//

import Foundation
import UIKit

extension NSObject {
    public func computedWidth(_ value: Float) -> Float {
        Float((UIScreen.main.bounds.width / 375)) * value
    }
    
    public func computedHeight(_ value: Float) -> Float {
        Float((UIScreen.main.bounds.height / 812)) * value
    }
}
