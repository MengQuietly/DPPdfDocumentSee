//
//  ViewController.m
//  DPPdfDocumentSee
//
//  Created by Diana on 15/10/12.
//  Copyright © 2015年 Diana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIDocumentInteractionControllerDelegate>
@property (nonatomic,weak) UIButton *seePdfDocumentBtn;
@property (nonatomic,weak) UIButton *sharePdfDocumentBtn;
@property (strong, nonatomic) UIDocumentInteractionController *documentInteractionController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *seePdfDocumentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    seePdfDocumentBtn.frame = CGRectMake(100, 150, 150, 44);
    self.seePdfDocumentBtn = seePdfDocumentBtn;
    [seePdfDocumentBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [seePdfDocumentBtn setTitle:@"查看pdf文件" forState:UIControlStateNormal];
    [seePdfDocumentBtn addTarget:self action:@selector(seePdfDocumentBtnClink:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:seePdfDocumentBtn];
    
    UIButton *sharePdfDocumentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sharePdfDocumentBtn.frame = CGRectMake(100, 220, 150, 44);
    self.sharePdfDocumentBtn = sharePdfDocumentBtn;
    [sharePdfDocumentBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [sharePdfDocumentBtn setTitle:@"分享pdf文件" forState:UIControlStateNormal];
    [sharePdfDocumentBtn addTarget:self action:@selector(sharePdfDocumentBtnClink:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sharePdfDocumentBtn];

}

/** 查看PDF文件 */
-(void) seePdfDocumentBtnClink:(UIButton *) sender{
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"swiftProgramming" withExtension:@"pdf"];
    
    if (URL) {
        // 初始化文档交互控制器
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        [self.documentInteractionController setDelegate:self];
        [self.documentInteractionController presentPreviewAnimated:YES]; // 预览 PDF
    }
}

/** 分享PDF文件 */
-(void) sharePdfDocumentBtnClink:(UIButton *) sender{
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"swiftProgramming" withExtension:@"pdf"];
    
    if (URL) {
        // 初始化文档交互控制器
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        [self.documentInteractionController setDelegate:self];
        // 在菜单中的打开
        [self.documentInteractionController presentOpenInMenuFromRect:[sender frame] inView:self.view animated:YES];
    }
    
}

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
