import SwiftUI
import Foundation

//By ChatGPT, modified
class FolderContentManager: ObservableObject {
    //ObservableObject is for some objects that needs to change and live update others.
    //ObservableObejct only requires an @Published property.
    @Published var namesOfFiles: [(name: String, link: String)] = []
    //@Published means this property is notifying everybody when it changes
    init() {
        loadContent()
    }
    
    
    func loadContent() {
        do {
            let folders = try listFolders(in: "Sketches")
            DispatchQueue.main.async {
                self.namesOfFiles = folders
            }
            //This means the thread is done in main
        } catch {
            print("Failed to load folder contents: \(error)")
            //error is defined by default
        }
    }
}


struct ContentView: View {
    @StateObject private var contentManager = FolderContentManager()
    //@StateObject is tied with ObservableObject to hold the source of the truth.
    //private means it could only be changed within this scope.
    
    var body: some View {
        VStack{
            NavigationView {
                List(contentManager.namesOfFiles, id: \.name) { file in
                    // \.name means Key Path. Here it serves as the unique identifier.
                    // This iterates over files, using file as the identifier for the current element.
                    // Assuming file.name contains the filename without path
                    if let fileURL = Bundle.main.url(forResource: file.name, withExtension: nil, subdirectory: "Sketches") {
                        NavigationLink(destination: WebContentView(sourceURL: fileURL, title: file.name)) {
                            Text(adjustedName(from: file.name))
                                .lineLimit(1)
                        }
                        //withExtension: "zip" causes "invalid file"
                    } else {
                        // Fallback content in case the URL couldn't be constructed
                        Text("Invalid file: \(file.name)")
                    }
                }
                .navigationTitle("P5.js Reader").onAppear {
                    contentManager.loadContent()
                    //                print("Content Manager Files: \(contentManager.namesOfFiles)")
                }
            }
//            Button("Take Screenshot") {
//                let screenshot = self.snapshot()
//                
//                // Save the screenshot to the Photos album
//                UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)
//            }
        }
    }
}



enum FolderListError: Error {
    case unableToAccessDirectory(reason: String)
}

//By ChatGPT, modified
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
//    print("Found zip files: \(zipFileTuples)")
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


extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
