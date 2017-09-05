//
//  NSParagraphStyle+Extension.swift
//  StringAttributes
//
//  Created by Dmitry Nesterenko on 05/09/2017.
//  Copyright © 2017 chebur. All rights reserved.
//

import UIKit

extension NSParagraphStyle {
    
    public func with(transformer: (NSMutableParagraphStyle) -> ()) -> NSParagraphStyle {
        let copy = mutableCopy() as! NSMutableParagraphStyle
        transformer(copy)
        return copy.copy() as! NSParagraphStyle
    }
    
}
