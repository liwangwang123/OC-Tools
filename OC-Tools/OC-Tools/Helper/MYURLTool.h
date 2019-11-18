//
//  MYURLTool.h
//  MoYu-1
//
//  Created by 王力 on 2019/10/24.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#ifndef MYURLTool_h
#define MYURLTool_h

//陌娱接口
#define baseurl @"http://47.101.29.248:9000"
//#define baseurl @"http://47.102.255.175:9000"
//#define baseurl @"https://chat.mioyiu.com"

// 获取验证码
#define Verification_Code @"/gw/m/n/membership/user/login/sms"
// 登录
#define LOGIN @"/gw/m/n/membership/user/login"
// 提交做题结果
#define RESULT @"/gw/m/n/membership/e/user/ins"
// 抢单列表
#define QiangDanList @"/gw/m/n/membership/e/chat/sel"
// 抢单列表
#define OuYuList @"/gw/m/s/membership/e/meet"
// 抢单
#define QiangDan @"/gw/m/n/membership/e/chat/meek"
#define XunMi @"/gw/m/n/membership/e/chat/search"
#define SystemMessage @"/gw/m/n/chat/e/sysinfo/sel"
#define VideoPerson @"/gw/m/n/e/chat/sel/video/person"
// 寻觅Ta
#define XunMiQiangTa @"/gw/m/s/membership/e/chat"
// 发起求聊
#define StartChat @"/gw/m/n/membership/e/chat/seek"
// 退出视频等待
#define CancelVideoWating @"/gw/m/n/membership/e/chat/out"
// 视频开始
#define VideoStart @"/gw/m/n/membership/e/chat/start"
// 视频结束
#define VideoEnd @"/gw/m/n/membership/e/chat/end"
// 添加主播评论
#define AddComment @"/gw/o/s/operation/add/content"
// 视频后聊单数据查询查询
#define  VideoChatQuery @"/gw/m/n/membership/e/chat/selchat"
// 个人中心
#define PersonCenter @"/gw/m/s/membership/e/sel/person"
// 保存个人中心信息
#define SavePersonInfo @"/gw/m/n/chat/e/user/update"
// 钱包查询
#define WalletQuery @"/gw/m/n/membership/e/chat/wallet"
// 保存三张生活照
#define SaveThreePhoto @"/gw/o/s/operation/dvideo/add/background"
// 个人身份证正面照
#define idCardFront @"/gw/m/n/membership/e/chat/idcard/front"
// 个人身份证反面照
#define idCardBack @"/gw/m/n/membership/e/chat/idcard/back"
// 个人入驻信息提交
#define personRnter @"/gw/m/n/chat/e/user/rnter"
// 通用(上传图片)
#define updatePhotoUrl @"/gw/o/s/operation/chat/add/photo"
// 生活照片
#define lifePhoto @"/gw/o/s/operation/dvideo/add/background"
// 个人素颜照
#define plainPhoto @"/gw/m/n/membership/e/chat/detect/face"
// 公会入驻查询
#define sociatyQuery @"/gw/m/n/chat/e/sociaty/sel/rnter"
// 法人身份证-前
#define corporateIdcardFront @"/gw/m/n/membership/e/sociaty/idcard/front"
// 法人身份证-后
#define reverseIdcardFront @"/gw/m/n/membership/e/sociaty/idcard/back"
// 公会入驻信息提交
#define sociatyRnter @"/gw/m/n/chat/e/sociaty/rnter"
// 关注
#define attention @"/gw/m/n/chat/e/user/attention"
// 好友列表
#define getConcern @"/gw/m/n/chat/e/sel/user/concern"
// 关注列表
#define ConcernedPeople @"/gw/m/n/chat/e/sel/user/id"
// tokne
#define USER_TOKEN @"token"
// status 100 未做题, 101 已做题
#define USER_STATUS @"status"
// 用户id
#define USER_ID @"userId"
#define USER_PHONE @"userPhone"

// 用户测试结果
#define UserTestResult @"userTestresult"


#endif /* MYURLTool_h */
