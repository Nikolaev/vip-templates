//
//  UIColor+hex.m


#import "UIColor+Hex.h"
@interface UIColor(HexConverterCategory)

// Takes 0x123456
+ (UIColor *)colorWithHex:(UInt32)color andAlpha:(float)alpha;

@end

@implementation UIColor(HexConverterCategory)

+ (UIColor *)colorWithHex:(UInt32)color andAlpha:(float)alpha
{
    unsigned char r, g, b;
    b = color & 0xFF;
    g = (color >> 8) & 0xFF;
    r = (color >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:alpha];
}

@end

@implementation UIColor(MBCategory)

+ (UIColor *)colorWithHexString:(NSString *)hexStr
{
    float alpha;
    NSString *newHexStr;
    NSCharacterSet *cSet = [NSCharacterSet characterSetWithCharactersInString:@"/-_,~^*&\\ "];
    if(![hexStr hasPrefix:@"#"]) hexStr = [NSString stringWithFormat:@"#%@", hexStr];
    if([hexStr rangeOfCharacterFromSet:cSet].location != NSNotFound) {
        
        NSScanner *scn = [NSScanner scannerWithString:hexStr];
        [scn scanUpToCharactersFromSet:cSet intoString:&newHexStr];
        alpha = [[[hexStr componentsSeparatedByCharactersInSet:cSet] lastObject] floatValue];
        
    } else {
        
        newHexStr = hexStr;
        alpha = 1.0f;
        
    }
    
    const char *cStr = [newHexStr cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr+1, NULL, 16);
    return [UIColor colorWithHex:(UInt32)x andAlpha:alpha];
}

+(NSString*) getHexStringWithColor:(UIColor*)color {
    
    
    size_t numComponents = CGColorGetNumberOfComponents([color CGColor]);
    
    NSAssert(numComponents == 4 || numComponents == 2, @"Unsupported color format");
    
    // E.g. FF00A5
    NSString *colorHexString = nil;
    
    const CGFloat *components = CGColorGetComponents([color CGColor]);
    
    if (numComponents == 4)
    {
        unsigned int red = components[0] * 255;
        unsigned int green = components[1] * 255;
        unsigned int blue = components[2] * 255;
        colorHexString = [NSString stringWithFormat:@"%02X%02X%02X", red, green, blue];
    }
    else
    {
        unsigned int white = components[0] * 255;
        colorHexString = [NSString stringWithFormat:@"%02X%02X%02X", white, white, white];
    }
    return colorHexString;
    
}

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha {
    return [UIColor colorWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0) alpha:alpha];
}

@end