//
//  BFirebaseNetworkAdapter.m
//  Pods
//
//  Created by Benjamin Smiley-andrews on 13/11/2016.
//
//

#import "BFirebaseNetworkAdapter.h"

#import <ChatSDK/ChatCore.h>
#import "ChatFirebaseAdapter.h"

@implementation BFirebaseNetworkAdapter

-(id) init {
    if((self = [super init])) {
        
        // Configure app for Facebook login
        NSString *filePath;
#ifdef LIVE
            filePath = [[NSBundle mainBundle] pathForResource:@"GoogleService-Info" ofType:@"plist"];
#else
            filePath = [[NSBundle mainBundle] pathForResource:@"GoogleService-Info-Test" ofType:@"plist"];
#endif
        FIROptions *options = [[FIROptions alloc] initWithContentsOfFile:filePath];
        [FIRApp configureWithOptions:options];
        
        
        
//        [[FIRAuth auth] signOut:Nil];
        
        self.core = [[BFirebaseCoreHandler alloc] init];
        self.auth = [[BFirebaseAuthenticationHandler alloc] init];
        self.search = [[BFirebaseSearchHandler alloc] init];
        self.moderation = [[BFirebaseModerationHandler alloc] init];
        self.contact = [[BBaseContactHandler alloc] init];
        self.publicThread = [[BFirebasePublicThreadHandler alloc] init];
        self.users = [[BFirebaseUsersHandler alloc] init];

    }
    return self;
}

@end
