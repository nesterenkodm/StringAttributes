//
//  String+Extension.swift
//  StringAttributes
//
//  Created by Dmitry Nesterenko on 05/09/2017.
//  Copyright © 2017 chebur. All rights reserved.
//

import Foundation

extension String {
    
    /// Removes specified characters from string
    public func replacing(charactersIn characterSet: CharacterSet, with replacement: String) -> String {
        return components(separatedBy: characterSet).joined(separator: replacement)
    }
    
    public func contains(charactersIn characterSet: CharacterSet, options: String.CompareOptions = []) -> Bool {
        return rangeOfCharacter(from: characterSet, options: options) != nil
    }
    
    public func with(_ attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }
    
    /// Returns the same string but with lowercased first character
    public func lcfirst() -> String {
        return withFirstCharacter { $0.lowercased() }
    }
    
    /// Returns the same string but with uppercased first character
    public func ucfirst() -> String {
        return withFirstCharacter { $0.uppercased() }
    }
    
    /// Apply transformation to a first character in a string
    private func withFirstCharacter(transform: (Substring) -> (String)) -> String {
        guard let index = self.index(startIndex, offsetBy: 1, limitedBy: endIndex) else { return self }
        let range = startIndex..<index
        let firstCharacter = transform(self[range])
        return replacingCharacters(in: range, with: firstCharacter)
    }
    
    public func rangesOfCharacters(from characterSet: CharacterSet, options: String.CompareOptions) -> [Range<String.Index>] {
        var searchRange = startIndex..<endIndex
        var ranges = [Range<String.Index>]()
        while let range = rangeOfCharacter(from: characterSet, options: options, range: searchRange) {
            ranges.append(range)
            searchRange = range.upperBound..<endIndex
        }
        
        return ranges.reduce(into: [Range<String.Index>]()) {
            if let last = $0.last, last.upperBound == $1.lowerBound {
                _ = $0.removeLast()
                $0.append(last.lowerBound..<$1.upperBound)
            } else {
                $0.append($1)
            }
        }
    }
    
    public func appending(_ attrString: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString(string: self)
        result.append(attrString)
        return result.copy() as! NSAttributedString // swiftlint:disable:this force_cast
    }
    
}
