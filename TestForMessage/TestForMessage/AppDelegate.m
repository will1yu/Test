//
//  AppDelegate.m
//  TestForMessage
//
//  Created by Will Yu on 2018/8/12.
//  Copyright © 2018年 Will Yu. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreTelephony/CTCall.h>

extern NSString * const kCTSMSMessageReceivedNotificaton;
extern NSString * const kCTSMSMessageReplaceReceivedNotification;
extern NSString * const kCTSIMSupportSIMStatusNotInserted;
extern NSString * const kCTSIMSupportSIMStatusReady;

extern NSString *CTCallCopyAddress(void *, CTCall *);
void *CTSMSMessageSend(id server, id msg);
typedef struct __CTSMSMessage CTSMSMessage;
NSString *CTSMSMessageCopyAddress(void *, CTSMSMessage *);
NSString *CTSMSMessageCopyText(void *, CTSMSMessage *);

int CTSMSMessageGetRecordIdentifier(void *msg);
NSString *CTSIMSupportGetSIMStatus(void);
NSString *CTSIMSupportCopyMobileSubscriberIdentity(void);
id CTSMSMessageCreate(void *unknow, NSString *number, NSString *text);
void *CTSMSMessageCreateReply(void *unknow, void *forwardTo, NSString *text);

id CTTelephonyCenterGetDefault(void);
void CTTelephonyCenterAddObserver(id, id, CFNotificationCallback, NSString *, void *, int);
void CTTelephonyCenterRemoveObserver(id, id, NSString *, void *);
int CTSMSMessageGetUnreadCount(void);

static void callback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    
    NSString *strNotificationName = (__bridge NSString *)name;
    
    if ([strNotificationName isEqualToString:@"kCTMessageReceivedNotification"]) {
        int a = 0;
    }
    
    @synchronized(nil) {
        if (!userInfo) {
            return;
        }
        
        if ([[(__bridge NSDictionary *)userInfo allKeys] containsObject:@"kCTMessageIdKey"]) {
            NSDictionary *info = (__bridge NSDictionary *)userInfo;
            CFNumberRef msgID = (__bridge CFNumberRef)[info objectForKey:@"kCTMessageTypekey"];
            int result;
            CFNumberGetValue(msgID, kCFNumberSInt32Type, &result);
            Class CTTelephonyCenter = NSClassFromString(@"CTTelephonyCenter");
            Class CTMessageCenter = NSClassFromString(@"CTMessageCenter");
            
            id messageCenter = [CTMessageCenter sharedMessageCenter];
        }
    }
}

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
