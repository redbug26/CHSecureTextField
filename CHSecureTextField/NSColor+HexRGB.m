//
// NSColor+RGBHex.m
//
// Copyright (c) 2009 Mattt Thompson (http://mattt.me)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy 
// of this software and associated documentation files (the "Software"), to deal 
// in the Software without restriction, including without limitation the rights 
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
// copies of the Software, and to permit persons to whom the Software is 
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
// SOFTWARE.

#import "NSColor+HexRGB.h"


@implementation NSColor (HexRGB)
+ (NSColor *)colorFromHexRGB:(NSString *)hexString
{
	NSColor * result = nil;
	unsigned int colorCode = 0;
	unsigned char redByte, greenByte, blueByte;
	
	if (nil != hexString)
	{
		NSScanner * scanner = [NSScanner scannerWithString:hexString];
		(void) [scanner scanHexInt:&colorCode];
	}
	redByte		= (unsigned char) (colorCode >> 16);
	greenByte	= (unsigned char) (colorCode >> 8);
	blueByte	= (unsigned char) (colorCode);
	result = [NSColor
			  colorWithCalibratedRed:	(float)(redByte	  >> 4) / 0x10
			  green:					(float)(greenByte >> 4) / 0x10
			  blue:						(float)(blueByte  >> 4) / 0x10
			  alpha:1.0];
	
	return result;
}

+ (NSColor *)grayscaleFromHexRGB:(NSString *)hexString
{
	NSColor * result = nil;
	unsigned int colorCode = 0;
	if (nil != hexString)
	{
		NSScanner * scanner = [NSScanner scannerWithString:hexString];
		(void) [scanner scanHexInt:&colorCode];
	}
	
	unsigned char grayByte = colorCode % 0xff;
	result = [NSColor colorWithCalibratedWhite:(float)grayByte / 0xff alpha:1.0];
	
	return result;
}
@end
