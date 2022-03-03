import Raylib
import Aeni

struct Player : GameObject {
// ======================================================================================================== 

    var velocity: Vector2 = Vector2(x: 0, y: 0)
    var movementSpeed: Float = 250
    var sprite: Sprite = Sprite(spriteSheet: Resources.manager.loadedResourcesDatabase["playerSpriteSheet"]!, frameDimensions: Vector2(x: 24, y:24), scale: Vector2(x:2, y:2), position: Vector2(x: 50, y: 50))
    var isMoving: Bool = false

// ======================================================================================================== 

    // Animations
    lazy var idle: SpriteAnimator = SpriteAnimator(sprite: sprite, origin: Vector2(x: 0, y: 3), rotation: 0, startingFrame: 0, endingFrame: 4, column: 0, duration: 0, animationSpeed: 0.15, repeatable: true, tintColor: .white, debugMode: true)
    lazy var running: SpriteAnimator = SpriteAnimator(sprite: sprite, origin: Vector2(x: 0, y: 3), rotation: 0, startingFrame: 0, endingFrame: 6, column: 1, duration: 0, animationSpeed: 0.11, repeatable: true, tintColor: .white, debugMode: true)
    lazy var animation = self.idle

    mutating func update(deltaTime dt: Float) {
        animation.update(deltaTime: dt)
        self.playerMovement(deltaTime: dt)
        self.rotatePlayerOnMousePos()
    }

    mutating func render() {
        self.animation.render()
    }

    mutating func playerMovement(deltaTime dt: Float) {
        self.isMoving = false
        self.velocity.x = 0
        self.velocity.y = 0


        if Raylib.isKeyDown(.letterD) {
            self.velocity.x += 1
            self.animation.flipSprite(horizontal: false, vertical: false)
            self.isMoving = true
        }

        if Raylib.isKeyDown(.letterA) {
            self.velocity.x -= 1
            self.animation.flipSprite(horizontal: true, vertical: false)
            self.isMoving = true
        }

        if Raylib.isKeyDown(.letterW) {
            self.velocity.y -= 1
        }

        if Raylib.isKeyDown(.letterS) {
            self.velocity.y += 1
        }

        self.velocity = self.velocity.normalized()
        self.sprite.position.x += self.velocity.x * self.movementSpeed * dt
        self.sprite.position.y += self.velocity.y * self.movementSpeed * dt

    }

    mutating func rotatePlayerOnMousePos() {
        let mousePosX = Raylib.getMouseX()

        if !self.isMoving {
            if Float(mousePosX) > self.sprite.position.x {
                self.animation.flipSprite(horizontal: false, vertical: false)
            } else {
                self.animation.flipSprite(horizontal: true, vertical: false)
            }
        } else {
            return
        }
    }
}