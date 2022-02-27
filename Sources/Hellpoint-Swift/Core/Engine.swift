import Raylib

class Engine {
	// Engine singleton --> Outgoing
	static let game = Engine()

	// Game logic <-- Receiving
	let logic = Logic()

	// Window defines
	let windowDimDefines: [String: Int32] = ["screenWidth": 1280, "screenHeight": 768]
	let windowTitle: String = "Hellpoint Swift"
	let targetFPS: Int32 = 60

	// Engine run startpoint
	func run() {
		Raylib.initWindow(windowDimDefines["screenWidth"]!, windowDimDefines["screenHeight"]!, windowTitle)
		Raylib.setTargetFPS(targetFPS)


		// Main loop
		while !Raylib.windowShouldClose {
			self.update()
			self.render()
		}
		Raylib.closeWindow()
	}

	// Update game logic.
	private func update() {
		logic.update()
	}

	// Render the game
	private func render() {
		Raylib.beginDrawing()
		Raylib.clearBackground(.white)
		logic.render()
		Raylib.endDrawing()
	}

	private init() { }
}
