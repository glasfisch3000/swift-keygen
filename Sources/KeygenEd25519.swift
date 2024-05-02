import Foundation
import ArgumentParser
import Crypto

struct KeygenEd25519: ParsableCommand {
    @Option(name: [.customShort("f"), .long]) var outputFormat: ParsableKeyEncoding = .base64
    
    @Option(name: [.customLong("outPriv", withSingleDash: true)], completion: .file()) var outFilePrivateKey: URL?
    @Option(name: [.customLong("outPub", withSingleDash: true)], completion: .file()) var outFilePublicKey: URL?
    
    mutating func run() throws {
        let key = keygen_ed25519()
        
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
        
        let destination: KeyOutputDestination = if let url = outFilePrivateKey {
            .file(url)
        } else if withDescriptor {
            .stdout(isPrivate ? .privateKey : .publicKey)
        } else {
            .stdout(nil)
        }
        
        try printKey(key, with: encoder, to: destination)
    }
}