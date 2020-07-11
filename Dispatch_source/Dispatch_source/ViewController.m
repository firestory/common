//
//  ViewController.m
//  Dispatch_source
//
//  Created by NiiLove on 2020/7/12.
//  Copyright © 2020 zengfandi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.count = 0;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.label.center = self.view.center;
    self.label.text = @"0";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    
    self.queue = dispatch_queue_create("source", DISPATCH_QUEUE_CONCURRENT);
    self.source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, self.queue);
    
    dispatch_source_set_event_handler(self.source, ^{
        unsigned long  a = dispatch_source_get_data(self.source);
        self.count += a;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.label.text = [NSString stringWithFormat:@"%ld",self.count];
        });
    });
    dispatch_resume(self.source);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_source_merge_data(self.source, 1);
    });

}


@end
