//
//  UIScrollView+GMUPreload.m
//  FaceBook
//
//  Created by FaceBook on 2018/12/13.
//  Copyright © 2018 FaceBook. All rights reserved.
//

#import "UIScrollView+GMUPreload.h"

#import <objc/runtime.h>

static const char * keyDataArray = "keyDataArray";

static const char * keyPreloadBlock = "keyPreloadBlock";

static const char * keyPreloadMinCount = "preloadMinCount";

@implementation UIScrollView (GMUPreload)

-(PreloadBlock)preloadBlock{
    return objc_getAssociatedObject(self, &keyPreloadBlock);
}

-(void)setPreloadBlock:(PreloadBlock)preloadBlock{
  objc_setAssociatedObject(self, &keyPreloadBlock, preloadBlock, OBJC_ASSOCIATION_COPY);
}
-(void)setPreloadMinCount:(NSNumber *)preloadMinCount{
    
    objc_setAssociatedObject(self, &keyPreloadMinCount, preloadMinCount, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(NSNumber*)preloadMinCount{

    return objc_getAssociatedObject(self, &keyPreloadMinCount);
    
}
- (NSArray *)datas{
    return objc_getAssociatedObject(self, &keyDataArray);
}
-(void)setDatas:(NSArray *)datas{
   objc_setAssociatedObject(self, &keyDataArray, datas, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)preloadDataWithCurrentIndex:(NSInteger)currentIndex{
    
    NSInteger totalCount = self.datas.count;
    
    if ([self  isPreloadDataWithTotalCount:totalCount currentIndex:currentIndex+1]&&self.preloadBlock) {
        self.preloadBlock();
    }
}
- (BOOL)isPreloadDataWithTotalCount:(NSInteger)totalCount currentIndex:(NSInteger)currentIndex{
    
    return  ((currentIndex == totalCount - self.preloadMinCount.integerValue) && (currentIndex >= self.preloadMinCount.integerValue));
    
}
@end
