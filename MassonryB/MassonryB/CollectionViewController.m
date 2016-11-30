//
//  CollectionViewController.m
//  MassonryB
//
//  Created by 唐俊杰 on 16/11/1.
//  Copyright © 2016年 MissTjj. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "Masonry.h"
#import "Model.h"
#import "YYModel.h"

@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@end

@implementation CollectionViewController

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout * layouts = [[UICollectionViewFlowLayout alloc]init];
//        layouts.estimatedItemSize = CGSizeMake(320,200);
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layouts];
        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];

    


    [self request];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}
- (void)request{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"res" ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSArray *list = dic[@"list"];
    NSLog(@"list: %@",list);
    
    for (int i = 0; i<list.count ; i++) {
        NSDictionary *dic = [list objectAtIndex:i];
        Model *data = [Model yy_modelWithJSON:dic];
        [self.dataArray addObject:data];
    }
    [self.collectionView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell loadData:self.dataArray[indexPath.row]];
    return cell;
    
}
#pragma mark -UICollectionViewDelegateFlowLayout
//设置每个单元格的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSInteger columnsNum = 2;
    NSInteger LayoutsizeWith = [UIScreen mainScreen].bounds.size.width;
//    CGFloat itemWidth =(collectionViewWidth -14-18*BLOC_W_ADJUST* (columnsNum -1))/columnsNum;
    //    NSLog(@"cell的宽--%f，collectionViewWidth宽-->%ld",itemWidth,(long)collectionViewWidth);
    return CGSizeMake(LayoutsizeWith, 300);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [self.collectionView reloadData];
}
////设置纵向的行间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 5;
//    
//}
//
////设置单元格间的横向间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    
//    return 2;
//}
////通过调整inset使单元格顶部和底部都有间距(inset次序: 上，左，下，右边)
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(0, 7, 0, 7);
//}



@end
