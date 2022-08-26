context notifications.db {

  entity Sales {
    key ID          : Integer;
        region      : String(100);
        country     : String(100);
        org         : String(4);
        amount      : Integer;
        comments    : String(100);
        criticality : Integer;
  };


  entity Notifications {
    key ID              : Integer;
        status          : String(50);
        classification  : String(50);
        severity        : String(50);
        targetDate      : Date;
        receiveDate     : Date;
        senderBP        : String(50);
        recieveBP       : String(50);
        affectedItems   : Association to many AffectedItems on affectedItems.notification = $self;

  };

  entity AffectedItems {
    key ID            : Integer;
        notification  : Association to Notifications;
        uuid          : String(100);
  }

}

@cds.persistence.exists
@cds.persistence.calcview
entity CV_SALES {
  key REGION  : String(100);
      AMOUNT  : Integer;
}

@cds.persistence.exists
@cds.persistence.calcview
entity CV_SESSION_INFO {
  key ITEM     : String(5000);
      VALUE    : String(5000);
}
