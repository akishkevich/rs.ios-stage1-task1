#import "T1Array.h"

@interface T1Array()

@property (assign, nonatomic) BOOL isArrayHappy;

@end

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if (!sadArray || !sadArray.count) {
        NSLog(@"sadArray is empty");
        return @[];
    }
    if (sadArray.count == 1) {
        NSLog(@"sadArray is happy. Elements count of sadArray equals 1");
        return sadArray;
    }
    NSArray *happyArray = [self cleanUpArray:sadArray];
    NSLog(@"%@", happyArray);
    return happyArray;
}

- (NSArray *)cleanUpArray: (NSArray *)sadArray {
    
    NSMutableArray *entryArray = [[NSMutableArray alloc] initWithArray: sadArray];
    NSMutableArray *cleanupArr = [[NSMutableArray alloc] init];
    
    int tick = 1;
    while (![entryArray isEqualToArray: cleanupArr]) {
        if (tick != 1) {
            entryArray = [cleanupArr copy];
        }
        NSUInteger count = [entryArray count];
        cleanupArr = [[NSMutableArray alloc] initWithArray: @[]];;
        for (int i = 0; i < count; i++) {
            int currValue = [[entryArray objectAtIndex: i] intValue];
            if (i == 0 || i == count - 1) {
                [cleanupArr addObject: @(currValue)];
            } else {
                int lElem = [[entryArray objectAtIndex: i - 1] intValue];
                int rElem = [[entryArray objectAtIndex: i + 1] intValue];
                int sum= lElem + rElem;
                if (sum > currValue) {
                    [cleanupArr addObject: @(currValue)];
                }
            }
        }
        tick++;
    }
    return [NSArray arrayWithArray:cleanupArr];
}

@end
