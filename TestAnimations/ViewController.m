//
//  ViewController.m
//  TestAnimations
//
//  Created by Kabir Mahal on 8/19/14.
//
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    _myView = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 60, 60)];
    [self.view addSubview:_myView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 50, 20)];
    [label setText:@"test this size"];
    [label setTextColor:[UIColor blackColor]];
    [_myView addSubview:label];
    
    //[self animateUsingFrames];

    //[self animateUsingCGAffine];
}



-(void)animateUsingFrames{
    
    [UIView animateWithDuration:2.0f delay:2.0f options:UIViewAnimationOptionCurveLinear animations:^{
        [_myView setBackgroundColor:[UIColor redColor]];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0f animations:^{
            [_myView setFrame:CGRectMake(_myView.frame.origin.x, _myView.frame.origin.y+200, _myView.frame.size.width, _myView.frame.size.height)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2.0f animations:^{
                [_myView setBackgroundColor:[UIColor blueColor]];
                [_myView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:2.0f animations:^{
                    [_myView setFrame:CGRectMake(40, 40, 60, 60)];
                }];
            }];
        }];
    }];
    
}

-(void)animateUsingCGAffine{
    
    [UIView animateWithDuration:2.0f delay:2.0f options:UIViewAnimationOptionCurveLinear animations:^{
        [_myView setBackgroundColor:[UIColor redColor]];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0f animations:^{
            CGAffineTransform transform = CGAffineTransformTranslate(_myView.transform, 0, 200);
            _myView.transform = transform;

        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2.0f animations:^{
                [_myView setBackgroundColor:[UIColor blueColor]];
                _myView.transform = CGAffineTransformRotate(_myView.transform, 45.0f);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:2.0f animations:^{
                    _myView.transform = CGAffineTransformScale(_myView.transform, 2, 2);
                }];
            }];
        }];
    }];
    
    
}

@end
