# To-Do-List
Core Data, Realm, Codable and User Defaults - Persistent Local Data Storage

<a href="https://media.giphy.com/media/26FeVRtAGMMgbNAlO/giphy"><img src ="https://media.giphy.com/media/26FeVRtAGMMgbNAlO/giphy.gif"/></a>

## Overview

This app was done in effort to explain the differences and limitations of various ways to persist local data storage.

### Some of the ways model layer objects were managed in this project:

#### UserDefaults

  I found that UserDefaults offers a trivial learning curve and thread safe implementation. The read/write of UserDefaults really forces the app to read/write everything or nothing, all at once, so it isn't efficient. If you're storing custom data types, or sensitive data then UserDefaults really isn't ideal.
  
#### Codable

  ##### Advantages
  
  It provides support for class, struct and enums.
  Encodable and Decodable each contain just a single method that are easy to implement.
  
  ##### Disadvantages
  As of Swift 4 you cannot conform to Codable in an extension. However it might be available in further releases.
  You must also use a concrete type to encode and decode.
  
#### Core Data

  ##### Advantages
  
  * Much better memory management. With Core Data only the objects you're currently using need to be loaded. Once objects are loaded, they're normally placeholder "fault" objects whose property data do not load until needed.
  * When you have changes, you can save only the changed objects, not the entire data set.
  * You can read/write your model objects directly instead of converting them to/from something like an NSDictionary.
  * Built-in sorting of objects when you fetch them from the data store.
  * Rich system of predicates for searching your data set for objects of interest.
  * Relationships between entities are handled directly, as properties on the related objects.
  * Optional automatic validation of property values.
  
  ##### Disadvantages
  
  * As per the Apple documentation:
  
  > Core Data makes no guarantees regarding the security of persistent stores from untrusted sources (as opposed to stores generated internally) and cannot detect whether files have been maliciously modified.
  
  *  Another disadvantage is the threading model of Core Data. The framework expects to be run on a single thread. Though I expect in future working with Core Data in a multithreat enviroment will be easier to implement.
  * Core Data can only do its magic because it keeps the object graph it manages in memory. This means that it can only operate on records once they're in memory. This is very different from performing a SQL query on a database. If you want to delete thousands of records, Core Data first needs to load each record into memory. It goes without saying that this results in memory and performance issues if done incorrectly.
  
#### Realm

  ##### Advantages
  
  * Realm is incredibly easy to use. Realm objects can be instantiated and used standalone just like regular objects. No need to use NSManagedObjects, NSPersistentStoreCoordinators etc.
  * The query speed is unmatched by any other mobile data storage solution:
  
  ![alt text](https://camo.qiitausercontent.com/e71232908df1f48d88a08bf5b2d18bbb9f5307e7/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f353336352f34363966643034652d633563392d306531322d346434322d6631306232613139383234622e706e67 "queries per second")
  
### Conclusion

Core Data setup is a more lengthy process than Realm with almost double the work. Even after all of the Core Data improvements in recent years, Realm is simpler to setup and the code for Realm is easier to read.
Granted, it doesn’t solve all of the problems that come with CoreData, but it does solve enough of them to make the move worth the while. Although it can feel unsettling to leave behind a battle-tested Apple supported product like Core Data, Realm is the rare exception to the rule. It is definitely my prefered method of implementing object persistence.
  
  
