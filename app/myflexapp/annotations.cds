using TravelService as service from '../../srv/travel-service';
using from '../../db/schema';

annotate service.Travel with @(
    UI.SelectionFields : [
        to_Agency_AgencyID,
        to_Customer_CustomerID,
        TravelStatus.code,
    ]
);
annotate service.Travel with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : TravelID,
            Label : 'Travel Id'
        },
        {
            $Type : 'UI.DataField',
            Value : TravelStatus_code,
            Label : 'Travel Status',
            Criticality : TravelStatus.criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : BeginDate,
            Label : 'Begin Date'
        },
        {
            $Type : 'UI.DataField',
            Value : EndDate,
            Label : 'End Date'
        },
        {
            $Type : 'UI.DataField',
            Value : to_Agency_AgencyID,
            Label : '{i18n>AgencyID}'
        },
        {
            $Type : 'UI.DataField',
            Value : to_Customer_CustomerID,
            Label : 'Customer Id'
        },
        {
            $Type : 'UI.DataField',
            Value : TotalPrice,
            Label : 'Total price'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'TravelService.acceptTravel',
            Label : '{i18n>AcceptTravel}'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'TravelService.rejectTravel',
            Label : '{i18n>RejectTravel}'
        }
    ]
);
annotate service.Travel with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>Travel}',
        TypeNamePlural : '{i18n>Travels}Travels',
        Description : {
            $Type : 'UI.DataField',
            Value : Description,
        },
        Title : {
            $Type : 'UI.DataField',
            Value : TravelID,
        },
    }
);
annotate service.Travel with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General',
            ID : 'General',
            Target : '@UI.FieldGroup#General',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Flights',
            ID : 'Flights',
            Target : 'to_BookedFlights/@UI.PresentationVariant#Flights',
        },
    ],
    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : TravelStatus_code,
                Label : 'TravelStatus_code',
            },{
                $Type : 'UI.DataField',
                Value : TotalPrice,
                Label : 'TotalPrice',
            },{
                $Type : 'UI.DataField',
                Value : CurrencyCode.descr,
            },{
                $Type : 'UI.DataField',
                Value : to_Agency.AgencyID,
                Label : 'AgencyID',
            },],
    }
);
annotate service.BookedFlights with @(
    UI.LineItem #Flights : [
        {
            $Type : 'UI.DataField',
            Value : AirlineID,
            Label : 'AirlineID',
        },{
            $Type : 'UI.DataField',
            Value : LastName,
            Label : 'LastName',
        },{
            $Type : 'UI.DataField',
            Value : Name,
            Label : 'Name',
        },
        {
            $Type : 'UI.DataField',
            Value : to_Travel.to_Customer_CustomerID,
            Label : 'to_Customer_CustomerID',
        },]
);
annotate service.BookedFlights with @(
    UI.PresentationVariant #Flights : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.LineItem#Flights',
        ],
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : AirlineID,
                Descending : false,
            },
        ],
    }
);
annotate service.Travel with @(
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'TravelService.acceptTravel',
            Label : '{i18n>AcceptTravel}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'TravelService.rejectTravel',
            Label : '{i18n>RejectTravel}',
        },
    ]
);
