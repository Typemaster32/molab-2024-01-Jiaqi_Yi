    //
    //  ContentManager.swift
    //  P5.js Viewer 0.01
    //
    //  Created by Jiaqi Yi on 2/15/24.
    //

import Foundation
import ZIPFoundation
import WebKit

class ViewSketch: UIViewController {
    var zipFilePath: URL?
    var fileNameToDelete: String?
    
        // Custom initializer
    init(zipFilePath: URL, fileNameToDelete: String) {
        self.zipFilePath = zipFilePath
        self.fileNameToDelete = fileNameToDelete
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // You can now use zipFilePath and fileNameToDelete as needed
    }
    
    func unzipFile(at sourceURL: URL, to destinationURL: URL) throws {
        let fileManager = FileManager()
            // Creates a directory at the destination URL if it doesn't exist.
        try fileManager.createDirectory(at: destinationURL, withIntermediateDirectories: true, attributes: nil)
            // Attempts to unzip the file from the source URL to the destination URL.
        try fileManager.unzipItem(at: sourceURL, to: destinationURL)
    }
    
        // Deletes a specified file within a given directory.
    func deleteFile(named fileName: String, in directoryURL: URL) throws {
        let fileManager = FileManager()
            // Constructs the full path for the file to be deleted.
        let filePath = directoryURL.appendingPathComponent(fileName).path
            // Checks if the file exists and deletes it if present.
        if fileManager.fileExists(atPath: filePath) {
            try fileManager.removeItem(atPath: filePath)
        }
    }
    
        // Verifies that the specified directory contains only one HTML file named 'index.html'.
    func verifyIndexHtml(in directoryURL: URL) throws {
        let fileManager = FileManager()
            // Retrieves the contents of the directory.
        let contents = try fileManager.contentsOfDirectory(atPath: directoryURL.path)
            // Filters the contents to find HTML files.
        let htmlFiles = contents.filter { $0.hasSuffix(".html") }
        
            // Throws an error if there isn't exactly one 'index.html' file.
        guard htmlFiles.count == 1, htmlFiles.contains("index.html") else {
            throw NSError(domain: "YourAppErrorDomain", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Folder must contain exactly one HTML file named 'index.html'."])
        }
    }
    
        // Loads 'index.html' from a specified directory into a WKWebView.
    func openIndexHtml(from directoryURL: URL) {
            // Constructs the full path to 'index.html'.
        let indexPath = directoryURL.appendingPathComponent("index.html")
            // Creates a URLRequest for 'index.html'.
        let request = URLRequest(url: indexPath)
        
            // Initializes a WKWebView to display the content.
        let webView = WKWebView(frame: self.view.frame)
            // Loads 'index.html' into the WKWebView.
        webView.load(request)
            // Adds the WKWebView as a subview of the view controller's main view.
        self.view.addSubview(webView)
    }
    
        // Orchestrates the process of handling a zip file by unzipping it, deleting 'p5.js', verifying 'index.html', and displaying it.
    func handleZipFile(at zipFileURL: URL) {
            // Defines a destination URL within the app's document directory for the unzipped content.
        let destinationURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("UnzippedContent")
        
        do {
                // Tries to unzip the file.
            try unzipFile(at: zipFileURL, to: destinationURL)
                // Tries to delete 'p5.js' if it exists.
            try deleteFile(named: "p5.js", in: destinationURL)
                // Verifies the presence and exclusivity of 'index.html'.
            try verifyIndexHtml(in: destinationURL)
                // Attempts to open 'index.html' in a web view.
            openIndexHtml(from: destinationURL)
        } catch {
                // Prints any errors that occur during the process.
            print("An error occurred: \(error)")
                // Further error handling could be implemented here.
        }
    }
}
