import SwiftUI
import WebKit

// Define the P5JSView struct to embed a WKWebView in your SwiftUI view
struct P5JSView: UIViewRepresentable {
    // Directly use the provided URL
    let url: URL = URL(string: "https://editor.p5js.org/YiJiaqi/full/trRb53Fns")!

    // Create the WKWebView without any configuration
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    // Load the request when the view updates
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct CroppedWebView: View {
    var body: some View {
        ZStack(alignment: .top) {
            P5JSView()
            Rectangle()
                .frame(height: 42)
                .foregroundColor(.white)
        }
    }
}

#Preview{
    CroppedWebView()
}
//struct WebViewWithBorder: View {
//    var body: some View {
//        P5JSView()
//            .border(Color.blue, width: 4) // Apply border here
//            .cornerRadius(8) // Optional: if you want rounded corners
//            .padding() // Optional: adds some space around the border
//    }
//}


// Define a PreviewProvider for P5JSView
//struct P5JSView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Use P5JSView in the preview
//        P5JSView()
//            .edgesIgnoringSafeArea(.all) // Optional: Makes the web view use all available space
//    }
//}

//class CustomWebView: WKWebView {
//    // Call this method to adjust the web content's top margin
//    func adjustContentInset(top: CGFloat) {
//        let script = "document.body.style.marginTop = '\(top)px';"
//        self.evaluateJavaScript(script)
//    }
//    
//    // Refresh the current page
//    func refreshPage() {
//        self.reload()
//    }
//}



