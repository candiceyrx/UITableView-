/*!
 @header LLHeaderView.h
 
 @abstract 作者Github地址: https://github.com/candiceyrx
 
 @author Created by Candice on 16/8/17
 
 @version 1.00 16/8/17 Creation(版本信息)
 
   Copyright © 2016年 刘灵. All rights reserved.
 */

#import <UIKit/UIKit.h>

@class LLSectionModel;

typedef void(^LLHeaderViewExpandCallback)(BOOL isExpanded);

@interface LLHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) LLSectionModel *model;
@property (nonatomic, copy) LLHeaderViewExpandCallback expandCallback;

@end
