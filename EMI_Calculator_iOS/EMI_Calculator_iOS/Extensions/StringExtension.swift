//
//  StringExtension.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import Foundation

extension String {
    
    /// Removes leading/trailing whitespaces, newlines, and collapses multiple spaces or line breaks into a single space.
    var trimmed: String {
        // 1. Trim leading/trailing whitespaces and newlines
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString
    }
    
    /// Removes leading/trailing whitespaces, newlines, and collapses multiple spaces or line breaks into a single space.
    var trimmedClean: String {
        // 1. Trim leading/trailing whitespaces and newlines
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // 2. Replace multiple spaces, tabs, and newlines with a single space using regex
        let cleaned = trimmed.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
        
        return cleaned
    }
    
}
