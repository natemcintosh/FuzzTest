# FuzzTest
What would a basic fuzzing library look like in Julia?

Right now, the only utility supported by this tool is calling `rand` on the given types. This means that if 
`rand` doesn't know how to randomly sample a type, e.g. `String`, this tool will not work. It also means that
running it on `Float`s will only produce numbers in the range $[0,1)$. Future work will expand this. 

## Use Cases
When would fuzzing be useful?
- If you are looking for inputs that crash your function
- If you want to make sure that a certain property is satisfied by your function