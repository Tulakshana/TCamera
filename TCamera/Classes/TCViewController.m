//
//  TCViewController.m
//  TCamera
//
//  Created by T. A. Weerasooriya on 9/3/14.
//  Copyright (c) 2014 Tulakshana. All rights reserved.
//

#import "TCViewController.h"

@interface NonRotatingUIImagePickerController : UIImagePickerController

@end

@implementation NonRotatingUIImagePickerController

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}

@end

@interface TCViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    IBOutlet UIImageView *imageView;
}

@end

@implementation TCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

- (IBAction)btnCameraTapped:(id)sender{
    
    NonRotatingUIImagePickerController *imagePicker = [[NonRotatingUIImagePickerController alloc]init];
    imagePicker.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 100, 100);
    [button setTitle:@"Take Picture" forState:UIControlStateNormal];
    [button addTarget:imagePicker action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    
    [imagePicker.view addSubview:button];
    imagePicker.allowsEditing = FALSE;

    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.showsCameraControls = FALSE;

    [self presentViewController:imagePicker animated:TRUE completion:nil];
}

#pragma mark - UIImagePickerController Delegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    imageView.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
