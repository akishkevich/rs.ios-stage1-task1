#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSUInteger strLength = [string length];
    if (!string || strLength == 0) { return @[]; }

    NSMutableArray<NSNumber *> *circleStr = [@[] mutableCopy];
    NSMutableArray<NSNumber *> *squareStr = [@[] mutableCopy];
    NSMutableArray<NSNumber *> *triangeStr = [@[] mutableCopy];

    NSMutableArray<NSString *> *result = [@[] mutableCopy];
    NSMutableArray<NSValue *> *ranges = [@[] mutableCopy];

    for (int i = 0; i < strLength; i++) {
        unichar character = [string characterAtIndex:i];
        NSNumber *posBracket = nil;
        switch(character) {
            case '(':
                [circleStr addObject:@(i)];
                break;
            case '[':
                [squareStr addObject:@(i)];
                break;
            case '<':
                [triangeStr addObject:@(i)];
                break;
            case ')':
                posBracket = [circleStr lastObject];
                [circleStr removeLastObject];
                break;
            case ']':
                posBracket = [squareStr lastObject];
                [squareStr removeLastObject];
                break;
            case '>':
                posBracket = [triangeStr lastObject];
                [triangeStr removeLastObject];
                break;
        }

        if (!posBracket) { continue; }

        NSRange range = NSMakeRange(
            [posBracket intValue] + 1,
            i - [posBracket intValue] - 1
        );
        [ranges addObject:[NSValue valueWithRange:range]];
    }

    [ranges sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 rangeValue].location > [obj2 rangeValue].location;
    }];

    for (NSValue *value in ranges) {
        NSString *subString = [string substringWithRange:[value rangeValue]];
        if ([subString length]) { [result addObject: subString]; }
    }

    return result;
}

@end
