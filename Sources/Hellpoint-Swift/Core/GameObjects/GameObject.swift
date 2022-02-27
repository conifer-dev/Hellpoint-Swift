import Raylib
import Aeni

protocol GameObject {
    var velocity: Vector2 { get set }
    var movementSpeed: Float { get set }
    var sprite: Sprite { get set }

    mutating func update()

    mutating func render()
}