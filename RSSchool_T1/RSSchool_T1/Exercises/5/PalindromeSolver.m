#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSMutableArray *arr = [PalindromeSolver parseStrToArr: s];
    int count = 0;
    long prevMax = 0;

    for (int i = ([n intValue] / 2); i >= 0; i -= 1) {

        NSInteger leftElem = [[arr objectAtIndex: i] integerValue];
        NSInteger rightElem = [[arr objectAtIndex: ([n intValue] - i - 1) ] integerValue];
        if (leftElem != rightElem) {
            prevMax = MAX(prevMax, MAX(leftElem, rightElem));
            arr[i] = [NSString stringWithFormat:@"%ld", prevMax];
            arr[([n intValue] - i - 1)] = [NSString stringWithFormat:@"%ld", prevMax];

            if (leftElem != prevMax) {
                count += 1;
            }

            if (rightElem != prevMax) {
                count += 1;
            }
        }
    }

    return  count == [k intValue] ? [arr componentsJoinedByString:@""] : @"-1";
}

+ (NSMutableArray*)parseStrToArr: (NSString *)str {
    NSMutableArray *arrStr = [[NSMutableArray alloc] initWithArray:@[]];
    NSUInteger strLength = [str length];
    for (int i = 0; i < strLength; i++) {
        NSString *ch = [str substringWithRange:NSMakeRange(i, 1)];
        [arrStr addObject:ch];
    }
    return arrStr;
}

@end
