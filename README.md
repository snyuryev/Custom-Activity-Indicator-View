# Custom Activity Indicator View (swift, iOS)

Custom Activity Indicator View an element that provides user feedback on the progress of a task or process with an unknown duration. As long as the task or process continues, the activity indicator spins. A user does not interact with an activity indicator. It is very similar with UIActivityIndicatorView but uses custom image. Custom Activity Indicator View is subclass of UIView. 

Drag CustomActivityIndicatorView.swift to your project and add some image which should be animated in custom activity indicator view. It could be simple declared this way in your class:
```swift
lazy private var activityIndicator : CustomActivityIndicatorView = {
  let image : UIImage = UIImage(named: "loading")!
  return CustomActivityIndicatorView(image: image)
}() 
```
where "loading" is your image in png format. 

Then simple add it to your view:
```
self.view.addSubview(activityIndicator)
```
And run animation:
```
activityIndicator.startAnimating()
```
To stop animation call:
```
activityIndicator.stopAnimating()
```

![Alt text](https://www.dropbox.com/s/f7iqdwppufh29iu/loading_screenshot.png?dl=0 "Loading indicator")
