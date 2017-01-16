//
//  VCEligeViewController.h
//  String
//
//  Created by Verónica Cordobés on 08/09/14.
//  Copyright (c) 2014 Verónica Cordobés. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCEleccion.h"


@interface VCEligeViewController : UIViewController{
    
    UIImage * elige;
    UIImage * foto1;
    UIImage * foto2;
    UIImage * pixel1;
    UIImage * pixel2;
    UIImage * map;
    NSNumber * numFoto;

}

@property UIImageView * vista;
@property VCEleccion * eleccionO;


-(IBAction)foto1;
-(IBAction)foto2;
-(IBAction)mapa;

@end
