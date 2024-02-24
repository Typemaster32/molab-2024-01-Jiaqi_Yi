
import SwiftUI

struct ContentView: View {
    let pages = [
        ("Test", "https://editor.p5js.org/YiJiaqi/full/trRb53Fns"),
        ("Dune", "https://editor.p5js.org/YiJiaqi/full/ie1cz0Ou-"),
        ("Arrival","https://editor.p5js.org/YiJiaqi/full/3cjrIW4-D"),
        ("Test02","https://zhiyangwang.hosting.nyu.edu/hh/week3/"),
        // Add more pages as needed
    ]
    
    var body: some View {
//        let _ = Self._printChanges()
        NavigationView {
            List(pages, id: \.0) { page in
                NavigationLink(destination: CenteredWebView(url: URL(string: page.1)!)) {
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
