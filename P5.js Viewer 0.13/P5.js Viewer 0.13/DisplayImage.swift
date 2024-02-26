//import AppKit
//
//func showImageInWindow(image: NSImage) {
//    let window = NSWindow(
//        contentRect: NSRect(x: 0, y: 0, width: image.size.width, height: image.size.height),
//        styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
//        backing: .buffered, defer: false)
//    window.center() // This method automatically centers the window on the screen.
//    window.title = "Image Preview"
//    
//    let imageView = NSImageView(frame: window.contentView!.bounds)
//    imageView.image = image
//    imageView.autoresizingMask = [.width, .height] // Ensure the imageView resizes with the window.
//    window.contentView?.addSubview(imageView)
//    
//    window.makeKeyAndOrderFront(nil) // Show the window
//    NSApp.activate(ignoringOtherApps: true) // Bring your app to the foreground
//}

// Usage example:
// Assuming `myImage` is your NSImage instance
// showImageInWindow(image: myImage)
