
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Robot : NSObject<NSCoding>

@property (nonatomic) NSString *name;
@property (nonatomic) CGPoint point;

- (instancetype) initWithName: (NSString*) name andPoint: (CGPoint) point;
- (CGPoint) getPoint;
- (NSString*) getName;

@end

NS_ASSUME_NONNULL_END
