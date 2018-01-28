#import "UIImage+Bundle.h"

@implementation UIImage (Bundle)

+ (UIImage *)BundleImages1 {

	NSString *path = [[NSBundle mainBundle] pathForResource:@"BundleImages1" ofType:@"png"];

	return [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *)BundleImages2 {

	NSString *path = [[NSBundle mainBundle] pathForResource:@"BundleImages2" ofType:@"png"];

	return [UIImage imageWithContentsOfFile:path];
}

@end
