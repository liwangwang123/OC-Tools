//
//  NetWorkTool.m
//  PalmLife
//

#import "NetWorkTool.h"

static const float timeOut = 60.0;

@implementation NetWorkTool

+(instancetype)sharedTools{
    static NetWorkTool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetWorkTool alloc]initWithBaseURL:nil];
        // 配置网络数据解析格式
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",nil];
    });
    instance.responseSerializer = [AFJSONResponseSerializer serializer];
    instance.requestSerializer = [AFJSONRequestSerializer serializer];
    [instance.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    instance.requestSerializer.timeoutInterval = timeOut;
    [instance.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [instance.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    return instance;
}

// 封装网络请求方法

- (void)requestMethod:(requestMethod)method URL:(NSString *)url parameters:(id)parameters finish:(callBackBlock)finished
{
    
    url = [baseurl stringByAppendingString:url];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"url-------%@",url);
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:USER_TOKEN];
//    self.requestSerializer = [AFHTTPRequestSerializer serializer];
//    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain", nil];
    if (token) {
        [self.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    }
    if (method == GET) {
        //get请求
        [self GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSError *error;
//            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
            finished(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 请求失败回调
            NSLog(@"%@",error);
            if (finished) {
                finished(nil,error);
            }
        }];
    }
    else if(method == POST)
    {
        
        [self POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSError *error;
//            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
            finished(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            if (finished) {
                finished(nil,error);
            }
        }];
    }
}

- (void)postSendJsonWithUrl:(NSString *)url prams:(NSDictionary *)params finish:(callBackBlock)finished
{
    // 1.创建请求
    url = [baseurl stringByAppendingString:url];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *Url = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:Url];
    request.HTTPMethod =@"POST";
    // 2.设置请求头
    [request setValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
//    if ([UserCache share].userToken.length != 0) {
//        [request setValue:[NSString stringWithFormat:@"Bearer %@",[UserCache share].userToken] forHTTPHeaderField:@"Authorization"];
//    }
    // 3.设置请求体
    NSDictionary *parameters = params;
    NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = data;
    // 4.发送请求
    NSLog(@"------------%@  %@ -----------",url,params);
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]completionHandler:^(NSURLResponse *response,NSData *data,NSError *connectionError) {
        
        
        if (connectionError) {
            NSLog(@"**************%@", connectionError);
            //            [ZJProgressHUD showStatus:connectionError.localizedDescription andAutoHideAfterTime:1.0f];
            if (finished) {
                finished(nil,connectionError);
            }
            
        }else{
            NSError *error;
            NSString *receiveStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSData * enddata = [receiveStr dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:enddata options:NSJSONReadingMutableLeaves error:&error];
            NSLog(@"**************%@  %@", dic,receiveStr);
            if (dic) {
                if (finished) {
                    finished(dic,nil);
                }
            }else{
                NSError *error;
                if (finished) {
                    finished(nil,error);
                }
            }
            
        }
        
    }];
    
}

//上传文件流
- (void)requestURL:(NSString *)url withParams:(NSMutableDictionary *)params fileData:(NSMutableDictionary*)fileDic finished:(callBackBlock)finished
{
    
    [self POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if(fileDic){
            [formData appendPartWithFileData:fileDic[@"data"]
                                        name:fileDic[@"nameKey"]
                                    fileName:fileDic[@"fileName"]
                                    mimeType:fileDic[@"fileType"]];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finished(responseObject,nil);
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finished(nil,error);
        NSLog(@"%@",error);
    }];
}

- (NSMutableDictionary *)params {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    
    [params addEntriesFromDictionary:self.mj_keyValues];
    
    for (id key in params.allKeys) {
        id obj = [params objectForKey:key];
        if (obj == nil || [obj isKindOfClass:[NSNull class]]) {
            [params removeObjectForKey:key];
        }
    }
    return params;
}

//上传多张图片
- (void)postMoreImageWithArray:(NSArray *)arrayWithImage name:(NSString *)name Url:(NSString *)url params:(NSDictionary *)parmas finished:(callBackBlock)finished
{
    
    url = [baseurl stringByAppendingString:url];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"url-------%@",url);
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:USER_TOKEN];
    //    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    self.responseSerializer = [AFHTTPResponseSerializer serializer];
//    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (token) {
//        [self.requestSerializer setValue:token forHTTPHeaderField:@"token"];
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    }
    
    //配置MIME类型(方法二)
    NSMutableSet *set = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
    [set addObject:@"text/html"];
    [set addObject:@"application/json"];
    [set addObject:@"text/javascript"];
    [set addObject:@"text/plain"];
    manager.responseSerializer.acceptableContentTypes = set;
    NSString *urlONe;
    urlONe = url;
    NSRange range = [url rangeOfString:@"http"];
    if (range.length != 0 ) {
        urlONe = url;
    }
    
    [manager POST:urlONe parameters:parmas constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSInteger i = 0; i < arrayWithImage.count; i++) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            //文件名
            NSString *fileName = [NSString stringWithFormat:@"%@%ld.jpg",[formatter stringFromDate:[NSDate date]],(long)i];
            UIImage *image = arrayWithImage[i];
            NSData *imageData = [self reSizeImageData:image maxImageSize:512 maxSizeWithKB:512 newSizeHegit:image.size.height newSizeWith:image.size.width];
            [formData appendPartWithFileData:imageData  name:name fileName:fileName mimeType:@"image/jpg"];
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finished(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finished(nil,error);
    }];
}

/**
 *  调整图片尺寸和大小
 *
 *  @param sourceImage  原始图片
 *  @param maxImageSize 新图片最大尺寸
 *  @param maxSize      新图片最大存储大小
 *
 *  @return 新图片imageData
 */
- (NSData *)reSizeImageData:(UIImage *)sourceImage maxImageSize:(CGFloat)maxImageSize maxSizeWithKB:(CGFloat) maxSize newSizeHegit:(CGFloat)newHegait newSizeWith:(CGFloat)newWith
{
    
    if (maxSize <= 0.0) maxSize = 1024.0;
    if (maxImageSize <= 0.0) maxImageSize = 1024.0;
    
    //先调整分辨率
    CGSize newSize = CGSizeMake(newHegait, newWith);
    
    CGFloat tempHeight = newSize.height / maxImageSize;
    CGFloat tempWidth = newSize.width / maxImageSize;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempWidth, sourceImage.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth < tempHeight){
        newSize = CGSizeMake(sourceImage.size.width / tempHeight, sourceImage.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [sourceImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //调整大小
    NSData *imageData = UIImageJPEGRepresentation(newImage,1.0);
    CGFloat sizeOriginKB = imageData.length / 1024.0;
    
    CGFloat resizeRate = 0.9;
    while (sizeOriginKB > maxSize && resizeRate > 0.1) {
        imageData = UIImageJPEGRepresentation(newImage,resizeRate);
        sizeOriginKB = imageData.length / 1024.0;
        resizeRate -= 0.1;
    }
    
    return imageData;
}
+ (NSData *)reSizeImageData:(UIImage *)sourceImage maxSizeWithKB:(CGFloat)maxSize
{
    if (!sourceImage) {
        return nil;
    }
    NSData *imageData = UIImageJPEGRepresentation(sourceImage, 1.0);
    CGFloat sizeOriginKB = imageData.length / 1024.0;
    
    CGFloat resizeRate = 0.9;
    while (sizeOriginKB > maxSize && resizeRate > 0.1) {
        imageData = UIImageJPEGRepresentation(sourceImage, resizeRate);
        sizeOriginKB = imageData.length / 1024.0;
        resizeRate -= 0.1;
    }
    
    return imageData;
}

@end
