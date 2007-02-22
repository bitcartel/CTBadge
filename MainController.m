#import "MainController.h"

@implementation MainController

- (void)awakeFromNib
  {
  myBadge = [[CTBadge alloc] init];
  [self setBadgeValue:scroller];
  [[NSColorPanel sharedColorPanel] setShowsAlpha:YES];
  }

- (void)windowWillClose:(NSNotification *)aNotification
  {
  RestoreApplicationDockTileImage();
  [NSApp terminate:self];
  }

- (IBAction)setBadgeValue:(id)sender
  {
  int value = [sender intValue];
  
  [largeBadgeView setImage:[myBadge largeBadgeForValue:value]];
  [smallBadgeView setImage:[myBadge smallBadgeForValue:value]];
  [myBadge badgeApplicationDockIconWithValue:value insetX:3 y:0];
  
  //[[[myBadge largeBadgeForValue:value] TIFFRepresentation] writeToFile:@"/tmp/badge.tif" atomically:NO];
  }

- (IBAction)setBadgeColor:(id)sender
  {
  [myBadge setBadgeColor:[sender color]];
  [self setBadgeValue:scroller];
  }


- (IBAction)setLabelColor:(id)sender
  {
  [myBadge setLabelColor:[sender color]];
  [self setBadgeValue:scroller];
  }


- (IBAction)setApplicationIcon:(id)sender
  {
  NSOpenPanel *openPanel = [NSOpenPanel openPanel];
  
  int result = [openPanel runModalForDirectory:NSHomeDirectory() file:nil types:[NSArray arrayWithObject:@"icns"]];
  
  if(result == NSOKButton)
	{
	[self application:nil openFile:[openPanel filename]];
	}
  }

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename
  {
  NSImage *newAppIcon = [[NSImage alloc] initWithContentsOfFile:filename];
  [(NSImage *)[NSImage imageNamed:@"NSApplicationIcon"] setName:nil];
  [newAppIcon setName:@"NSApplicationIcon"];
  
  [self setBadgeValue:scroller];
  return YES;
  }

@end
