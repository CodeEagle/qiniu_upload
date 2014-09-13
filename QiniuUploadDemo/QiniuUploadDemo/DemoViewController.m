//
//  DemoViewController.m
//  QiniuUploadDemo
//
//  Created by 胡 桓铭 on 14-5-18.
//  Copyright (c) 2014年 hu. All rights reserved.
//

#import "DemoViewController.h"
#import "QiniuUploader.h"

#define scope @"yourScope"
#define accessKey @"yourAccessKey"
#define secretKey @"yourSecretKey"

@interface DemoViewController ()<QiniuUploaderDelegate>

@end

@implementation DemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 260, 200)];
    [imageView setImage:[UIImage imageNamed:@"test.jpg"]];
    [self.view addSubview:imageView];
    
    //give token
    QiniuToken *token = [[QiniuToken alloc] initWithScope:scope SecretKey:secretKey Accesskey:accessKey];
    
    //give file
    QiniuFile *file = [[QiniuFile alloc] initWithFileData:UIImageJPEGRepresentation(imageView.image, 1.0f)];
    
    //startUpload
    QiniuUploader *uploader = [[QiniuUploader alloc] initWithToken:token];
    [uploader addFile:file];
    [uploader addFile:file];
    [uploader addFile:file];
    [uploader setDelegate:self];
    [uploader startUpload];
}

- (void)uploadOneFileSucceeded:(AFHTTPRequestOperation *)operation Index:(NSInteger)index ret:(NSDictionary *)ret
{
    NSLog(@"index:%ld ret:%@",(long)index,ret);
}

- (void)uploadAllFilesComplete
{
    NSLog(@"all complete");
}
- (void)uploadOneFileFailed:(AFHTTPRequestOperation *)operation Index:(NSInteger)index error:(NSError *)error
{
    NSLog(@"index:%ld responseObject:%@",(long)index,operation.responseObject);

}

- (void)uploadOneFileProgress:(NSInteger)index UploadPercent:(double)percent
{
    NSLog(@"index:%ld percent:%lf",(long)index,percent);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
