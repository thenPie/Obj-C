
#import "ViewController.h"
#import "Robot.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self.button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
}

- (void) buttonTapped {
    
    float x = [self.x.text floatValue];
    float y = [self.y.text floatValue];
    NSString *name = self.name.text;
    
    NSLog(@"Данные из текстовых полей:");
    NSLog(@"x: %f", x);
    NSLog(@"y: %f", y);
    NSLog(@"name: %@", name);
    
    CGPoint point = CGPointMake(x, y);
    
    Robot *robot = [[Robot alloc] initWithName:name andPoint:point];
    
    [self saveRobotToUserDefaults: (Robot*) robot];
    
    [self getRobotFromUserDefaults: (NSString*) name];
}

- (void) saveRobotToUserDefaults: (Robot*) robot {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:NO error:NULL];
    
    [userDefaults setObject:data forKey:[robot getName]];
}

- (void) getRobotFromUserDefaults: (NSString*) name {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [userDefaults objectForKey:name];
    
    Robot *robot = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"Данные из UserDefaults:");
    NSLog(@"x: %f", robot.getPoint.x);
    NSLog(@"y: %f", robot.getPoint.y);
    NSLog(@"name: %@", robot.getName);
    
    self.textView.text = [NSString stringWithFormat: @"x: %f \ny: %f \nname: %@", robot.getPoint.x, robot.getPoint.y, robot.getName];
}

@end
