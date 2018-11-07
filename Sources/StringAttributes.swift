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
            return self[NSAttributedString.Key.font] as? UIFont
        }
        set {
            self[NSAttributedString.Key.font] = newValue
        }
    }
    
    public var paragraphStyle: NSParagraphStyle? {
        get {
            return self[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle
        }
        set {
            self[NSAttributedString.Key.paragraphStyle] = newValue
        }
    }
    
    public var foregroundColor: UIColor? {
        get {
            return self[NSAttributedString.Key.foregroundColor] as? UIColor
        }
        set {
            self[NSAttributedString.Key.foregroundColor] = newValue
        }
    }
    
    public var backgroundColor: UIColor? {
        get {
            return self[NSAttributedString.Key.backgroundColor] as? UIColor
        }
        set {
            self[NSAttributedString.Key.backgroundColor] = newValue
        }
    }
    
    public var kern: CGFloat? {
        get {
            return self[NSAttributedString.Key.kern] as? CGFloat
        }
        set {
            self[NSAttributedString.Key.kern] = newValue
        }
    }
    
    public var underlineStyle: NSUnderlineStyle? {
        get {
            if let rawValue = self[NSAttributedString.Key.underlineStyle] as? Int {
                return NSUnderlineStyle(rawValue: rawValue)
            } else {
                return nil
            }
        }
        set {
            self[NSAttributedString.Key.underlineStyle] = newValue?.rawValue
        }
    }
    
    public var textEffect: NSAttributedString.TextEffectStyle? {
        get {
            if let string = self[NSAttributedString.Key.textEffect] as? String {
                return NSAttributedString.TextEffectStyle(rawValue: string)
            } else {
                return nil
            }
        }
        set {
            self[NSAttributedString.Key.textEffect] = newValue?.rawValue
        }
        
    }
    
    public var link: URL? {
        get {
            return self[NSAttributedString.Key.link] as? URL
        }
        set {
            self[NSAttributedString.Key.link] = newValue
        }
    }
    
    public var underlineColor: UIColor? {
        get {
            return self[NSAttributedString.Key.underlineColor] as? UIColor
        }
        set {
            self[NSAttributedString.Key.underlineColor] = newValue
        }
    }
    
    public var shadow: NSShadow? {
        get {
            return self[NSAttributedString.Key.shadow] as? NSShadow
        }
        set {
            self[NSAttributedString.Key.shadow] = newValue
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
    
    public func asDictionary() -> [String: Any] {
        return reduce(into: [String: Any]()) { $0[$1.key.rawValue] = $1.value }
    }
    
}
