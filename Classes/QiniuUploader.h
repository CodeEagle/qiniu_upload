//
//  QiniuUploader.h
//  QiniuUploadDemo
//
//  Created by 胡 桓铭 on 14-5-17.
//  Copyright (c) 2014年 hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "QiniuToken.h"
#import "QiniuFile.h"


typedef void (^UploadOneFileSucceededBlock)(AFHTTPRequestOperation *operation, NSInteger index, NSString *key);
typedef void (^UploadOneFileFailedBlock)(AFHTTPRequestOperation *operation, NSInteger index, NSDictionary *error);
typedef void (^UploadOneFileProgressBlock)(AFHTTPRequestOperation *operation, NSInteger index, double percent);
typedef void (^UploadAllFilesCompleteBlock)(void);

@interface QiniuUploader : NSObject


@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (retain, nonatomic) QiniuToken *token;
@property (retain, nonatomic) NSMutableArray *files;

@property (nonatomic, copy) UploadOneFileSucceededBlock uploadOneFileSucceeded;
@property (nonatomic, copy) UploadOneFileFailedBlock uploadOneFileFailed;
@property (nonatomic, copy) UploadOneFileProgressBlock uploadOneFileProgress;
@property (nonatomic, copy) UploadAllFilesCompleteBlock uploadAllFilesComplete;


/**
 *  add QiniuFile to QiniuUploader
 *  @param file QiniuFile
 */
- (void)addFile:(QiniuFile *)file;
/**
 *  Upload binary data to qiniu cloud storage.
 *  @param theFiles binary data of upload file
 */
- (void)addFiles:(NSArray *)theFiles;

/**
 *  start upload files to qiniu cloud storage.
 *  @return Boolean if files were nil, it will return NO.
 */
- (Boolean)startUpload;

/**
 *  cancel and clear All Upload Task
 */
- (Boolean)cancelAllUploadTask;


@end
