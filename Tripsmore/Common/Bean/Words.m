//
//  AnswerBean.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 8/3/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "Words.h"

@implementation Words

//+ (AnswerBean *) parseFromDict:(NSDictionary *)dict;
//{
//    AnswerBean *obj = [[AnswerBean alloc] init];
//    if ((id)dict == [NSNull null] || ![dict isKindOfClass:[NSDictionary class]]) {
//        return obj;
//    }
//    
//    obj.mId = SAFE_STR(dict[@"_id"]);
//    obj.attachment_images = dict[@"attachment_images"];
//    obj.content = SAFE_STR(dict[@"content"]);
//    obj.created_date = SAFE_STR(dict[@"created_date"]);
//    obj.doctor_accepted = dict[@"doctor_accepted"];
//    obj.approved = SAFE_NUM(dict[@"approved"]);
//    if ([dict[@"doctor_id"] isKindOfClass:[NSDictionary class]]) {
//        obj.doctor_obj = [DoctorBean parseFromDict:dict[@"doctor_id"]];
//    } else {
//        obj.doctor_id = SAFE_STR(dict[@"doctor_id"]);
//    }
//    obj.number_of_shared = SAFE_STR(dict[@"number_of_shared"]);
//    obj.number_of_thanks = dict[@"number_of_thanks"];
//    NSMutableArray *arr_temp_thank = [NSMutableArray array];
//    for (id object in obj.number_of_thanks) {
//        if ([object isKindOfClass:[NSString class]]) {
//            [arr_temp_thank addObject:object];
//        } else if ([object isKindOfClass:[NSDictionary class]]) {
//            User *usr_tmp = [User parseFromDictionary:object];
//            [arr_temp_thank addObject:usr_tmp.serverId];
//        }
//    }
//    obj.number_of_thanks = arr_temp_thank;
//    
//    obj.question_id = SAFE_STR(dict[@"question_id"]);
//    
//    return obj;
//}
//
//
//+ (NSMutableArray *) parseFromArray:(NSArray *)arr;
//{
//    NSMutableArray *arrResult = [NSMutableArray array];
//    for (NSDictionary *dic in arr) {
//        AnswerBean *obj = [AnswerBean parseFromDict:dic];
//        [arrResult addObject:obj];
//    }
//    return arrResult;
//}

@end
