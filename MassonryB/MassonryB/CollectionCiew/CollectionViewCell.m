//
//  CollectionViewCell.m
//  MassonryB
//
//  Created by 唐俊杰 on 16/11/1.
//  Copyright © 2016年 MissTjj. All rights reserved.
//

#import "CollectionViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "Model.h"

@interface CollectionViewCell ()
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, assign) BOOL isLoad;

@property (nonatomic, strong) UILabel *readLabel;
@property (nonatomic, strong) UILabel *commentLabel;


@end


@implementation CollectionViewCell


- (UIImageView *)headImageView{
    if (_headImageView== nil) {
        self.headImageView = [[UIImageView alloc] init];
        _headImageView.backgroundColor = [UIColor clearColor];
    }
    return _headImageView;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        self.nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor lightGrayColor];
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.numberOfLines = 0;
        _nameLabel.preferredMaxLayoutWidth = 150.f;
    }
    return _nameLabel;
}
- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.textColor = [UIColor lightGrayColor];
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.numberOfLines = 0;
        _timeLabel.preferredMaxLayoutWidth = 150.f;
    }
    return _timeLabel;
}

- (UILabel *)ageLabel{
    if (_ageLabel == nil) {
        _ageLabel = [[UILabel alloc] init];
        _ageLabel.backgroundColor = [UIColor redColor];
        _ageLabel.textColor = [UIColor blackColor];
        _ageLabel.font = [UIFont systemFontOfSize:8];
        _ageLabel.numberOfLines = 0;
        _ageLabel.textAlignment = NSTextAlignmentCenter;
        _ageLabel.preferredMaxLayoutWidth = 40.f;
        
    }
    return _ageLabel;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
- (UILabel *)contentLabel{
    if (_contentLabel ==nil) {
        self.contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.font = [UIFont systemFontOfSize:13];
        _contentLabel.textColor = [UIColor lightGrayColor];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
- (UILabel *)readLabel{
    if (_readLabel == nil) {
        _readLabel = [[UILabel alloc] init];
        _readLabel.backgroundColor = [UIColor clearColor];
        _readLabel.textColor = [UIColor darkGrayColor];
        _readLabel.font = [UIFont systemFontOfSize:11];
        _readLabel.numberOfLines = 0;
        
    }
    return _readLabel;
}

- (UILabel *)commentLabel{
    if (_commentLabel == nil) {
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.backgroundColor = [UIColor clearColor];
        _commentLabel.textColor = [UIColor darkGrayColor];
        _commentLabel.font = [UIFont systemFontOfSize:11];
        _commentLabel.numberOfLines = 0;
        
    }
    return _commentLabel;
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.lessThanOrEqualTo(@200);
        make.width.greaterThanOrEqualTo(@320);
//        make.width.lessThanOrEqualTo(@320);
//        make.left.equalTo(self.superview.mas_left).with.offset(0);
//        make.right.equalTo(self.superview.mas_right).with.offset(0);
//        make.height.mas_equalTo(@200);
    }];
     [self setupSubViewsConstraints];
}

- (void)updateConstraints{
    [super updateConstraints];
}


//- (instancetype)init{
//    self = [super init];
//    if (self) {
//        [self setupSubViews];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.ageLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.fromLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.readLabel];
    
   
    
    /*
     UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
     UIViewAutoresizingFlexibleWidth        = 1 << 1,
     UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
     UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
     UIViewAutoresizingFlexibleHeight       = 1 << 4,
     UIViewAutoresizingFlexibleBottomMargin
     */

    NSLog(@"self.superview.class:%@",self.superview.class);
}

- (void)setupSubViewsConstraints{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImageView.mas_top);
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.height.equalTo(self.headImageView.mas_height).multipliedBy(0.5f);
    }];
    
    [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_top);
        make.left.equalTo(self.nameLabel.mas_right).offset(10);
        make.height.equalTo(self.headImageView.mas_height).multipliedBy(0.5f);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_top).offset(10);
        make.left.equalTo(self.nameLabel.mas_left);
        make.height.equalTo(self.headImageView.mas_height);
    }];
    
    [self.fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.contentView.mas_right);
        make.width.equalTo(@10);
        make.height.equalTo(@10);
        
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_left);
        make.top.equalTo(self.headImageView.mas_bottom).offset(5);
        make.height.lessThanOrEqualTo(@30);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.right.equalTo(self.titleLabel.mas_right);
        make.height.lessThanOrEqualTo(@150);
    }];
    
    [self.readLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLabel.mas_left);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(5);
        make.height.equalTo(@20);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}
- (void)loadData:(Model * )data{
    self.data = data;
    [self.nameLabel setText:self.data.login];
    [self.ageLabel setText:[NSString stringWithFormat:@"%@",self.data.age]];
    [self.titleLabel setText:self.data.source_title];
    [self.timeLabel setText:self.data.at];
    [self.fromLabel setText:self.data.from];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:self.data.avatar]];
    [self.contentLabel setText:self.data.source_content];
    [self.readLabel setText:[NSString stringWithFormat:@"%@次阅读 · %@回复",self.data.read_number,self.data.public_comments_count]];
    
}

@end
