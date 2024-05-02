/// An cryptographic key type identifier viable for use in the PEM key format.
public enum PEMContentType: String {
    case anyPrivateKey = "ANY PRIVATE KEY"
    case certificate = "CERTIFICATE"
    case certificateRequest = "CERTIFICATE REQUEST"
    case cms = "CMS"
    case dhParameters = "DH PARAMETERS"
    case dsaParameters = "DSA PARAMETERS"
    case dsaPublicKey = "DSA PUBLIC KEY"
    case ecParameters = "EC PARAMETERS"
    case ecPrivateKey = "EC PRIVATE KEY"
    case ecdsaPublicKey = "ECDSA PUBLIC KEY"
    case encryptedPrivateKey = "ENCRYPTED PRIVATE KEY"
    case parameters = "PARAMETERS"
    case pcks7SignedData = "PKCS #7 SIGNED DATA"
    case pcks7 = "PKCS7"
    case privateKey = "PRIVATE KEY"
    case publicKey = "PUBLIC KEY"
    case rsaPrivateKey = "RSA PRIVATE KEY"
    case sslSessionParameters = "SSL SESSION PARAMETERS"
    case trustedCertificate = "TRUSTED CERTIFICATE"
    case x509CRL = "X509 CRL"
    case x9_42DHParameters = "X9.42 DH PARAMETERS"
    
    // legacy
    case dsaPrivateKey = "DSA PRIVATE KEY"
    case newCertificateRequest = "NEW CERTIFICATE REQUEST"
    case rsaPublicKey = "RSA PUBLIC KEY"
    case x509Certificate = "X509 CERTIFICATE"
}

extension PEMContentType: Hashable { }
extension PEMContentType: Codable { }

extension PEMContentType: Identifiable {
    public var id: String { rawValue }
}
