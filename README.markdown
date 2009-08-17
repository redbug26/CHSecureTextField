`CHSecureTextField`
===================

## A slick Objective-C port of Chroma-Hash

*In a Tweet*: `CHSecureTextField` is a drop-in replacement for NSSecureTextField that incorporates password masking like the original [Chroma-Hash](http://github.com/mattt/Chroma-Hash/tree/master).

Password entry can be frustrating, especially with long or difficult passwords. `SecureTextField` obscures user input with •'s, so others can't read it. Unfortunately, neither can you—you can't tell if you got your password right until you click "OK".

Chroma-Hash displays a series of colored bars at the end of field inputs so you can instantly see if your password is right. Chroma-Hash takes an MD5 hash of your input and uses that to compute the colors in the visualization. The MD5 hash is non-reversible, so no one could know what your password just from the colors. Your password will display the same sequence each time, so you can learn to expect "blue, red, pink", for instance; if you instead see "green, purple, yellow", you'll know you typed it wrong.

## Demo

Actions speak louder than words.  
Download [`ChromaHash.app`](http://cloud.github.com/downloads/mattt/CHSecureTextField/ChromaHash.zip) for Mac OS 10.5 and see it in action!

Alternatively, you can [check out the original, web version of Chroma-Hash](http://mattt.github.com/Chroma-Hash/)

## Usage

First, include `CHSecureField.{h,m}`, `CHColorBar.{h,m}`, and `NSColor+HexRGB.{h,m}` to your project. Drag and drop into your Xcode project and be sure to check the option to "Copy items into destination group's folders (if needed)" as well as the option to add to your release build target.

In InterfaceBuilder, drop in or select existing instances of `NSSecureTextField` and press ⌘6 to bring up the Identity Inspector. In the "Class Identity" section, change the value of "Class" to `CHSecureField`.

![CHSecureTextField Inspector](http://mattt.github.com/CHSecureTextField/CHSecureTextField-Inspector.png "CHSecureTextField Inspector")

**Note**: InterfaceBuilder won't show the Chroma-Hash behavior when you do Simulate Interface. To see `CHSecureField` in all of its glory, Build And Run from the Xcode project.

## Requirements

- Mac OS 10.5 and Xcode (will not work for iPhone SDK)

## License

Chroma-Hash and CHSecureTextField are licensed under the MIT License:

  Copyright (c) 2009 Mattt Thompson (http://mattt.me/)

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.