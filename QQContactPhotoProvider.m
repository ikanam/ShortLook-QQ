#import "QQContactPhotoProvider.h"

@implementation QQContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
    NSString *userInfo = notification.applicationUserInfo[@"r"];
    if (!userInfo) return nil;
    NSArray *infos = [userInfo componentsSeparatedByString:@"|"];
    NSString *profileURLStr;
    if (infos.count < 2) return nil;
    if ([infos.firstObject isEqualToString:@"c"] && [infos[1] length] > 0) {
        profileURLStr = [NSString stringWithFormat:@"http://q1.qlogo.cn/g?b=qq&s=640&nk=%@", infos[1]];
    } else if ([infos.firstObject isEqualToString:@"g"]) {
        profileURLStr = [NSString stringWithFormat:@"http://p.qlogo.cn/gh/%@/%@/640", infos[1], infos[1]];
    } else {
        return nil;
    }
    if (!profileURLStr) return nil;
    NSURL *profileURL = [NSURL URLWithString:profileURLStr];
    if (!profileURL) return nil;
    return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:profileURLStr fromURL:profileURL];
}

@end
