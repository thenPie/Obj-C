
#import "SecondViewController.h"
#import "Robot.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
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
    
    [self saveRobotToFile: (Robot*) robot];
    
    [self getRobotFromFile: (NSString*) name];
}

- (void) saveRobotToFile: (Robot*) robot {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *url = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    
    NSURL *newFolderUrl = [url URLByAppendingPathComponent:@"robots"];
    
    NSURL *pathOfData = [newFolderUrl URLByAppendingPathComponent:[robot getName]];
    
    NSData *textData = [[NSString stringWithFormat: @"x: %f \ny: %f \nname: %@", robot.getPoint.x, robot.getPoint.y, robot.getName] dataUsingEncoding:kCFStringEncodingUTF8];
    
    if ([fileManager createDirectoryAtURL:newFolderUrl withIntermediateDirectories:YES attributes:NULL error:NULL]) {

        if ([fileManager fileExistsAtPath:pathOfData.path]) {
            [fileManager removeItemAtPath:pathOfData.path error:NULL];
        }
        [fileManager createFileAtPath:pathOfData.path contents:textData attributes:NULL];
    }
}

- (void) getRobotFromFile: (NSString*) name {
        
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *url = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSURL *folderUrl = [url URLByAppendingPathComponent:@"robots"];
    
    NSURL *pathOfData = [folderUrl URLByAppendingPathComponent:name];
    
    if ([fileManager fileExistsAtPath:pathOfData.path]) {
        
        NSData *data = [NSData dataWithContentsOfURL:pathOfData];
        NSString *text = [[NSString alloc] initWithData:data encoding:kCFStringEncodingUTF8];
        
        NSLog(@"Данные из файла: %@", text);
        
        self.textView.text = text;
    }
}

@end
