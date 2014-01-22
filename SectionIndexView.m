//
//  SectionIndexView.m
//  GuestCenter
//
//  Created by Patrick DeSantis on 1/16/14.
//  Copyright (c) 2014 OpenTable. All rights reserved.
//

#import "SectionIndexView.h"

@implementation SectionIndexView

- (void)drawRect:(CGRect)rect
{
    NSDictionary *textAttributes = self.textAttributes;
    NSArray *sectionIndexTitles = self.sectionIndexTitles;
    CGFloat numberOfSections = (CGFloat)[sectionIndexTitles count];
    CGFloat topInset = self.topInset;
    CGFloat height = self.frame.size.height - topInset;
    CGFloat width = self.frame.size.width;

    for (int i = 0; i < numberOfSections; i++) {
        NSString *title = sectionIndexTitles[i];

        // Calculate the width of this title, then calculate its x-position so it will be horizontally centered
        CGSize size = [title sizeWithAttributes:textAttributes];
        CGFloat x = (width - size.width) / 2.0f;

        // Calculate the y-position
        CGFloat y = (CGFloat)i * height / numberOfSections;
        y += topInset;

        // Draw the title
        [title drawAtPoint:CGPointMake(x, y) withAttributes:self.textAttributes];
    }
}



#pragma mark - Getters & Setters
- (void)setSectionIndexTitles:(NSArray *)sectionIndexTitles
{
    _sectionIndexTitles = sectionIndexTitles;
    [self setNeedsDisplay];
}

- (void)setTextAttributes:(NSDictionary *)textAttributes
{
    _textAttributes = textAttributes;
    [self setNeedsDisplay];
}

- (void)setTopInset:(CGFloat)topInset
{
    _topInset = topInset;
    [self setNeedsDisplay];
}



#pragma mark - UIResponder
- (void)handleTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];

    CGFloat height = self.frame.size.height - self.topInset;
    CGFloat numberOfSections = (CGFloat)[self.sectionIndexTitles count];

    NSInteger section = (NSUInteger)point.y * numberOfSections / height;
    if (section >= 0 && section < numberOfSections) {
        [self.delegate sectionIndexView:self touchedSectionIndex:section withTitle:self.sectionIndexTitles[section]];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouches:touches];
}

// Stubs, as per Apple docs:
// If you override this method without calling super (a common use pattern), you must also override the other methods for handling touch events, if only as stub (empty) implementations.
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{}

@end
