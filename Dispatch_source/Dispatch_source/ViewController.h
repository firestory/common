//
//  ViewController.h
//  Dispatch_source
//
//  Created by NiiLove on 2020/7/12.
//  Copyright © 2020 zengfandi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) dispatch_source_t source;
@property (nonatomic, strong) dispatch_queue_t queue;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic ,assign) unsigned long count;

@end

