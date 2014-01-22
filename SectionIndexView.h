//
//  SectionIndexView.h
//  GuestCenter
//
//  Created by Patrick DeSantis on 1/16/14.
//  Copyright (c) 2014 OpenTable. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SectionIndexViewDelegate;

@interface SectionIndexView : UIView

@property (strong, nonatomic) NSArray *sectionIndexTitles;
@property (strong, nonatomic) NSDictionary *textAttributes;
@property (assign, nonatomic) CGFloat topInset;

@property (assign, nonatomic) id<SectionIndexViewDelegate>delegate;

@end

@protocol SectionIndexViewDelegate <NSObject>
- (void)sectionIndexView:(SectionIndexView *)view touchedSectionIndex:(NSUInteger)index withTitle:(NSString *)title;
@end