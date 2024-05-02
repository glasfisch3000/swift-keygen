import Foundation
import ArgumentParser

extension URL: ExpressibleByArgument {
    public init?(argument: String) {
        if #available(macOS 13.0, *) {
            self.init(filePath: argument, relativeTo: .currentDirectory())
        } else {
            self.init(fileURLWithPath: argument)
        }
    }
}
