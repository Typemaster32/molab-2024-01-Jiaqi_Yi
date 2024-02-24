import SwiftUI
import WebKit
import ZIPFoundation

struct ZipContentView: View {
    var sourceURL: URL
    
    // Destination directory URL for unzipped content
    var destinationDirectoryURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("UnzippedContent")
    }
    
    var body: some View {
        WebView(url: destinationDirectoryURL.appendingPathComponent("index.html"))
            .onAppear {
                unzipAndPrepareContent()
            }
    }
    
    func unzipAndPrepareContent() {
        do {
            try unzipFile(at: sourceURL, to: destinationDirectoryURL)
            // Additional logic to handle the unzipped content can be added here
        } catch {
            print("An error occurred during unzipping: \(error)")
        }
    }
    
    func unzipFile(at sourceURL: URL, to destinationDirectoryURL: URL) throws {
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: destinationDirectoryURL.path) {
            try fileManager.createDirectory(at: destinationDirectoryURL, withIntermediateDirectories: true, attributes: nil)
        }
        try fileManager.unzipItem(at: sourceURL, to: destinationDirectoryURL)
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
