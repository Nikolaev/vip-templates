//
//  UIColor+hex.h
//

#import <UIKit/UIColor.h>
@interface UIColor(MBCategory)
+ (UIColor *)colorWithHexString:(NSString *)hexStr;
+ (NSString*) getHexStringWithColor:(UIColor*)color;
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;
@end
