import Raylib

class Engine {
	
// ======================================================================================================== 

	// Engine singleton --> Outgoing
	static let game = Engine()

	// Game logic <-- Receiving
	let logic = Logic()

	// Window defines
	static let windowDimDefines: [String: Int32] = ["screenWidth": 1280, "screenHeight": 768]
	let windowTitle: String = "Hellpoint Swift"
	let targetFPS: Int32 = 60

	// deltaTime singleton
	static var deltaTime: Float = 0

// ======================================================================================================== 

	// Engine run startpoint
	func run() {
		Raylib.initWindow(Engine.windowDimDefines["screenWidth"]!, Engine.windowDimDefines["screenHeight"]!, windowTitle)
		Raylib.setTargetFPS(targetFPS)
		logic.initStates()

		// Main loop
		while !Raylib.windowShouldClose {
			Engine.deltaTime = Raylib.getFrameTime()
			self.update(deltaTime: Engine.deltaTime)
			self.render()
		}
		Raylib.closeWindow()
	}

	// Update game logic.
	private func update(deltaTime dt: Float) {
		logic.update(deltaTime: dt)
	}

	// Render the game
	private func render() {
		Raylib.beginDrawing()
		Raylib.clearBackground(.white)
		logic.render()
		Raylib.endDrawing()
	}

	private init() {	}
}
