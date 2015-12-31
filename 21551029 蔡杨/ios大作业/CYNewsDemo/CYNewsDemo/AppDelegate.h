//
//  AppDelegate.h
//  CYNewsDemo
//
//  Created by MAX-TECH on 15/12/16.
//  Copyright © 2015年 fuckcy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
     UINavigationController *mNavigationController;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain)  UINavigationController *navigationController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

