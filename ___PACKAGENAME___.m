//
//  ___PACKAGENAME___.m
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___PACKAGENAME___.h"

@interface ___PACKAGENAME___()

@property (nonatomic, strong) NSBundle *bundle;

@end

@implementation ___PACKAGENAME___


+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static id sharedPlugin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPlugin = [[self alloc] initWithBundle: plugin];
    });
}

- (id)init
{
    if (self = [super init]) {
        [self addMenuItems];
    }
    return self;
}

- (id)initWithBundle:(NSBundle *)plugin {
    if (self = [super init]) {
        _bundle = plugin;
        [self addMenuItems];
    }
    return self;
}

- (void)addMenuItems {
    // Create menu items, initialize UI, etc.
    
    // Sample Menu Item:
    NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"File"];
    if (menuItem) {
        [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
        
        //Will use 'a' as a shortcut key
        NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Do Action" action:@selector(doMenuAction) keyEquivalent:@"a"];
        [actionMenuItem setTarget:self];
        
        // use Alternate Key in combination with 'a' as shortcut: alt+a
        [actionMenuItem setKeyEquivalentModifierMask: NSAlternateKeyMask];
        //Add the menuitem
        [[menuItem submenu] addItem:actionMenuItem];
    }

}

// Sample Action, for menu item:
- (void)doMenuAction
{
    NSAlert *alert = [NSAlert alertWithMessageText:@"Hello, World" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
    [alert runModal];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
