//
//  OAToken+iOSKeychain.m
//  OAuthConsumer
//
//  Created by Gernot Poetsch on 30.11.11.
//  Copyright (c) 2011 nxtbgthng GmbH. All rights reserved.
//

#import "OAToken+iOSKeychain.h"

@implementation OAToken (iOSKeychain)

+ (NSString *)serviceNameWithProvider:(NSString *)provider;
{
	NSString *appName = [[NSBundle mainBundle] bundleIdentifier];
	
	return [NSString stringWithFormat:@"%@::OAuth::%@", appName, provider];
}

+ (id)tokenFromDefaultKeychainWithServiceProviderName:(NSString *)provider;
{
	NSString *serviceName = [[self class] serviceNameWithProvider:provider];
	NSDictionary *result = nil;
	NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
						   (NSString *)kSecClassGenericPassword, kSecClass,
						   serviceName, kSecAttrService,
						   kCFBooleanTrue, kSecReturnAttributes,
						   nil];
	OSStatus status = SecItemCopyMatching((CFDictionaryRef)query, (CFTypeRef *)&result);
	[result autorelease];
	
	if (status != noErr) {
		NSAssert1(status == errSecItemNotFound, @"unexpected error while fetching token from keychain: %ld", status);
		return nil;
	}
	
	return [NSKeyedUnarchiver unarchiveObjectWithData:[result objectForKey:(NSString *)kSecAttrGeneric]];
}

- (void)storeInDefaultKeychainWithServiceProviderName:(NSString *)provider;
{
	NSString *serviceName = [[self class] serviceNameWithProvider:provider];
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
	NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
						   (NSString *)kSecClassGenericPassword, kSecClass,
						   serviceName, kSecAttrService,
						   @"OAuth Access Token", kSecAttrLabel,
						   data, kSecAttrGeneric,
						   nil];
	[self removeFromDefaultKeychainWithServiceProviderName:provider];
	OSStatus __attribute__((unused)) err = SecItemAdd((CFDictionaryRef)query, NULL);
	NSAssert1(err == noErr, @"error while adding token to keychain: %ld", err);
}

- (void)removeFromDefaultKeychainWithServiceProviderName:(NSString *)provider;
{
	NSString *serviceName = [[self class] serviceNameWithProvider:provider];
	NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
						   (NSString *)kSecClassGenericPassword, kSecClass,
						   serviceName, kSecAttrService,
						   nil];
	OSStatus __attribute__((unused)) err = SecItemDelete((CFDictionaryRef)query);
	NSAssert1((err == noErr || err == errSecItemNotFound), @"error while deleting token from keychain: %ld", err);
}

@end
