#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "PWImageConfigModel.h"
#import "UIImageView+PWWebCatch.h"

FOUNDATION_EXPORT double MYImageCacheVersionNumber;
FOUNDATION_EXPORT const unsigned char MYImageCacheVersionString[];

