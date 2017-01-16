//
//  VCAppDelegate.h
//  String
//
//  Created by Verónica Cordobés on 08/09/14.
//  Copyright (c) 2014 Verónica Cordobés. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
