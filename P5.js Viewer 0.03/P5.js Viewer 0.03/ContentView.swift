import SwiftUI
import Foundation


class FolderContentManager: ObservableObject {
    @Published var namesOfFiles: [(name: String, link: String)] = []
    
    init() {
        loadContent()
    }
    
    
    func loadContent() {
        do {
            
            let folders = try listFolders(in: "Sketches")
            DispatchQueue.main.async {
                self.namesOfFiles = folders
            }
        } catch {
            print("Failed to load folder contents: \(error)")
        }
    }
}

struct ContentView: View {
    @StateObject private var contentManager = FolderContentManager()

    var body: some View {
        NavigationView {
            List(contentManager.namesOfFiles, id: \.name) { file in
                // Assuming file.name contains the filename without path
                if let fileURL = Bundle.main.url(forResource: file.name, withExtension: nil, subdirectory: "Sketches") {
                    NavigationLink(destination: ZipContentView(sourceURL: fileURL)) {
                        Text(adjustedName(from: file.name))
                            .lineLimit(1)
                    }
                } else {
                    // Fallback content in case the URL couldn't be constructed
                    Text("Invalid file: \(file.name)")
                }
            }
            .navigationTitle("P5.js Reader").onAppear {
                contentManager.loadContent()
                print("Content Manager Files: \(contentManager.namesOfFiles)")
            }
        }
    }
}



enum FolderListError: Error {
    case unableToAccessDirectory(reason: String)
}

func listFolders(in directoryName: String) throws -> [(name: String, link: String)] {
    guard let directoryURL = Bundle.main.url(forResource: directoryName, withExtension: nil) else {
        throw FolderListError.unableToAccessDirectory(reason: "Directory \(directoryName) not found in the bundle.")
    }
    
    let fileManager = FileManager.default
    let fileURLs = try fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil)
    
        // Filter for .zip files only
    let zipFiles = fileURLs.filter { $0.pathExtension == "zip" }
    
        // Create tuples of file name and path for each zip file
    let zipFileTuples = zipFiles.map { (name: $0.lastPathComponent, link: $0.path) }
    
    if zipFileTuples.isEmpty {
        throw FolderListError.unableToAccessDirectory(reason: "No zip files found in the directory \(directoryName).")
    }
    print("Found zip files: \(zipFileTuples)")
    return zipFileTuples
}


func adjustedName(from name: String) -> String {
    let maxLength = 40 // Define the max length of the string
    let suffixToRemove = ".zip" // Example suffix to remove
    var adjustedName = name
    
        // Remove the suffix if present
    if adjustedName.hasSuffix(suffixToRemove) {
        adjustedName = String(adjustedName.dropLast(suffixToRemove.count))
    }
    
        // Truncate the string to maxLength characters
    if adjustedName.count > maxLength {
        adjustedName = String(adjustedName.prefix(maxLength))
    }
    
    return adjustedName // (Removed) Add ellipsis to indicate truncation
}





#Preview {
    ContentView()
}
