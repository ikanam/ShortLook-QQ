#import "ShortLook-API.h"

@interface QQContactPhotoProvider : NSObject <DDNotificationContactPhotoProviding>

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification;
@end
