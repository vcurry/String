//
//  VCViewController.m
//  String
//
//  Created by Verónica Cordobés on 08/09/14.
//  Copyright (c) 2014 Verónica Cordobés. All rights reserved.
//

#import "VCViewController.h"

@interface VCViewController ()

@end

@implementation VCViewController
@synthesize vista=vista;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 

    StringTitulo = [UIImage imageNamed:@"String titulo.png"];

    self->vista=[[UIImageView alloc] initWithImage:StringTitulo];
    self->vista.contentMode = UIViewContentModeCenter;
    self->vista.center=self.view.center;
    [self.view addSubview:vista];
    [self performSelector:@selector(cambiarPantalla) withObject:nil afterDelay:3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cambiarPantalla{
    VCViewController * controlador = [self.storyboard instantiateViewControllerWithIdentifier:@"eligeviewcontroller"];
    
    [self.navigationController pushViewController:controlador animated:NO];
}


@end
