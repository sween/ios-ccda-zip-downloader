//
//  ViewController.h
//  MyHealthCCDADownload
//
//  Created by Ron Sweeney on 1/5/14.
//  Copyright (c) 2014 Ron Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSZipArchive.h"

@interface ViewController : UIViewController <UIDocumentInteractionControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *getCCDA;
@property (weak, nonatomic) IBOutlet UIButton *unzipCCDA;
@property (nonatomic, strong) UIDocumentInteractionController *controller;

- (IBAction)getCCDA:(id)sender;
- (IBAction)unzipCCDA:(id)sender;
- (IBAction)openPDF:(id)sender;

@end
