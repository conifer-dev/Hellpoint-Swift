import Raylib

protocol Projectile {
}

struct Bullets : GameObject, Projectile {

// ========================================================================================================

    var position: Vector2 = .zero
    var speed: Float = 600
    var texture: Texture2D = Resources.manager.loadedResourcesDatabase["bullet"]!
    var projectiles: [Bullets] = []

// ========================================================================================================
    mutating func update(deltaTime dt: Float) {
        for var bullet in self.projectiles {
            bullet.position.x += bullet.speed * dt
            bullet.position.y += bullet.speed * dt
        }
    }

    mutating func render() {
        Raylib.drawTexture(self.texture, Int32(self.position.x), Int32(self.position.y), .white)
    }

    mutating func spawnBullets(dt: Float) {
        self.projectiles.insert(self, at: projectiles.endIndex)
    }
}