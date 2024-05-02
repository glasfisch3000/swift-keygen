import RegexBuilder

extension CharacterClass {
    public static func + (lhs: Self, rhs: Self) -> Self {
        lhs.union(rhs)
    }
}

extension RegexComponent where Self == CharacterClass {
    public static var base64: CharacterClass { .anyOf("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/") }
}
