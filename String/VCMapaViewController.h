//
//  VCMapaViewController.h
//  String
//
//  Created by Verónica Cordobés on 09/09/14.
//  Copyright (c) 2014 Verónica Cordobés. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCEleccion.h"

@interface VCMapaViewController : UIViewController{
    IBOutlet UILabel *etiquetaTiempo;
    UIImage *ejeX;
    UIImage *ejeY;
    UIImage *pixel;
    UIImage *pixel2;
    UIImage *pixel3;
    UIImage *volver;
}

@property VCEleccion *eleccionO;
@property (strong,nonatomic) UIImageView *vista;
@property(nonatomic, retain)IBOutlet UIWebView * webView;

-(IBAction)volver;

@end
