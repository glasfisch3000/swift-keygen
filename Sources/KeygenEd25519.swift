import Foundation
import ArgumentParser
import Crypto

struct KeygenEd25519: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "ed25519"
    )
    
    @Option(help: "(Optional) The private key file to read from.") var source: URL?
    
    @Option(name: [.customShort("f"), .customLong("format")], help: "Output key encoding format.") var outputFormat: ParsableKeyEncoding = .base64
    
    @Option(name: [.customLong("outPriv", withSingleDash: true)], help: "The private key output file.", completion: .file()) var outFilePrivateKey: URL?
    @Option(name: [.customLong("outPub", withSingleDash: true)], help: "The public key output file.", completion: .file()) var outFilePublicKey: URL?
    
    mutating func run() throws {
        let key = if let source = source {
            try keyread_private_ed25519(url: source)
        } else {
            keygen_ed25519()
        }
        
        let printDescriptors = outFilePrivateKey == nil && outFilePublicKey == nil
        try printSingleKey(key, withDescriptor: printDescriptors, isPrivate: true)
        try printSingleKey(key.publicKey, withDescriptor: printDescriptors, isPrivate: false)
    }
    
    func printSingleKey(_ key: any CryptoKey, withDescriptor: Bool, isPrivate: Bool) throws {
        let encoder: any KeyEncoder
        switch outputFormat {
        case .base64: encoder = Base64Encoder()
        case .pem: encoder = PEMEncoder(contentType: isPrivate ? .ecPrivateKey : .publicKey)
        }
        
        let url = isPrivate ? outFilePrivateKey : outFilePublicKey
        let destination = if let url = url {
            KeyOutputDestination.file(url)
        } else if withDescriptor {
            KeyOutputDestination.stdout(isPrivate ? .privateKey : .publicKey)
        } else {
            KeyOutputDestination.stdout(nil)
        }
        
        try printKey(key, with: encoder, to: destination)
    }
}
