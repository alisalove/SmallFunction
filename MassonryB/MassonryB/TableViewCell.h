//
//  TableViewCell.h
//  MassonryB
//
//  Created by 唐俊杰 on 16/10/31.
//  Copyright © 2016年 MissTjj. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Model.h"
@class Model;

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) Model * data;

- (void)loadData:(Model * )data;


@end
