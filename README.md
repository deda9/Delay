# Delay

In short it replaces this 
```Swift 
DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
    //doing your work
}
```

with 
```Swift 
delay(seconds: 1, thread: .main) {
    //doing your work
}
```

and replaces this
```Swift 
DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + .seconds(1)) {
    //doing your work
}
```

with 
```Swift 
delay(seconds: 1, thread: .background(.default)) {
    //doing your work
}
```
