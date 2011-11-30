//
//  OAToken+iOSKeychain.h
//  OAuthConsumer
//
//  Created by Gernot Poetsch on 30.11.11.
//  Copyright (c) 2011 nxtbgthng GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OAToken.h"

@interface OAToken (iOSKeychain)

+ (NSString *)serviceNameWithProvider:(NSString *)provider;
+ (id)tokenFromDefaultKeychainWithServiceProviderName:(NSString *)provider;

- (void)storeInDefaultKeychainWithServiceProviderName:(NSString *)provider;
- (void)removeFromDefaultKeychainWithServiceProviderName:(NSString *)provider;

@end
