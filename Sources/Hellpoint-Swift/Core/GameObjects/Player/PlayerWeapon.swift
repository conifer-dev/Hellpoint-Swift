import Raylib

struct PlayerWeapon : GameObject {
// ========================================================================================================

    lazy var texture: Texture2D = Resources.manager.loadedResourcesDatabase["rifle"]!
    var position: Vector2
    var scale: Vector2

    internal var destRect: Rectangle = Rectangle()
    internal var sourceRect: Rectangle = Rectangle()

// ========================================================================================================

    init(position: Vector2, scale: Vector2) {
        self.position = position
        self.scale = scale
    }

// ========================================================================================================
    mutating func update(deltaTime dt: Float) {

    }

    mutating func render() {
        self.sourceRect = Rectangle(x: 0, y:0, width: 0, height:0)
        self.destRect = Rectangle(x: 0, y:0, width: 0, height:0)
        Raylib.drawTexture(self.texture, Int32(position.x), Int32(position.y), .white)
    }
}
