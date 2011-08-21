// attempt at creating a simple markup language using method missing

Builder := Object clone do(

  depth := 0
  
  setDepth := method(i, self depth = i)

  prefix := method("  " repeated(depth))
  
  // overrwide the method_missing, or forward, method to create what we need
  forward := method(
  
  
    // open the tag  
    writeln(prefix, "<", call message name,">")
  
    // increment parse depth by one
    setDepth(depth + 1)
  
    // for all arguments, recurse
    call message arguments foreach(arg,
    
      content := self doMessage(arg)
      
      // if a string then print it out
      if(content type == "Sequence", writeln(prefix, content))
    
    )
    
    // now decrement again
    
    setDepth(depth - 1)
  
    writeln(prefix, "</", call message name, ">")
  )
  
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