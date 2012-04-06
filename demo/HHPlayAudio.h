//
//  HHPlayAudio.h
//  testAutio
//
//  Created by guo qingming on 11-11-8.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface HHPlayAudio : NSObject
+(void)playSysAudio:(SystemSoundID)id;//播放系统声音 id:系统声音的id
+(void)playAudio:(NSString *)name;
@end
