protocol GameObject {
    @inlinable mutating func update(deltaTime dt: Float)

    @inlinable mutating func render()
}