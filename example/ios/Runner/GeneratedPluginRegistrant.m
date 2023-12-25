//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<integration_test/IntegrationTestPlugin.h>)
#import <integration_test/IntegrationTestPlugin.h>
#else
@import integration_test;
#endif

#if __has_include(<weekly_calendar/WeeklyCalendarPlugin.h>)
#import <weekly_calendar/WeeklyCalendarPlugin.h>
#else
@import weekly_calendar;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [IntegrationTestPlugin registerWithRegistrar:[registry registrarForPlugin:@"IntegrationTestPlugin"]];
  [WeeklyCalendarPlugin registerWithRegistrar:[registry registrarForPlugin:@"WeeklyCalendarPlugin"]];
}

@end
