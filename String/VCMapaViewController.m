//
//  VCMapaViewController.m
//  String
//
//  Created by Verónica Cordobés on 09/09/14.
//  Copyright (c) 2014 Verónica Cordobés. All rights reserved.
//

#import "VCMapaViewController.h"
#import "VCEligeViewController.h"
#import "VCEleccion.h"
#import "VCAppDelegate.h"

@interface VCMapaViewController ()

@end

@implementation VCMapaViewController

@synthesize eleccionO=eleccionO, vista=vista, webView=webView;


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
/*    volver=[UIImage imageNamed:@"chooseButton"];
    self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(20,20,volver.size.width/2,volver.size.height/2)];
    self.vista.image=volver;
    [self.view addSubview:vista];
    */
    VCAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
	NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Eleccion" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    context = [appDelegate managedObjectContext];
    NSManagedObject *eleccion = [NSEntityDescription insertNewObjectForEntityForName:@"Eleccion"
                                                              inManagedObjectContext:context];
    

    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:request error:&error];
    for (eleccion in fetchedObjects) {
        NSNumber * fotoM = [eleccion valueForKey:@"foto"];
        NSString * horaM =[eleccion valueForKey:@"hora"];
        NSString * minutoM = [eleccion valueForKey:@"minuto"];
        if ([fotoM isEqualToNumber:@0]) {
            pixel = [UIImage imageNamed:@"pixel.png"];
        } else if ([fotoM isEqualToNumber:@1]) {
            if ([horaM isEqualToString:self.eleccionO.hora] && [minutoM isEqualToString:self.eleccionO.minuto]) {
                    pixel = [UIImage imageNamed:@"pixel1red.png"];
            }else{
                    pixel = [UIImage imageNamed:@"pixel1.png"];
            }

        } else if ([fotoM isEqualToNumber:@2]){
            if ([horaM isEqualToString:self.eleccionO.hora] && [minutoM isEqualToString:self.eleccionO.minuto]) {
                pixel = [UIImage imageNamed:@"pixel2red.png"];
            }else{
                pixel = [UIImage imageNamed:@"pixel2.png"];
            }

        }
        CGFloat xPixel = 175+([horaM intValue]*15);
        CGFloat yPixel = 43+([minutoM intValue]*15);
        self.vista = [[UIImageView alloc] initWithFrame:CGRectMake(xPixel, yPixel, 45, 45)];
        self.vista.image = pixel;
        [self.view addSubview:vista];
        NSLog(@"Foto: %@", [eleccion valueForKey:@"foto"]);
        NSLog(@"Hora: %@", [eleccion valueForKey:@"hora"]);
        NSLog(@"Minuto: %@", [eleccion valueForKey:@"minuto"]);
        
    }

    for (int i=0; i<24; i++) {
        NSString * imagen = [NSString stringWithFormat:@"%d.png",i];
        ejeX = [UIImage imageNamed:imagen];
        CGFloat x = 190+(i*15);
        self->vista = [[UIImageView alloc] initWithFrame:CGRectMake(x, 43, 15, 15)];
        self->vista.image = ejeX;
        [self.view addSubview:vista];
    }
    
    for (int f=0; f<60; f++) {
        NSString * imagen = [NSString stringWithFormat:@"%d.png",f];
        ejeY = [UIImage imageNamed:imagen];
        CGFloat y = 58+(f*15);
        self->vista = [[UIImageView alloc] initWithFrame:CGRectMake(170, y, 15, 15)];
        self->vista.image = ejeY;
        [self.view addSubview:vista];
    }
  //      [self performSelector:@selector(volverPantalla) withObject:nil afterDelay:15];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)volver{
    VCMapaViewController * controlador = [self.storyboard instantiateViewControllerWithIdentifier:@"eligeviewcontroller"];
    [self.navigationController pushViewController:controlador animated:NO];
}


@end
