
import SwiftUI

struct ContentView: View {
    let pages = [
        ("Test", "https://editor.p5js.org/YiJiaqi/full/trRb53Fns"),
        ("Dune", "https://editor.p5js.org/YiJiaqi/full/ie1cz0Ou-"),
        // Add more pages as needed
    ]
    
    var body: some View {
        NavigationView {
            List(pages, id: \.0) { page in
                NavigationLink(destination: P5jsView(url: URL(string: page.1)!)) {
                    Text(page.0)
                }
            }
            .navigationTitle("P5.js Reader")
        }
    }
}
#Preview {
    ContentView()
}
