import SwiftUI
import WebKit
//written by ChatGPT
struct WebView: UIViewRepresentable {
    var url: URL
    
    // Creates the WKWebView and configures it.
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator // To intercept navigation events.
        return webView
    }
    
    // Loads the webpage when the view is updated or initially set up.
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    // Sets up a coordinator to handle events from the WKWebView.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // The Coordinator class implements WKNavigationDelegate to react to web navigation events.
    //    class Coordinator: NSObject, WKNavigationDelegate {
    //        var parent: WebView
    //
    //        init(_ parent: WebView) {
    //            self.parent = parent
    //        }
    //
    //        // Executes JavaScript to hide a specific element once the page finishes loading.
    //        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    //            let jsString = "document.querySelector('nav.preview-nav').style.display = 'none';"
    //            webView.evaluateJavaScript(jsString, completionHandler: nil)
    //        }
    //    }
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // JavaScript to center the canvas
            let centerCanvasScript = """
                (function() {
                  const canvas = document.querySelector('canvas');
                  if (canvas) {
                    console.log('Canvas found, attempting to center');
                    canvas.style.position = 'absolute';
                    canvas.style.top = '50%';
                    canvas.style.left = '50%';
                    canvas.style.transform = 'translate(-50%, -50%)';
                  } else {
                    console.log('Canvas not found');
                  }
                })();
                """
            let jsString = "document.querySelector('nav.preview-nav').style.display = 'none';"
            webView.evaluateJavaScript(jsString, completionHandler: nil)
            webView.evaluateJavaScript(centerCanvasScript, completionHandler: { (result, error) in
                if let error = error {
                    print("JavaScript execution error: \(error.localizedDescription)")
                }
            })
        }
    }
}

// This ContentView struct wraps the FullScreenP5jsView and applies modifiers.
struct P5jsView: View {
    var url: URL
    var body: some View {
        WebView(url:url)
            .edgesIgnoringSafeArea(.all) // Forces the WebView to extend under the safe areas.
    }
}


#Preview {
    ContentView()
}
