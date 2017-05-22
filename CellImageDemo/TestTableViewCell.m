//
//  TestTableViewCell.m
//  CellImageDemo
//
//  Created by Eva on 16/2/24.
//  Copyright © 2016年 Eva. All rights reserved.
//
#define WIDTH                           [[UIScreen mainScreen]bounds].size.width

#import "TestTableViewCell.h"
@interface TestTableViewCell()
{
    UIImageView *_imageV;
}
@end

@implementation TestTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH - 40, 150)];
        
        UIImage *image = [UIImage imageNamed:@"14745399896141.jpg"];
        _imageV.image = [self cutImage:image];
//        _imageV.image = image;
        _imageV.backgroundColor = [UIColor grayColor];
//        _imageV.contentMode = UIViewContentModeScaleAspectFill;
//        _imageV.clipsToBounds = YES;
        [self.contentView addSubview:_imageV];
        
        
    }
    return self;
}
//裁剪图片
- (UIImage *)cutImage:(UIImage*)image
{
    //压缩图片
    CGSize newSize;
    CGImageRef imageRef = nil;
    
    if ((image.size.width / image.size.height) < (_imageV.frame.size.width /_imageV.frame.size.height)) {
        newSize.width = image.size.width;
        newSize.height = image.size.width * _imageV.frame.size.height / _imageV.frame.size.width;
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0, fabs(image.size.height - newSize.height) / 2, newSize.width, newSize.height));
        
    } else {
        newSize.height = image.size.height;
        newSize.width = image.size.height * _imageV.frame.size.width / _imageV.frame.size.height;
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(fabs(image.size.width - newSize.width) / 2, 0, newSize.width, newSize.height));
        
    }
    return [UIImage imageWithCGImage:imageRef];
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
