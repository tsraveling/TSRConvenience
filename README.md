# TSRConvenience

## Synopsis

A set of concise convenience functions that speed up working in Swift. Extensions to Int, String, UIColor, and others, to provide easy-to-use functions to support things like text sizing, hex color values, and array shuffling.

## Install

This version uses Swift 3, which as of this moment Cocoapods does not yet support. So for now, just download and include manually.

## Usage

### UITextField

**setPlaceholderColor(color):** Sets the placeholder of a textfield to the color you choose.

### Int

**formattedValue():** Returns the number in standard comma-style, eg `1,000,000`.

**formattedValue(style : NumberFormatter.Style):** Returns the number in the style given in the attached argument.

### Float

**radiansToDegrees():** Returns the degree value of `self`. Assumes `self` is in radians.

### String

**heightWithConstrainedWidth(width: CGFloat, font: UIFont):** Returns the height for this string given a constrained width

**widthWithConstrainedHeight(height: CGFloat, font: UIFont):** Returns the width for this string given a constrained height

**widthWithFont(font : UIFont):** Returns the single-line width of this string in a given font.

### UITableViewCell

**calculateRowHeight(default\_height: CGFloat, label\_width: CGFloat, label_height : CGFloat, font: UIFont, text: String):** Used to calculate the height of the row assuming a single label. Supply the width of the label for the iPhone 6 for `label_width`, the height of the cell in Interface Builder for `default_height`, and the height of the label in Interface Builder for `label_height`. This is mostly useful when nesting tableviews within table cells, or similar problems slightly too complex for AutoLayout to handle.

### UIImage

**loadFromURL(url : URL, completion : (UIImage?)->Void):** Static function that loads an image from a URL asynchronously and fires the completion block when complete.

### NSAttributedString

**heightWithConstrainedWidth(width: CGFloat):** Returns the height for this string given a constrained width

**stringWithHTML(html: String, css_file: String):** Static function that converts HTML into an NSAttributedString instance using the css file (included in the bundle) specified in `css_file`. Leave off the `.css` extension as it will be automatically added.

### UIColor

**init(hexString: String):** Inits a UIColor instance using a hex string:

```swift
let red = UIColor(hexString: "FFF0000")
```

**init(red: Int, green: Int, blue: Int):** Inits a UIColor instance using RGB values of 0-255. Old school.

### Arrays

**shuffle():** Returns a shuffled copy of the array.

**shuffleInPlace():** On mutable arrays, you can call `shuffleInPlace()` to shuffle the original instance of the array.

### Global Utility Functions

**delay(delay: Double, closure: ()->Void ):** Allows you to call a block of code after `delay` seconds. Can be used from anywhere.

## License

The MIT License (MIT)

Copyright (c) 2016 Tim Raveling

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.