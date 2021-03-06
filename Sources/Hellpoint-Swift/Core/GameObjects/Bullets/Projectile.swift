import Raylib
import Foundation

struct Projectile {

// ========================================================================================================

    var position: Vector2
    var velocity: Vector2
    var shotAngle: Float = 0
    var speed: Float = 600
    var texture: Texture2D = Resources.manager.loadedResourcesDatabase["bullet"]!

    init(position: Vector2, velocity: Vector2) {
        self.position = position
        self.velocity = velocity
        self.shotAngle = atan2(velocity.y, velocity.x).asDegrees()
    }

// ========================================================================================================

    mutating func update(deltaTime dt: Float) {
        self.position = self.position + velocity.scale(self.speed * dt)
    }

    mutating func render() {
        let rect = Rectangle(x: position.x, y: position.y, width:15, height: 5)
        Raylib.drawTexture(texture, Int32(position.x), Int32(position.y), .white)
    }

}