/* MainController */

#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>
#import "CTBadge.h"

@interface MainController : NSObject
  {
  CTBadge *myBadge;
  
  IBOutlet id scroller;
  
  IBOutlet id largeBadgeView;
  IBOutlet id smallBadgeView;
  }

- (IBAction)setBadgeValue:(id)sender;
- (IBAction)setBadgeColor:(id)sender;
- (IBAction)setLabelColor:(id)sender;

- (IBAction)setApplicationIcon:(id)sender;

@end
