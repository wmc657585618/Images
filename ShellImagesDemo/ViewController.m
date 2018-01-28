//
//  ViewController.m
//  ShellImagesDemo
//
//  Created by Four on 2018/1/28.
//  Copyright © 2018年 Four. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+Assets.h"

#import "UIImage+Bundle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    imageView.image = [UIImage icon_1];
    
    imageView.frame = self.view.bounds;
    
    [self.view addSubview:imageView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
