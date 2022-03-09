import Raylib
import Aeni
import Seuwichi

class Logic {
    
// ======================================================================================================== 
    // Player initialisation
    static var player = Player()

    // stateManager initialisation
    static var stateManager = StateMachine()

    //
    static var hasGameStarted: Bool = false

// ======================================================================================================== 

   @inlinable func initStates() {
        Logic.stateManager.insertState(MenuState(), withID: "menu")
        Logic.stateManager.insertState(IdleState(), withID: "idle")
        Logic.stateManager.insertState(MoveState(), withID: "move")
        Logic.stateManager.changeState(id: "menu")
    }

    @inlinable func update(deltaTime dt: Float) {
        Logic.stateManager.update(deltaTime: dt)

        if Raylib.isKeyPressed(.letterF) {
            Logic.stateManager.changeState(id: "menu")
            Logic.hasGameStarted = false
        }
    }

    @inlinable func render() {
        if Logic.hasGameStarted {
            Raylib.drawTexture(Resources.manager.loadedResourcesDatabase["map"]!, 0, 0, .white)
        }
        Logic.stateManager.render()
    }
// ======================================================================================================== 
}

extension Float {
    func asDegrees() -> Float {
        return self * (.pi / 180)
    }
    func toRadians() -> Float {
        return self * (180 / .pi)
    }
}