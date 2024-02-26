
#import "Robot.h"

@implementation Robot

- (instancetype)initWithName:(NSString *)name andPoint:(CGPoint)point {
    self = [super init];
    if (self) {
        self.name = name;
        self.point = point;
    }
    return self;
}

- (CGPoint) getPoint {
    return self.point;
}

- (NSString*) getName {
    return self.name;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        float x = [coder decodeFloatForKey:@"x"];
        float y = [coder decodeFloatForKey:@"y"];
        self.point = (CGPoint){x, y};
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeFloat:self.point.x forKey:@"x"];
    [coder encodeFloat:self.point.y forKey:@"y"];
}

@end
