//
//  String+Extension.swift
//  StringAttributes
//
//  Created by Dmitry Nesterenko on 05/09/2017.
//  Copyright © 2017 chebur. All rights reserved.
//

import Foundation

extension String {
    
    public func with(_ attributes: StringAttributes) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }
    
}
