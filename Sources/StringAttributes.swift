//
//  StringAttributes.swift
//  StringAttributes
//
//  Created by Dmitry Nesterenko on 05/09/2017.
//  Copyright © 2017 chebur. All rights reserved.
//

import UIKit

public typealias StringAttributes = [NSAttributedString.Key: Any]

extension Dictionary where Key == NSAttributedString.Key, Value == Any {
    
    public init(_ builder: (inout StringAttributes) -> Void) {
        self.init()
        builder(&self)
    }
    
    public var font: UIFont? {
        get {
            return self[.font] as? UIFont
        }
        set {
            self[.font] = newValue
        }
    }
    
    public var paragraphStyle: NSParagraphStyle? {
        get {
            return self[.paragraphStyle] as? NSParagraphStyle
        }
        set {
            self[.paragraphStyle] = newValue
        }
    }
    
    public var foregroundColor: UIColor? {
        get {
            return self[.foregroundColor] as? UIColor
        }
        set {
            self[.foregroundColor] = newValue
        }
    }
    
    public var backgroundColor: UIColor? {
        get {
            return self[.backgroundColor] as? UIColor
        }
        set {
            self[.backgroundColor] = newValue
        }
    }
    
    public var kern: CGFloat? {
        get {
            return self[.kern] as? CGFloat
        }
        set {
            self[.kern] = newValue
        }
    }
    
    public var strikethroughStyle: NSUnderlineStyle? {
        get {
            if let rawValue = self[.strikethroughStyle] as? Int {
                return NSUnderlineStyle(rawValue: rawValue)
            } else {
                return nil
            }
        }
        set {
            self[.strikethroughStyle] = newValue?.rawValue
        }
    }
    
    public var underlineStyle: NSUnderlineStyle? {
        get {
            if let rawValue = self[.underlineStyle] as? Int {
                return NSUnderlineStyle(rawValue: rawValue)
            } else {
                return nil
            }
        }
        set {
            self[.underlineStyle] = newValue?.rawValue
        }
    }
    
    public var textEffect: NSAttributedString.TextEffectStyle? {
        get {
            if let string = self[.textEffect] as? String {
                return NSAttributedString.TextEffectStyle(rawValue: string)
            } else {
                return nil
            }
        }
        set {
            self[.textEffect] = newValue?.rawValue
        }
        
    }
    
    public var link: URL? {
        get {
            return self[.link] as? URL
        }
        set {
            self[.link] = newValue
        }
    }
    
    public var baselineOffset: CGFloat? {
        get {
            return self[.baselineOffset] as? CGFloat
        }
        set {
            self[.baselineOffset] = baselineOffset
        }
    }
    
    public var underlineColor: UIColor? {
        get {
            return self[.underlineColor] as? UIColor
        }
        set {
            self[.underlineColor] = newValue
        }
    }
    
    public var strikethroughColor: UIColor? {
        get {
            return self[.strikethroughColor] as? UIColor
        }
        set {
            self[.strikethroughColor] = newValue
        }
    }
    
    public var shadow: NSShadow? {
        get {
            return self[.shadow] as? NSShadow
        }
        set {
            self[.shadow] = newValue
        }
    }
    
    public var alignment: NSTextAlignment? {
        get {
            return paragraphStyle?.alignment
        }
        set {
            paragraphStyle = (self.paragraphStyle ?? NSParagraphStyle()).with {
                $0.alignment = newValue ?? .natural
            }
        }
    }
    
    public var lineSpacing: CGFloat? {
        get {
            return paragraphStyle?.lineSpacing
        }
        set {
            paragraphStyle = (self.paragraphStyle ?? NSParagraphStyle()).with {
                $0.lineSpacing = newValue ?? 0
            }
        }
    }
    
    public var paragraphSpacing: CGFloat? {
        get {
            return paragraphStyle?.paragraphSpacing
        }
        set {
            paragraphStyle = (self.paragraphStyle ?? NSParagraphStyle()).with {
                $0.paragraphSpacing = newValue ?? 0
            }
        }
    }
    
}
