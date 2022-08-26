using {notifications.db as db} from '../db/data-model';


service CatalogService @(path : '/catalog')
@(requires: 'authenticated-user')
{
    entity Sales
      @(restrict: [{ grant: ['READ'],
                     to: 'CatenaXUser'
                   },
                   { grant: ['WRITE'],
                     to: 'CatenaXUser' 
                   }
                  ])
      as select * from db.Sales
      actions {
        @(restrict: [{ to: 'CatenaXUser' }])
        action boost() returns Sales;
      }
    ;

};