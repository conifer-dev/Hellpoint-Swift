import Raylib
import Aeni

protocol GameObject {
    var position: Vector2 { get set }
    var velocity: Vector2 { get set }
    var movementSpeed: Int16 { get set }
    var sprite: Sprite { get set }

    mutating func update(dt: Float)

    func render()
}