//
//  CustomAlignmentGuideExample.swift
//  LayoutAndGeometry
//
//  Created by SCOTT CROWDER on 2/26/24.
//

import SwiftUI

extension VerticalAlignment {
    enum CustomVerticalAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let customVerticalAlignment = VerticalAlignment(CustomVerticalAlignment.self)
}

struct CustomAlignmentGuideExample: View {
    var body: some View {
        HStack(alignment: .customVerticalAlignment) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.customVerticalAlignment) { d in
                        d[VerticalAlignment.customVerticalAlignment]
                    }
                    .padding(.top, 10)
                    .background(Color.yellow)
                Label("", systemImage: "person.circle.fill")
                    .font(.system(size: 64))
            }
            .border(.purple)
            
            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.customVerticalAlignment) { d in
                        d[.top]
                    }
                    .font(.largeTitle)
                    .background(Color.green)
            }
        }
        .border(Color.red, width: 2)
    }
}

#Preview {
    CustomAlignmentGuideExample()
}
