//
//  PatternEditorView.swift
//  PatternEditor
//
//  Created by Weerawut Chaiyasomboon on 07/05/2568.
//

import SwiftUI

struct PatternEditorView: View {
    let n: Int
    @Binding var name: String
    @Binding var pattern: [[Bool]]
    
    var body: some View {
        VStack {
            Text("Pattern Editor")
                .font(.largeTitle.bold())
            
            Text("Tap a cell to toggle its state")
                .font(.title2)
                .foregroundStyle(.secondary)
            
            VStack(alignment: .trailing) {
                HStack {
                    Text("Name:")
                    
                    TextField("Enter pattern name", text: $name)
                        .frame(maxWidth: 300)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(name.isEmpty ? .red : .gray, lineWidth: name.isEmpty ? 3 : 1)
                        }
                    
                    Button("Clear", systemImage: "arrow.uturn.backward") {
                        withAnimation {
                            pattern = Array(repeating: Array(repeating: false, count: n), count: n)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    .padding()
                }
                .font(.title2)
                
                if !name.isValidIdentifier {
                    Text("Invalid Identifier")
                        .font(.callout.bold())
                        .foregroundStyle(.red)
                        .padding([.horizontal, .bottom])
                }
            }
            
            PatternGrid(n: n, pattern: $pattern, enabled: name.isValidIdentifier)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    PatternEditorView(
        n: 15,
        name: .constant("pattern"),
        pattern: .constant(
            Array(
                repeating: Array(repeating: false, count: 15),
                count: 15
            )
        )
    )
}


