//
//  PatternGrid.swift
//  PatternEditor
//
//  Created by Weerawut Chaiyasomboon on 07/05/2568.
//

import SwiftUI

struct PatternGrid: View {
    let n: Int
    @Binding var pattern: [[Bool]]
    let enabled: Bool
    
    var selectedColor: Color {
        enabled ? .red : .gray.opacity(0.5)
    }
    
    var deselectedColor: Color {
        enabled ? .white : .gray.opacity(0.2)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<n, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<n, id: \.self) { col in
                        let center: Bool = row == n/2 && col == n/2
                        let borderColor: Color = center ? .red : .black
                        let borderWidth: CGFloat = center ? 3 : 1
                        
                        Rectangle()
                            .fill(pattern[row][col] ? selectedColor : deselectedColor)
                            .aspectRatio(contentMode: .fit)
                            .border(borderColor, width: borderWidth)
                            .onTapGesture {
                                if enabled {
                                    withAnimation {
                                        pattern[row][col].toggle()
                                    }
                                }
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    PatternGrid(
        n: 15,
        pattern: .constant(
            Array(
                repeating: Array(repeating: false, count: 15),
                count: 15
            )
        ),
        enabled: true
    )
}
