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
        //    }
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            let cssString = """
            body {
              display: flex !important;
              justify-content: center !important;
              align-items: center !important;
              height: 100vh !important;
              margin: 0 !important;
            }
            canvas, main {
              max-width: 100% !important;
              max-height: 100vh !important;
              margin: 0 auto !important;
            }
            """

            let jsString = """
            if (document.querySelector('nav.preview-nav')) {
                document.querySelector('nav.preview-nav').style.display = 'none';
            }
            var style = document.createElement('style');
            style.type = 'text/css';
            style.textContent = `\(cssString)`;
            document.head.appendChild(style);
            null; // Explicitly return null to avoid unsupported type errors
            """

            webView.evaluateJavaScript(jsString, completionHandler: { result, error in
                if let error = error {
                    print("Error injecting CSS: \(error.localizedDescription)")
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
struct CenteredWebView: View {
    var url: URL
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    P5jsView(url:url) // Assuming this is your WKWebView representable
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8) // Example to control size
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
