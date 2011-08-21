// Using a DSL to override the Map/Hash-like function so we can write
// it literally like JSON

OperatorTable addAssignOperator(":","atPutNumber")

curlyBrackets := method(
  // clone the map
  r := Map clone
  
  // call message gets the code between the braces,
  // then arguments foreach targets each line
  call message arguments foreach(arg,
  
    // run each line
    // e.g. "test": "bam" would run r atPutNumber("test","bam")
    
    r doMessage(arg)
  )
  
  r
)

// now set atPutNumber
Map atPutNumber := method(
  
  // so call the regualr atPut value
  self atPut(
    
    // process the first argument, removing the quotes since quotes are put in my default in
    // at put. we make it mutable to remove these
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    
    call evalArgAt(1)
    
  )
)

s := File with("phonenumbers.txt") openForReading contents
phoneNumbers := doString(s)
phoneNumbers keys println
phoneNumbers values println