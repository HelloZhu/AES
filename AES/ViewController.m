//
//  ViewController.m
//  AES
//
//  Created by dd2333 on 2017/4/5.
//  Copyright © 2017年 dd2333. All rights reserved.
//

#import "ViewController.h"
#import "AESCrypt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *str = @"hello world";
    NSString *passwd = @"1234567890abcdef";
    
    NSString *ciphertext = [AESCrypt encrypt:str password:passwd];
    NSString *plaintext = [AESCrypt decrypt:ciphertext password:passwd];
    
    NSLog(@"\nplaintext:%@\nciphertext:%@",plaintext,ciphertext);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
