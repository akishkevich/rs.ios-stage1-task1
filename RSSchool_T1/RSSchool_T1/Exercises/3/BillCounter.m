#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray *billArr = [[NSMutableArray alloc] initWithArray: bill];
    [billArr removeObjectAtIndex:index];
    int sumAnn = [[billArr valueForKeyPath:@"@sum.self"] intValue] / 2;

    if ([sum intValue] == sumAnn) {
        return  @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%d", [sum intValue] - sumAnn];
    }
}

@end
