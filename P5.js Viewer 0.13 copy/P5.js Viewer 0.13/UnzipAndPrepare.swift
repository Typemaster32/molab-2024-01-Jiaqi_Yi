import SwiftUI
import WebKit
import ZIPFoundation

func unzipContent(sourceURL: URL, completion: @escaping (URL?) -> Void) {
    let fileManager = FileManager.default
    let destinationDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("UnzippedContent")
    let uniqueSubdirectoryName = sourceURL.deletingPathExtension().lastPathComponent
    let uniqueDestinationURL = destinationDirectoryURL.appendingPathComponent(uniqueSubdirectoryName)
    
    // Check if the directory already exists
    if fileManager.fileExists(atPath: uniqueDestinationURL.path) {
        do {
            // Attempt to remove the existing directory to avoid the error
            try fileManager.removeItem(at: uniqueDestinationURL)
        } catch {
            print("An error occurred while removing existing directory: \(error)")
            completion(nil)
            return
        }
    }
    
    do {
        // Proceed with creating the directory and unzipping
        try fileManager.createDirectory(at: uniqueDestinationURL, withIntermediateDirectories: true, attributes: nil)
        try fileManager.unzipItem(at: sourceURL, to: uniqueDestinationURL)
        
        let indexPath = uniqueDestinationURL.appendingPathComponent("index.html")
        if fileManager.fileExists(atPath: indexPath.path) {
            DispatchQueue.main.async {
                completion(indexPath) // Successfully unzipped
            }
        } else {
            print("index.html does not exist at expected location: \(indexPath.path)")
            completion(nil)
        }
    } catch {
        print("An error occurred during unzipping: \(error)")
        completion(nil)
    }
}


//func unzipContent(sourceURL: URL, completion: @escaping (URL?) -> Void) {
//    let destinationDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("UnzippedContent")
//    let uniqueSubdirectoryName = sourceURL.deletingPathExtension().lastPathComponent
//    let uniqueDestinationURL = destinationDirectoryURL.appendingPathComponent(uniqueSubdirectoryName)
//    
//    do {
//        try FileManager.default.createDirectory(at: uniqueDestinationURL, withIntermediateDirectories: true, attributes: nil)
//        try FileManager.default.unzipItem(at: sourceURL, to: uniqueDestinationURL)
//        let indexPath = uniqueDestinationURL.appendingPathComponent("index.html")
//        if FileManager.default.fileExists(atPath: indexPath.path) {
//            DispatchQueue.main.async {
//                completion(indexPath)
//            }
//        } else {
//            print("Unzipping failed or index.html not found")
//            completion(nil)
//        }
//    } catch {
//        print("An error occurred during unzipping: \(error)")
//        completion(nil)
//    }
//}

//By ChatGPT, modified
//struct UnzipAndPrepare: View {
//    var sourceURL: URL
//    
//    // State to hold the current URL for the WebView
//    @State private var currentWebViewURL: URL? = nil
//    
//    // Destination directory URL for unzipped content
//    var destinationDirectoryURL: URL {
//        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("UnzippedContent")
//    }
//    
//    var body: some View {
//        // Use the currentWebViewURL for the WebView, providing a fallback if it's nil
//        WebView(url: currentWebViewURL ?? URL(string: "index.html")!)
//            .onAppear {
//                unzipAndPrepareContent()
//            }
//    }
//    
//    func unzipAndPrepareContent() {
//        let uniqueSubdirectoryName = sourceURL.deletingPathExtension().lastPathComponent
//        let uniqueDestinationURL = destinationDirectoryURL.appendingPathComponent(uniqueSubdirectoryName)
//
//        do {
//            try unzipFile(at: sourceURL, to: uniqueDestinationURL)
//            // Update the state to reflect the new location of the content
//            let indexPath = uniqueDestinationURL.appendingPathComponent("index.html")
//            if FileManager.default.fileExists(atPath: indexPath.path) {
//                self.currentWebViewURL = indexPath
//            } else {
//                print("index.html does not exist at expected location: \(indexPath.path)")
//            }
//        } catch {
//            print("An error occurred during unzipping: \(error)")
//        }
//    }
//    
//    func unzipFile(at sourceURL: URL, to destinationDirectoryURL: URL) throws {
//        let fileManager = FileManager.default
//        
//        // Check if the destination directory exists, and delete it if it does
//        if fileManager.fileExists(atPath: destinationDirectoryURL.path) {
//            try fileManager.removeItem(at: destinationDirectoryURL)
//        }
//        
//        // Create the directory fresh before unzipping
//        try fileManager.createDirectory(at: destinationDirectoryURL, withIntermediateDirectories: true, attributes: nil)
//        
//        try fileManager.unzipItem(at: sourceURL, to: destinationDirectoryURL)
//    }
//
//}


