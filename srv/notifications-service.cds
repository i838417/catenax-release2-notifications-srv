using {notifications.db as db,
      notifications.db.Notifications as Notifications,
       notifications.db.AffectedItems as AffectedItems} from '../db/data-model';


service NotificationsService  @(path : '/notifications')
@(requires: 'authenticated-user'){

  entity Notifications
      @(restrict: [{ grant: ['READ'],
                     to: 'CatenaXUser'
                   },
                   { grant: ['WRITE'],
                     to: 'CatenaXUser' 
                   }
                  ])
      as Select * from db.Notifications;

  entity AffectedItems
      @(restrict: [{ grant: ['READ'],
                     to: 'CatenaXUser'
                   },
                   { grant: ['WRITE'],
                     to: 'CatenaXUser' 
                   }
                  ])
      as select * from db.AffectedItems;

}
                