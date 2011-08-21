// attempt at creating a simple markup language using method missing

Builder := Object clone

// overrwide the method_missing, or forward, method to create what we need

Builder forward := method(
  // open the tag
  writeln("<", call message name, ">")
  
  // for all arguments, recurse
  call message arguments foreach(arg,
    
    content := self doMessage(arg)
    
    // if a string then print it out
    if(content type == "Sequence", writeln(content))
    
  )
  
  writeln("</", call message name, ">")
)

// test

Builder html(
  head(
    title("Testing my Io language")
  ),
  body(
    h1("My first header"),
    p("And a paragraph")
  )
)