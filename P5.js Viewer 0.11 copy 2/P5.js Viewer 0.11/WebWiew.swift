import SwiftUI
import WebKit
import ZIPFoundation

struct WebView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }
        
        // Function to take a screenshot of the WebView
        func takeSnapshot(_ webView: WKWebView, completion: @escaping (UIImage?) -> Void) {
            let config = WKSnapshotConfiguration()
            // Configuration adjustments (e.g., specifying rect) can be made here

            webView.takeSnapshot(with: config) { image, error in
                guard let image = image, error == nil else {
                    // Handle error
                    print(error?.localizedDescription ?? "Unknown error")
                    completion(nil)
                    return
                }
                completion(image)
            }
        }
    }
}


