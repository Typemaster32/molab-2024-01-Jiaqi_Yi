//
//  Test Page 02.swift
//  Test01
//
//  Created by Jiaqi Yi on 2/10/24.
//

import SwiftUI
import WebKit

struct FullScreenP5jsView: UIViewRepresentable {
    let url: URL = URL(string: "https://editor.p5js.org/YiJiaqi/full/trRb53Fns")!
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        // Configure the WKWebView to run JavaScript when the page loads
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: FullScreenP5jsView
        
        init(_ parent: FullScreenP5jsView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // JavaScript string to hide the <nav> element
            let jsString = "document.querySelector('nav.preview-nav').style.display = 'none';"
            
            // Execute the JavaScript on the page
            webView.evaluateJavaScript(jsString, completionHandler: nil)
        }
    }
}

struct WebViewContainer: View {
    var body: some View {
        FullScreenP5jsView()
            .edgesIgnoringSafeArea(.all) // This makes the WebView use the full screen area
    }
}

struct WebViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        WebViewContainer()
    }
}


