writeln("---Program Starting--")

Animal := Object clone do(

	// variables
	name := "Ian"
	moveMessage := "Animal moved"
	
	// setters
	setName := method(str, name = str)
	setMoveMessage := method(str, moveMessage = str)
	
	// other methods
	move := method(moveMessage println)
	
	moveN := method(n, 
		message = name .. " the " .. moveMessage .. " " .. n .. " inches" 
		message println
	)
)

Duck := Animal clone
Duck setMoveMessage("Duck flew")

Cat := Animal clone
Cat setName("Tim")
Cat setMoveMessage("Cat ran")

Fish := Animal clone
Fish setName("Bob")
Fish setMoveMessage("Fish swam")


Duck moveN(3)
Cat moveN(5)
Fish moveN(100)
Cat slotNames