//
//  NSParagraphStyle+Extension.swift
//  StringAttributes
//
//  Created by Dmitry Nesterenko on 05/09/2017.
//  Copyright © 2017 chebur. All rights reserved.
//

import UIKit

extension NSParagraphStyle {
    
    public func with(transformer: (NSMutableParagraphStyle) -> Void) -> NSParagraphStyle {
        let copy = mutableCopy() as! NSMutableParagraphStyle // swiftlint:disable:this force_cast
        transformer(copy)
        return copy.copy() as! NSParagraphStyle // swiftlint:disable:this force_cast
    }
    
}
