import SwiftUI
import WebKit
import ZIPFoundation

struct UnzipAndPrepare: View {
    var sourceURL: URL
    
    // State to hold the current URL for the WebView
    @State private var currentWebViewURL: URL? = nil
    
    // Destination directory URL for unzipped content
    var destinationDirectoryURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("UnzippedContent")
    }
    
    var body: some View {
        // Use the currentWebViewURL for the WebView, providing a fallback if it's nil
        WebView(url: currentWebViewURL ?? URL(string: "index.html")!)
            .onAppear {
                unzipAndPrepareContent()
            }
    }
    
    func unzipAndPrepareContent() {
        let uniqueSubdirectoryName = sourceURL.deletingPathExtension().lastPathComponent
        let uniqueDestinationURL = destinationDirectoryURL.appendingPathComponent(uniqueSubdirectoryName)

        do {
            try unzipFile(at: sourceURL, to: uniqueDestinationURL)
            // Update the state to reflect the new location of the content
            let indexPath = uniqueDestinationURL.appendingPathComponent("index.html")
            if FileManager.default.fileExists(atPath: indexPath.path) {
                self.currentWebViewURL = indexPath
            } else {
                print("index.html does not exist at expected location: \(indexPath.path)")
            }
        } catch {
            print("An error occurred during unzipping: \(error)")
        }
    }
    
    func unzipFile(at sourceURL: URL, to destinationDirectoryURL: URL) throws {
        let fileManager = FileManager.default
        
        // Check if the destination directory exists, and delete it if it does
        if fileManager.fileExists(atPath: destinationDirectoryURL.path) {
            try fileManager.removeItem(at: destinationDirectoryURL)
        }
        
        // Create the directory fresh before unzipping
        try fileManager.createDirectory(at: destinationDirectoryURL, withIntermediateDirectories: true, attributes: nil)
        
        try fileManager.unzipItem(at: sourceURL, to: destinationDirectoryURL)
    }

}


