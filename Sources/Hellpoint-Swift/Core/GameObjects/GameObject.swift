import Raylib
import Aeni

protocol GameObject {
// ======================================================================================================== 

    var velocity: Vector2 { get set }
    var movementSpeed: Float { get set }
    var sprite: Sprite { get set }

// ======================================================================================================== 
    @inlinable mutating func update(deltaTime dt: Float)

    @inlinable mutating func render()
}