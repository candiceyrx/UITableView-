/*!
 @header LLSectionModel.h
 
 @abstract 作者Github地址: https://github.com/candiceyrx
 
 @author Created by Candice on 16/8/17
 
 @version 1.00 16/8/17 Creation(版本信息)
 
   Copyright © 2016年 刘灵. All rights reserved.
 */
#import <Foundation/Foundation.h>

//分区模型
@interface LLSectionModel : NSObject

@property (nonatomic, copy) NSString *sectionTitle;
//是否是展开的
@property (nonatomic, assign) BOOL isExpanded;
//分区下面可以有很多个cell对应的模型
@property (nonatomic, strong) NSMutableArray *cellModels;

@end

@interface LLCellModel : NSObject

@property (nonatomic, copy) NSString *title;

@end
