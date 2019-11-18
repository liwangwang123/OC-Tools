//
//  NetWorkTool.h
//  PalmLife
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
//#import "AFNetworking.h"
//定义枚举
typedef enum :NSInteger{
    GET,
    POST,
}requestMethod;

typedef void(^callBackBlock)(id responseObject, NSError *error);
//当前单例是封装的三方网络框架，在这个单例类中需要使用三方网络框架的属性和方法，所以需要继承三方的类
@interface NetWorkTool : AFHTTPSessionManager
//网络工具单例类方法
+(instancetype)sharedTools;
-(void)requestMethod:(requestMethod)method URL:(NSString *)url parameters:(id)parameters finish:(callBackBlock)finished;
- (void)requestURL:(NSString *)url withParams:(NSMutableDictionary *)params fileData:(NSMutableDictionary*)fileDic finished:(callBackBlock)finished;
- (void)postSendJsonWithUrl:(NSString *)url prams:(NSDictionary *)params finish:(callBackBlock)finished;

- (void)postMoreImageWithArray:(NSArray *)arrayWithImage name:(NSString *)name Url:(NSString *)url params:(NSDictionary *)parmas finished:(callBackBlock)finished;
@end
