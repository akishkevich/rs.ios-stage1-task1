#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSNumber *sum = [array valueForKeyPath:@"@sum.self"];
    NSNumber *max = [array valueForKeyPath:@"@max.intValue"];
    NSNumber *min = [array valueForKeyPath:@"@min.intValue"];
    NSNumber *maxSum = [NSNumber numberWithInt:[sum intValue] - [min intValue]];
    NSNumber *minSum = [NSNumber numberWithInt:[sum intValue] - [max intValue]];
    
    return @[minSum, maxSum];
}

@end
