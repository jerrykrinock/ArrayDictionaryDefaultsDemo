#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    // This does not help.
    [NSUserDefaultsController sharedUserDefaultsController].appliesImmediately = YES ;
}

@end
