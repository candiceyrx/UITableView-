/*!
 @header LLHeaderView.m
 
 @abstract 作者Github地址: https://github.com/candiceyrx
 
 @author Created by Candice on 16/8/17
 
 @version 1.00 16/8/17 Creation(版本信息)
 
   Copyright © 2016年 刘灵. All rights reserved.
 */

#import "LLHeaderView.h"
#import "LLSectionModel.h"

@interface LLHeaderView()

@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LLHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        
        self.arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brand_expand"]];
        self.arrowImageView.frame = CGRectMake(10, (44 - 8) / 2, 15, 8);
        [self.contentView addSubview:self.arrowImageView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(onExpand:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        button.frame = CGRectMake(0, 0, w, 44);
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 200, 44)];
        self.titleLabel.textColor = [UIColor greenColor];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 44 - 0.5, w, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:line];
    }
    
    return self;
}

- (void)setModel:(LLSectionModel *)model {
    if (_model != model) {
        _model = model;
    }
    
    if (model.isExpanded) {
        self.arrowImageView.transform = CGAffineTransformIdentity;
    } else {
        self.arrowImageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    
    self.titleLabel.text = model.sectionTitle;
}

- (void)onExpand:(UIButton *)sender {
    self.model.isExpanded = !self.model.isExpanded;
    
    [UIView animateWithDuration:0.25 animations:^{
        if (self.model.isExpanded) {
            self.arrowImageView.transform = CGAffineTransformIdentity;
        } else {
            self.arrowImageView.transform = CGAffineTransformMakeRotation(M_PI);
        }
    }];
    
    if (self.expandCallback) {
        self.expandCallback(self.model.isExpanded);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
