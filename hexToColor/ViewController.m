//
//  ViewController.m
//  hexToColor
//
//  Created by student on 17/12/2015.
//  Copyright © 2015 dungdang. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Extend.h"
#import "ColorView1.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property(nonatomic,strong) AVAudioPlayer *backgroundMusic;
@end

@implementation ViewController
{
    ColorView1 *view1,*view2,*view3,*view4,*view5;
    NSArray *cpArray;
    int colorPatternIndex;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(80, 200, 200, 80)];;
//    label.backgroundColor = [[UIColor alloc] initWithHex:@"033649" alpha:1.0];
//    label.center = self.view.center;
//    [self.view addSubview:label];
    NSArray* cp1 = @[@"ECD078", @"D95B43", @"C02942", @"542437", @"53777A"];
    NSArray* cp2 = @[@"00A0B0", @"6A4A3C", @"CC333F", @"EB6841", @"EDC951"];
    NSArray* cp3 = @[@"594F4F", @"547980", @"45ADA8", @"9DE0AD", @"E5FCC2"];
    NSArray* cp4 = @[@"FF9900", @"424242", @"E9E9E9", @"BCBCBC", @"3299BB"];
    NSArray* cp5 = @[@"5E412F", @"FCEBB6", @"78C0A8", @"F07818", @"F0A830"];
    NSArray* cp6 = @[@"FAD089", @"FF9C5B", @"F5634A", @"ED303C", @"3B8183"];
    cpArray = @[cp1, cp2, cp3, cp4, cp5, cp6];
    CGFloat colorViewWidth = 200.0;
    CGFloat colorViewHeight = 40.0;
    CGFloat x0 = (self.view.bounds.size.width - colorViewWidth) * 0.5;
    view1 = [[ColorView1 alloc] initWithHex: @"556270"
                                     alpha: 1.0
                                     frame: CGRectMake(x0, 30, colorViewWidth, colorViewHeight)];
    view2 = [[ColorView1 alloc] initWithHex: @"4ECDC4"
                                     alpha: 1.0
                                     frame: CGRectMake(x0, 80, colorViewWidth, colorViewHeight)];
    view3 = [[ColorView1 alloc] initWithHex: @"C7F464"
                                     alpha: 1.0
                                     frame: CGRectMake(x0, 130, colorViewWidth, colorViewHeight)];
    view4 = [[ColorView1 alloc] initWithHex: @"FF6B6B"
                                     alpha: 1.0
                                     frame: CGRectMake(x0, 180, colorViewWidth, colorViewHeight)];
    view5 = [[ColorView1 alloc] initWithHex: @"C44D58"
                                      alpha: 1.0
                                      frame: CGRectMake(x0, 230, colorViewWidth, colorViewHeight)];
//    view5 = [[ColorView1 alloc] initWithHex: @"C44D58"
//                                      alpha: 1.0
//                                      frame: CGRectMake(x0, 230, colorViewWidth, colorViewHeight)];
    
     [self.view addSubview:view1];
     [self.view addSubview:view2];
     [self.view addSubview:view3];
     [self.view addSubview:view4];
     [self.view addSubview:view5];
    colorPatternIndex = 0;
    
    [self performSelector:@selector(animateColor:)
               withObject:[[NSNumber alloc] initWithInt:colorPatternIndex]
               afterDelay:1];
    [self onMusic];
}
- (void) animateColor: (NSNumber*) cpIndex{
    int index = [cpIndex intValue];
    [UIView animateWithDuration:3.0
                     animations:^{
                         NSArray* cp= cpArray[index];
                         view1.hex = cp[0];
                         view2.hex = cp[1];
                         view3.hex = cp[2];
                         view4.hex = cp[3];
                         view5.hex = cp[4];

                         
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.0
                                          animations:^{
                                              [view1 fadeout];
                                              [view2 fadeout];
                                              [view3 fadeout];
                                              [view4 fadeout];
                                              [view5 fadeout];
                                          }
                                          completion:^(BOOL finished) {
                                              self->colorPatternIndex++;
                                              if (self->colorPatternIndex==self->cpArray.count) {
                                                  self->colorPatternIndex=0;
                                              }
                                              [self animateColor:[[NSNumber alloc] initWithInt:colorPatternIndex]];
                                          }];
                         
                     }];
}
-(void)onMusic{
    NSString *soundFilPath = [[NSBundle mainBundle] pathForResource:@"Wildest Dreams" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilPath];
    self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    self.backgroundMusic.numberOfLoops = -1;
    self.backgroundMusic.currentTime = 0;
    [self.backgroundMusic play];
    
    
}@end
