#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    [NSUserDefaultsController sharedUserDefaultsController].appliesImmediately = YES ;
}

// #define FIX_IT

- (IBAction)apply:(id)sender {
#ifdef FIX_IT
    NSArray* content = self.arrayController.content ;
    [[NSUserDefaults standardUserDefaults] setObject:content
                                              forKey:@"persons"] ;
#else
    NSLog(@"To make this work, #deine FIX_IT in AppDelegate.m") ;
#endif
}

@end
