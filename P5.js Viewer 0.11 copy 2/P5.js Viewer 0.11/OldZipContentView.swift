import SwiftUI
import WebKit
import ZIPFoundation

struct OldZipContentView: View {
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
        print("Unzipping: \(sourceURL)")
        let uniqueSubdirectoryName = sourceURL.deletingPathExtension().lastPathComponent
        let uniqueDestinationURL = destinationDirectoryURL.appendingPathComponent(uniqueSubdirectoryName)

        do {
            try unzipFile(at: sourceURL, to: uniqueDestinationURL)
            // Additional logic to handle the unzipped content can be added here
        } catch {
            print("An error occurred during unzipping: \(error)")
        }
        let indexPath = uniqueDestinationURL.appendingPathComponent("index.html")
        if !FileManager.default.fileExists(atPath: indexPath.path) {
            print("index.html does not exist at expected location: \(indexPath.path)")
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

struct OldWebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

