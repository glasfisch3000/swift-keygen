extension PEMEncoder {
    /// A set of errors that can occur while PEM-encoding a cryptographic key.
    public enum EncodingError: Error {
        case utf8EncodingFailed
    }
}
