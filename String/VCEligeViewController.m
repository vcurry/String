//
//  VCEligeViewController.m
//  String
//
//  Created by Verónica Cordobés on 08/09/14.
//  Copyright (c) 2014 Verónica Cordobés. All rights reserved.
//

#import "VCEligeViewController.h"
#import "VCMapaViewController.h"
#import "VCAppDelegate.h"
#import <sys/time.h>

@interface VCEligeViewController ()

@end

@implementation VCEligeViewController

@synthesize vista=vista, eleccionO=eleccionO;

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
    
/*    map=[UIImage imageNamed:@"mapButton"];
    self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(680, 20, map.size.width/2, map.size.height/2)];
    self.vista.image=map;
    [self.view addSubview:vista];
   */ 
    NSDate * currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"d"];
    NSString * currentDay = [dateFormatter stringFromDate: currentDate];
    int day = [currentDay intValue]%3;
    NSLog(@"dia: %d", day);
    
    if (day==0) {
        foto1 = [UIImage imageNamed:@"Stringapp-1.jpg"];
        self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(55,300,299,480)];
        self.vista.image=foto1;
        [self.view addSubview:vista];
        
        foto2 = [UIImage imageNamed:@"Stringapp-2.jpg"];
        self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(415,300,299,480)];
        self.vista.image=foto2;
        [self.view addSubview:vista];
        
    }else if (day==1){
        foto1 = [UIImage imageNamed:@"Stringapp-3.jpg"];
        self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(55,300,299,480)];
        self.vista.image=foto1;
        [self.view addSubview:vista];
        
        foto2 = [UIImage imageNamed:@"Stringapp-4.jpg"];
        self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(415,300,299,480)];
        self.vista.image=foto2;
        [self.view addSubview:vista];
        
    }else if (day==2){
        foto1 = [UIImage imageNamed:@"Stringapp-5.jpg"];
        self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(55,300,299,480)];
        self.vista.image=foto1;
        [self.view addSubview:vista];
        
        foto2 = [UIImage imageNamed:@"Stringapp-6.jpg"];
        self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(415,300,299,480)];
        self.vista.image=foto2;
        [self.view addSubview:vista];

    }
    NSLog(@"dia: %@", currentDay);

    
    numFoto = 0;
    elige = [UIImage imageNamed:@"elige.jpg"];
    self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(330,120,100,100)];
    self.vista.image=elige;
    self.vista.contentMode = UIViewContentModeCenter;
    [self.view addSubview:vista];
    
/*    foto1 = [UIImage imageNamed:@"Stringapp-1.jpg"];
    self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(55,300,299,480)];
    self.vista.image=foto1;
    [self.view addSubview:vista];

    foto2 = [UIImage imageNamed:@"Stringapp-2.jpg"];
    self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(415,300,299,480)];
    self.vista.image=foto2;
    [self.view addSubview:vista];*/
    
    pixel1 = [UIImage imageNamed:@"pixel1.png"];
    self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(160,790,87,87)];
    self.vista.image=pixel1;
    [self.view addSubview:vista];
    
    pixel2 = [UIImage imageNamed:@"pixel2.png"];
    self.vista=[[UIImageView alloc] initWithFrame:CGRectMake(525,790,87,87)];
    self.vista.image=pixel2;
    [self.view addSubview:vista];
    
}

-(IBAction)foto1{
    self.eleccionO=[[VCEleccion alloc] init];
    self.eleccionO.foto=@1;
    [self persistir];

}

-(IBAction)foto2{
    self.eleccionO=[[VCEleccion alloc] init];
    self.eleccionO.foto=@2;
    [self persistir];
}

-(void)persistir{
    NSDate * currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"HH"];
    NSString * currentHour = [dateFormatter stringFromDate: currentDate];
    self.eleccionO.hora = currentHour;
    
    [dateFormatter setDateFormat:@"mm"];
    NSString * currentMinute = [dateFormatter stringFromDate: currentDate];
    self.eleccionO.minuto = currentMinute;
    
//    NSLog(@"%@", currentHour);
//        NSLog(@"%@", self.eleccionO.minuto);
    
    
    VCAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
	NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Eleccion" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    context = [appDelegate managedObjectContext];
    NSManagedObject *eleccion = [NSEntityDescription insertNewObjectForEntityForName:@"Eleccion"
                                                              inManagedObjectContext:context];
    
    NSNumber * photo = self.eleccionO.foto;
    [eleccion setValue:photo forKey:@"foto"];
    [eleccion setValue:currentMinute forKey:@"minuto"];
    [eleccion setValue:currentHour forKey:@"hora"];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
/*
    NSArray *fetchedObjects = [context executeFetchRequest:request error:&error];
    for (NSManagedObject *eleccion in fetchedObjects) {
        NSLog(@"Foto: %@", [eleccion valueForKey:@"foto"]);
        NSLog(@"Hora: %@", [eleccion valueForKey:@"hora"]);
        NSLog(@"Minuto: %@", [eleccion valueForKey:@"minuto"]);
    }
*/
    [self siguientePantalla];

}

-(void)siguientePantalla{

    VCMapaViewController * controlador = [self.storyboard instantiateViewControllerWithIdentifier:@"mapaviewcontroller"];
    controlador.eleccionO = self.eleccionO;
    [self.navigationController pushViewController:controlador animated:YES];
}

-(void)mapa{
    VCMapaViewController * controlador = [self.storyboard instantiateViewControllerWithIdentifier:@"mapaviewcontroller"];
    [self.navigationController pushViewController:controlador animated:YES];
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

@end
