//
//  String+Ext.swift
//  PatternEditor
//
//  Created by Weerawut Chaiyasomboon on 07/05/2568.
//

import Foundation

extension String {
    var isValidIdentifier: Bool {
        //Not Empty
        guard !self.isEmpty else { return false }
        
        //Is letter or underscore
        let firstCharacter = self.first!
        if !firstCharacter.isLetter && firstCharacter != "_" {
            return false
        }
        
        //Remaining Characters are either letter, digit, or underscore
        let validCharacters = self.allSatisfy {
            $0.isLetter || $0.isNumber || $0 == "_"
        }
        if !validCharacters {
            return false
        }
        
        return true
    }
}
