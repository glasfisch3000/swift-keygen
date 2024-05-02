/// Outputs a key with a given encoding format to a specified destination.
public func printKey(_ key: any CryptoKey, with encoder: any KeyEncoder, to destination: KeyOutputDestination) throws {
    switch destination {
    case .stdout(let descriptor):
        if let descriptor = descriptor {
            print(descriptor.description + ":")
        }
        print(try encoder.encodeString(key: key))
    case .file(let url):
        let data = try encoder.encodeData(key: key)
        try data.write(to: url)
    }
}
