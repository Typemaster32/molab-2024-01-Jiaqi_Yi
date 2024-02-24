import SwiftUI
import WebKit

struct FullScreenWebView: View {
    var sourceURL: URL
    
    var body: some View {
        ZStack {
            WebView(url: sourceURL)
                .edgesIgnoringSafeArea(.all) // Make WebView fill the entire screen
        }
        .navigationBarHidden(true) // Attempt to hide the navigation bar if within a navigation view
        .navigationBarBackButtonHidden(true) // Hide the back button specifically
    }
}
