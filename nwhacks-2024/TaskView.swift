//
//  TaskView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        
        Grid {
            GridRow {
                TaskButton(icon: Image("cat"))
                TaskButton(icon: Image("cat"))
            }
            .padding()
            GridRow {
                TaskButton(icon: Image("cat"))
                TaskButton(icon: Image("cat"))
            }
            .padding()
            GridRow {
                TaskButton(icon: Image("cat"))
                TaskButton(icon: Image("cat"))
            }
            .padding()
        }
    }
}

#Preview {
    TaskView()
}
