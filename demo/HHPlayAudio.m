//
//  HHPlayAudio.m
//  testAutio
//
//  Created by guo qingming on 11-11-8.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "HHPlayAudio.h"

@implementation HHPlayAudio
+(void)playSysAudio:(SystemSoundID)id
{
    AudioServicesPlaySystemSound(id);
}
+(void)playAudio:(NSString *)name
{
    NSString *path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],name];
    SystemSoundID soundID;
    NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
    AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);
    AudioServicesPlaySystemSound(soundID);
}
@end
