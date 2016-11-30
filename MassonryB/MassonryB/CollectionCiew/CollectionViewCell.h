//
//  CollectionViewCell.h
//  MassonryB
//
//  Created by 唐俊杰 on 16/11/1.
//  Copyright © 2016年 MissTjj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;


@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) Model * data;

- (void)loadData:(Model * )data;

@end
