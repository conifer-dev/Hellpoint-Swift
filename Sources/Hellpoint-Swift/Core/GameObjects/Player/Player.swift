import Raylib
import Aeni
import Foundation

struct Player : GameObject {
// ======================================================================================================== 

    // Player properties
    var velocity: Vector2 = Vector2(x: 0, y: 0)
    var movementSpeed: Float = 300
    var sprite: Sprite = Sprite(spriteSheet: Resources.manager.loadedResourcesDatabase["playerSpriteSheet"]!, frameDimensions: Vector2(x: 24, y:24), scale: Vector2(x:2, y:2), position: Vector2(x: 50, y: 50))
    var isMoving: Bool = false

    //Player Weapon
    lazy var weaponTexture: Texture2D = Resources.manager.loadedResourcesDatabase["rifle"]!
    lazy var weaponDestRect = Rectangle()
    lazy var weaponSourceRect = Rectangle()
    var weaponScale: Float = 1.5
    var aimVector: Vector2 = Vector2()
    var aimAngle: Float = 0

    // Bullets
    var projectileArray = [Projectile]()

// ========================================================================================================

    // Animations.
    lazy var idle: SpriteAnimator = SpriteAnimator(sprite: sprite, origin: Vector2(x: 0, y: 3), rotation: 0, startingFrame: 0, endingFrame: 4, column: 0, duration: 0, animationSpeed: 0.15, repeatable: true, tintColor: .white, debugMode: false)
    lazy var running: SpriteAnimator = SpriteAnimator(sprite: sprite, origin: Vector2(x: 0, y: 3), rotation: 0, startingFrame: 0, endingFrame: 6, column: 1, duration: 0, animationSpeed: 0.11, repeatable: true, tintColor: .white, debugMode: false)
    lazy var animation = self.idle

// ========================================================================================================
    // Updated player & its assets
    mutating func update(deltaTime dt: Float) {
        self.animation.update(deltaTime: dt)
        self.playerMovement(deltaTime: dt)
        self.rotatePlayerOnMousePos()
        self.rotateWeaponOnMousePos()
        self.updateWeapon()

        if Raylib.isMouseButtonPressed(.left) {
            projectileArray.append(Projectile(position: self.sprite.position, velocity: aimVector))
        }

        for bullet in projectileArray.indices {
            projectileArray[bullet].update(deltaTime: dt)
        }
    }

    // Rendering of player & its assets.
    mutating func render() {
        self.renderWeapon()
        self.animation.render()

        for bullet in projectileArray.indices {
            projectileArray[bullet].render()
        }
    }

    // Player movement.
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

        self.keepInScreenBounds()
    }

    // Rotate player based on mouse location e.g. left or right the player sprite will face that way/towards the cursor.
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

    // Rotate the weapon based on where the cursor/mouse position is
    mutating func rotateWeaponOnMousePos() {
        // Subtracting the mouse position x & y with our player position and then normalizing the vector & saving it to the aimVector
        self.aimVector = (Raylib.getMousePosition() - self.sprite.position).normalized()

        // Not updating if the mouse is on the player
        if self.aimVector.lengthSqr > 0 {
            self.aimAngle = atan2(self.aimVector.y, self.aimVector.x).toRadians()
        }
        // Matching vector to the angle
        self.aimVector.x = cos(self.aimAngle.asDegrees())
        self.aimVector.y = sin(self.aimAngle.asDegrees())
    }

    // Rendering the weapon
    mutating func renderWeapon() {
        let mousePosX = Raylib.getMouseX() // Getting mouse position X
        //var sourceRect = Rectangle(x: 0, y: 0, width: Float(self.weaponTexture.width), height: Float(self.weaponTexture.height))
        //var destRect = Rectangle(x: self.sprite.position.x + 25, y: self.sprite.position.y + 25, width: Float(self.weaponTexture.width) * self.weaponScale, height: Float(self.weaponTexture.height) * self.weaponScale)

        // Just like rotatePlayerOnMousePos, but simply rotate the weapon
        if Float(mousePosX) > self.sprite.position.x {
            weaponSourceRect.height *= 1
        } else {
            weaponSourceRect.height *= -1
            weaponDestRect.y += 7 // Have to add arbitrary numbers to destRect to ensure the flipped weapon texture is in the same position as the right handside upon flipping (which it didn't or won't without those values)
            weaponDestRect.x -= 2 // These numbers are using to ensure the flipped weapon is in the same position as the non-flipped one
        }

        Raylib.drawTexturePro(self.weaponTexture, weaponSourceRect, weaponDestRect, Vector2(x: 0, y: 3), self.aimAngle, .white)
    }

    mutating func keepInScreenBounds() {

        if self.sprite.position.x < 0  {
            self.sprite.position.x = 0
        } else if self.sprite.position.x > Float(Raylib.getScreenWidth()) - self.sprite.frameDimensions.y * self.sprite.scale.y {
            self.sprite.position.x = 1235
        }

        if self.sprite.position.y < 0 {
            self.sprite.position.y = 0
        } else if self.sprite.position.y > Float(Raylib.getScreenHeight()) - self.sprite.frameDimensions.y * self.sprite.scale.y {
            self.sprite.position.y = 720
        }
    }

    mutating func updateWeapon() {
        weaponDestRect = Rectangle(x: self.sprite.position.x + 25, y: self.sprite.position.y + 25, width: Float(self.weaponTexture.width) * self.weaponScale, height: Float(self.weaponTexture.height) * self.weaponScale)
        weaponSourceRect = Rectangle(x: 0, y: 0, width: Float(self.weaponTexture.width), height: Float(self.weaponTexture.height))
    }

}
