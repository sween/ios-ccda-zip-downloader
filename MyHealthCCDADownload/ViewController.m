//
//  ViewController.m
//  MyHealthCCDADownload
//
//  Created by Ron Sweeney on 1/5/14.
//  Copyright (c) 2014 Ron Sweeney. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getCCDA:(id)sender {
    
   NSString *stringURL = @"http://www.integrationrequired.com/wp-content/ccda/ccda2.zip";
    NSURL  *url = [NSURL URLWithString:stringURL];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    if ( urlData )
    {
        NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString  *documentsDirectory = [paths objectAtIndex:0];
        
        NSString  *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"ccda2.zip"];
        [urlData writeToFile:filePath atomically:YES];
    }
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Download Complete!"
                          message: @"ccda.zip is now available in Sandbox/Documents folder."
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
   

    
    
    
}

- (IBAction)unzipCCDA:(id)sender {
    
    //NSString *zipPath = @"path_to_your_zip_file";
    
    NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString  *documentsDirectory = [paths objectAtIndex:0];

    NSString *zipPath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"ccda2.zip"];
    NSString *destinationPath = documentsDirectory;
    
    [SSZipArchive unzipFileAtPath:zipPath toDestination:destinationPath];
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Unzipped ccda.zip to folder cccda."
                          message: @"ccda folder is now available in Sandbox/Documents folder."
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];

    
    
    
}


- (IBAction)openPDF:(id)sender
{
    //NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString  *documentsDirectory = [paths objectAtIndex:0];
    
    
    
   // NSString *zipPath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"ccda.zip"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"ccda.zip"];
    
    
    //NSString *fileDir = [documentsDirectory stringByAppendingPathComponent:@"/MyChart Health Summary download for CNRTest, Koepke 9.20.13 2"];
    
    //NSString *filePath = [fileDir stringByAppendingPathComponent:@"! My Health Summary.pdf"];
    
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@/%@", documentsDirectory, @"ccda2", @"ccda2.pdf"];
    
    //NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"ccda2.pdf"];
    
    NSLog(filePath);

    
    NSURL *URL = [NSURL fileURLWithPath:filePath];


    //NSURL *URL = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%@/%@", documentsDirectory,@"ccda.pdf"] withExtension:@"pdf"];
    
    if (URL)
    {
        self.controller = [UIDocumentInteractionController interactionControllerWithURL:URL];
        self.controller.delegate = self;
        
        // Present "Open In Menu"
        [self.controller presentOpenInMenuFromRect:[sender frame] inView:self.view animated:YES];
    } 
}


@end
