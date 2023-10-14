using TravelService as service from '../../srv/travel-service';
using from './annotations';

annotate TravelService.Travel with {

} actions {
    rejectTravel @(
        Core.OperationAvailable: {$edmJson: {$Ne: [
            {$Path: 'in/TravelStatus_code'},
            'X'
        ]}},
        Common                 : {
            SideEffects: 
            {
            $Type           : 'Common.SideEffectsType',
            TargetProperties: ['in/TravelStatus_code'],
            TargetEntities: ['/TravelService.EntityContainer/Travel']
        }
        }
    );
    acceptTravel @(
        Core.OperationAvailable: {$edmJson: {$Ne: [
        {$Path: 'in/TravelStatus_code'},
        'A'
    ]}},
        Common                 : {
            SideEffects: 
            {
            $Type           : 'Common.SideEffectsType',
            TargetProperties: ['in/TravelStatus_code'],
            TargetEntities: ['/TravelService.EntityContainer/Travel']
        }
        });
}
annotate service.Travel with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Travel}',
            ID : 'Travel',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Travel}',
                    ID : 'Travel1',
                    Target : '@UI.FieldGroup#Travel',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Prices}',
                    ID : 'i18nPrices',
                    Target : '@UI.FieldGroup#i18nPrices',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Dates}',
                    ID : 'i18nDates',
                    Target : '@UI.FieldGroup#i18nDates',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Sustainability}',
                    ID : 'i18nSustainability',
                    Target : '@UI.FieldGroup#i18nSustainability',
                },],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Itinerary}',
            ID : 'i18nItinerary',
            Target : 'to_Booking/@UI.LineItem#i18nItinerary',
        },
    ]
);
annotate service.Travel with @(
    UI.FieldGroup #Travel : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : TravelID,
                Label : '{i18n>Travelid}',
            },{
                $Type : 'UI.DataField',
                Value : to_Agency_AgencyID,
                Label : '{i18n>Agencyid}',
            },{
                $Type : 'UI.DataField',
                Value : to_Customer_CustomerID,
                Label : 'CustomerID',
            },{
                $Type : 'UI.DataField',
                Value : TravelStatus_code,
                Label : 'TravelStatus_code',
            },],
    }
);
annotate service.Travel with @(
    UI.FieldGroup #i18nPrices : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : BookingFee,
                Label : 'BookingFee',
            },{
                $Type : 'UI.DataField',
                Value : TotalPrice,
                Label : 'TotalPrice',
            },],
    }
);
annotate service.Travel with @(
    UI.FieldGroup #i18nDates : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : BeginDate,
                Label : 'BeginDate',
            },{
                $Type : 'UI.DataField',
                Value : EndDate,
                Label : 'EndDate',
            },],
    }
);
annotate service.Travel with @(
    UI.FieldGroup #i18nSustainability : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GoGreen,
                Label : 'GoGreen',
            },{
                $Type : 'UI.DataField',
                Value : GreenFee,
                Label : 'GreenFee',
            },
            {
                $Type : 'UI.DataField',
                Value : TreesPlanted,
                Label : 'TreesPlanted',
            },],
    }
);
annotate service.Booking with @(
    UI.LineItem #i18nItinerary : [
        {
            $Type : 'UI.DataField',
            Value : to_Carrier.AirlinePicURL,
            Label : 'AirlinePicURL',
        },
        {
            $Type : 'UI.DataField',
            Value : BookingID,
            Label : 'BookingID',
        },
        {
            $Type : 'UI.DataField',
            Value : to_Customer.CustomerID,
            Label : 'CustomerID',
        },
        {
            $Type : 'UI.DataField',
            Value : to_Carrier_AirlineID,
            Label : 'to_Carrier_AirlineID',
        },
        {
            $Type : 'UI.DataField',
            Value : FlightDate,
            Label : 'FlightDate',
        },
        {
            $Type : 'UI.DataField',
            Value : FlightPrice,
            Label : 'FlightPrice',
        },
        {
            $Type : 'UI.DataField',
            Value : BookingStatus_code,
            Label : 'BookingStatus_code',
        },]
);
