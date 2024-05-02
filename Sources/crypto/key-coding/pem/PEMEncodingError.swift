/// A set of errors that can occur while PEM-encoding a cryptographic key.
public enum PEMEncodingError: Error {
    case utf8EncodingFailed
}
