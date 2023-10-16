using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using { FullStackTrial as my } from '../db/schema';

@path : '/service/FullStackTrial'
service FullStackTrialService
{
    annotate Mitigation with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ ' RiskManager' ] }
    ];

    annotate Risk with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ ' RiskManager' ] }
    ];

    @odata.draft.enabled
    entity Risk as
        projection on my.Risk;

    @odata.draft.enabled
    entity Mitigation as
        projection on my.Mitigation;

    entity A_BusinessPartner as
        projection on BusinessPartnerA2X.A_BusinessPartner;
}

annotate FullStackTrialService with @requires :
[
    'authenticated-user',
    'RiskViewer',
    ' RiskManager'
];
