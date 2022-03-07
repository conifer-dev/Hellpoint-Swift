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
    }

    @inlinable func render() {
        if Logic.hasGameStarted {
            Raylib.drawTexture(Resources.manager.loadedResourcesDatabase["map"]!, 0, 0, .white)
        }
        Logic.stateManager.render()
    }
// ======================================================================================================== 
}