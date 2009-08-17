// 
// CHSecureTextField.m
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

#import "CHSecureTextField.h"

#define kNumberOfBars		3
#define kMinimumInputLength 6


NSString * md5(NSString * string)
{
	NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
	unsigned char digest[MD5_DIGEST_LENGTH];
	char finaldigest[2 * MD5_DIGEST_LENGTH];
	int i;
	
	MD5([data bytes],[data length], digest);
	for(i = 0 ; i < MD5_DIGEST_LENGTH;i++) sprintf(finaldigest + i * 2, "%02x", digest[i]);
	
	return [NSString stringWithCString:finaldigest length:(2 * MD5_DIGEST_LENGTH)];
}

@implementation CHSecureTextField

@synthesize colorBars;

- (void)awakeFromNib
{
	colorBars = [[NSMutableArray alloc] initWithCapacity:kNumberOfBars];
	for(int i = 0; i < kNumberOfBars; i++) {
		CHColorBar * bar = [[CHColorBar alloc] initWithFrame:[self bounds]];
		bar.offset = i;
		[colorBars insertObject:bar atIndex:i];
		[self addSubview:bar];
	}
}

- (void)textDidChange:(NSNotification *)notification
{
	NSString * value = (NSString * )[notification.object performSelector:@selector(string)];
	NSString * salt = (NSString*)CSCopyMachineName();
	NSString * hash = md5([salt stringByAppendingString:value]);
	NSString * hex;
	int index = 0;
	for(CHColorBar * bar in colorBars) {
		hex = [hash substringWithRange:NSMakeRange(index += 6,6)];
		if([value length] == 0) {
			[bar setColor:[NSColor clearColor]];
		}
		else if([value length] < kMinimumInputLength) {
			[bar setColor:[NSColor grayscaleFromHexRGB:hex]];
		}
		else {
			[bar setColor:[NSColor colorFromHexRGB:hex]];
		}
		
		[bar setNeedsDisplay:YES];
		[self addSubview:bar];
	}
}

- (void)drawRect:(NSRect)rect
{
	for(CHColorBar * bar in colorBars) {
		[self addSubview:bar];
	}
	
	[super drawRect:rect];
}

- (void) dealloc
{
	[colorBars dealloc];
	[super dealloc];
}



@end
