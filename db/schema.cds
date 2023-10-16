namespace FullStackTrial;

using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity Risk : managed
{
    key ID : UUID
        @Core.Computed;
    title : String(100);
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    miti : Association to one Mitigation;
    Supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;
}

entity Mitigation : managed
{
    key ID : UUID
        @Core.Computed;
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risk : Association to many Risk on risk.miti = $self;
}
