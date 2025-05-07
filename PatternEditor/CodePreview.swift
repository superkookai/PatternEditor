//
//  CodePreview.swift
//  PatternEditor
//
//  Created by Weerawut Chaiyasomboon on 07/05/2568.
//

import SwiftUI

struct CodePreview: View {
    let name: String
    let codeString: String
    
    var body: some View {
        Group {
            if name.isEmpty {
                ContentUnavailableView("Name your Pattern", systemImage: "pencil")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.red.opacity(0.2))
            } else {
                ScrollView {
                    HStack {
                        Text(codeString)
                            .font(.largeTitle)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                }
                .padding()
                .background(.blue.opacity(0.2))
                .clipShape(.rect(cornerRadius: 15))
                .onDrag {
                    NSItemProvider(object: codeString as NSItemProviderWriting)
                }
            }
        }
    }
}

#Preview {
    CodePreview(name: "pattern", codeString:
"""
if name.isEmpty {
    ContentUnavailableView("Name your Pattern", systemImage: "pencil")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red.opacity(0.2))
} else {
    ScrollView {
        Text(codeString)
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
    }
    .padding()
    .background(.blue.opacity(0.2))
    .clipShape(.rect(cornerRadius: 15))
}
"""
    )
}
