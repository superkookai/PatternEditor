//
//  ContentView.swift
//  PatternEditor
//
//  Created by Weerawut Chaiyasomboon on 07/05/2568.
//

import SwiftUI

struct ContentView: View {
    let n: Int
    
    @State private var name: String = "pattern"
    @State private var pattern: [[Bool]] = []
    
    var formattedPoints: String {
        var result: String = ""
        
        for i in 0..<n {
            for j in 0..<n where pattern[i][j] {
                let x = j - n/2
                let y = i - n/2
                result += "\t(\(x), \(y)),\n"
            }
        }
        
        return result
    }
    
    var codeString: String {
        """
        case .\(name):
        return [\(formattedPoints)]
        """
    }
    
    init(n: Int) {
        self.n = n
        self._pattern = State(
            initialValue: Array(
                repeating: Array(repeating: false, count: n),
                count: n
            )
        )
    }
    
    var body: some View {
        HStack {
            PatternEditorView(n: n, name: $name, pattern: $pattern)
            
            if name.isValidIdentifier {
                CodePreview(name: name, codeString: codeString)
            }
        }
        .frame(minWidth: 800, minHeight: 600)
    }
}

#Preview {
    ContentView(n: 15)
}

