#----------------------------------------


#Project Name: Berkadia Rent Estimator 
#version: 1.1
#contributors: Rajit Nikhare, Naveen, Akansha Toppo, SAISRIVATHSALA Ragireddy, Vineel Talupula


#----------------------------------------

#sampling the data
sample1 <- df[sample(1:971802, 10000,replace=FALSE),]
sample2 <- df[sample(1:971802, 10000,replace=FALSE),]
sample3 <- df[sample(1:971802, 10000,replace=FALSE),]

lm1<-lm(EffectiveRentUnitAmount~., sample1)
summary(lm1)








#get the two data frames
setwd("C:\Users\rnikhare\Downloads\")
df1 <- read.csv("GOLD_PROPERTY_02_21_18.csv",na.strings = c("NA","NULL"))
df2 <- read.csv("GOLD_RENTS_02_21_18.csv",na.strings = c("NA","NULL"))

#Change the column name
colnames(df1)[colnames(df1) == 'ï..PropertyGoldenID'] <- 'PropertyGoldenID'
colnames(df2)[colnames(df2) == 'ï..PropertyGoldenID'] <- 'PropertyGoldenID'

#Merge the two data frames into one by the common column "PropertyGoldenID"
df <- merge(df1, df2, by="PropertyGoldenID")

#Delete the column with more than 70% NA values                   
df <- subset(df, select = -c(MostRecentSaleDate,
                                          MostRecentSalePrice,
                                          OriginationDate,
                                          Lender,
                                          PricePerUnit,
                                          OwnerSFContactID,
                                          MaturityDate,
                                          PricePerSqFt,
                                          NetRentableSquareFeet,
                                          OwnerContactEmail,
                                          Originator,
                                          LargestTenantName,
                                          InterestRate,
                                          AmortizationTerm,
                                          CurrentUPB,
                                          MarketStandardAdjRentUnitAmount,
                                          CBSADivisionCode,
                                          CBSADivisionName,
                                          SecondLargestTenantName,
                                          PrepaymentPenaltyMonths,
                                          PriorPropertyName,
                                          UniversityName,
                                          DistanceToCampus,
                                          NumberTotalBeds,
                                          BedsPerAcre,
                                          ThirdLargestTenantName,
                                          PrepaymentNotes,
                                          MostRecentSaleCapRate,
                                          NOIAsOfDate,
                                          AnnualNOIAmount,
                                          YearLastRenovated,
                                          LockoutMonths,
                                          ParkingRatio,
                                          InterestOnlyTerm,
                                          MasterServicer,
                                          BeginLeaseDate,
                                          YieldMaintenanceMonths,
                                          ParkingNotes,
                                          ConstructionNotes,
                                          AlternateAddress,
                                          Developer,
                                          FirstMoveInDate,
                                          PropertyWebsite,
                                          Architect,
                                          GeneralContractor,
                                          GrossRentMultiplier,
                                          RentComments,
                                          MixedUseNotes,
                                          BerkadiaCRMName,
                                          BerkadiaCRMEmail,
                                          TotalCost,
                                          PriorUse,
                                          MarketRentUnitHighAmount,
                                          MarketRentUnitLowAmount,
                                          ListDetails,
                                          RetailSqFt,
                                          BuildableSquareFeet,
                                          PreleaseOccAsOfDate,
                                          PreleaseOccPct,
                                          LargestTenantLeaseExpDate,
                                          SecondLargestTenantLeaseExpDate,
                                          ThirdLargestTenantLeaseExpDate,
                                          Zoning,
                                          LargestTenantPctNRSF,
                                          LandCost,
                                          LandCostPerUnit,
                                          LandCostPerAcre,
                                          SecondLargestTenantPctNRSF,
                                          ThirdLargestTenantPctNRSF,
                                          NumberBeds,
                                          MarketRentBedAmount,
                                          LandCostPerBed,
                                          Chain,
                                          MeetingRoomSqFt,
                                          PropertyAddress2,
                                          DatePermitted,
                                          FloodZoneType,
                                          ActiveListingInd,
                                          ActiveListingBrokerName,
                                          ActiveListingBrokerPhone,
                                          NumberSuites,
                                          NumberSites,
                                          NumberSitesRV,
                                          NumberLicensedBeds,
                                          NumberOperatingBeds,
                                          AverageSqFtPerGuestroom,
                                          AverageSqFtPerSite,
                                          AverageRentPerBedAmt,
                                          AverageRentPerSiteAmt,
                                          AverageDailyRate,
                                          AverageDailyRateAsOfDate,
                                          RevenuePerAvailableRoom,
                                          RevenuePerAvailableRoomAsOfDate,
                                          OccupancySTRIndex,
                                          ADRSTRIndex,
                                          RevPARSTRIndex,
                                          PropertyLocationType,
                                          CampusType,
                                          ProfitStatus,
                                          OfficeSqFt,
                                          PercentOffice,
                                          PercentIndustrial,
                                          Franchise,
                                          Section8Vouchers,
                                          Section8HAPContract,
                                          HAPContractExpirationDate,
                                          RegulatoryAgreementLURA,
                                          LIHTC,
                                          AffordableHousingNotes,
                                          HandicapParkingSpaces,
                                          ParkingPremium,
                                          HVAC,
                                          MeetingRoomsInd,
                                          MeetingRoomDetails,
                                          RestaurantInd,
                                          RestaurantName,
                                          PercentSitesSingle,
                                          PercentSitesMulti,
                                          SitesAccommodate,
                                          UnitsInPlace,
                                          OpeningNotes,
                                          ClosureDate,
                                          ClosureNotes,
                                          ProjectNotes,
                                          OwnershipInterest,
                                          UtilitiesBillingWater,
                                          UtilitiesBillingElectric,
                                          UtilitiesBillingGas,
                                          UtilitiesBillingTrash,
                                          RVBoatStorageInd,
                                          SkirtedInd,
                                          RecRoomInd,
                                          WindowAirConditioningInd,
                                          PricePerBed,
                                          PricePerRoom,
                                          PricePerSite,
                                          EquityPartnerContactName,
                                          EquityPartnerContactPhone,
                                          EquityPartnerContactEmail,
                                          GeneralManagerName,
                                          GeneralManagerEmail,
                                          GeneralManagerPhone,
                                          OperatorName,
                                          EncumberedByManagement,
                                          EncumberedByBrand,
                                          ProposedNumberUnits,
                                          ProposedNumberBeds,
                                          LandSaleDate,
                                          EffectiveRentBedAmount,
                                          RentType,
                                          NumberRooms,
                                          Parcel,
                                          PropertyAddress1,
                                          PropertyPhone,
                                          Market,
                                          PropertyType,
                                          Parcel,
                                          CurOccupancyAsOf,
                                          RentAsOfDate,
                                          CoveredParkingSpaces,
                                          Plumbing,
                                          Wiring,
                                          AmenitiesNotes,
                                          OwnerGoldenID,
                                          OwnerCompanyName,
                                          OwnerCompanyAddress,
                                          OwnerCompanyCity,
                                          OwnerCompanyState,
                                          OwnerCompanyZipCode,
                                          OwnerCompanyWebsite,
                                          OwnerContactName,
                                          OwnerContactPhone,
                                          EquityPartnerName,
                                          ManagementCompName,
                                          ManagementCompAddress,
                                          ManagementContactName,
                                          ManagementContactPhone,
                                          ManagementCompWebsite,
                                          RateType,
                                          WatchlistInd,
                                          DateCompleted,
                                          LEEDCertification,
                                          CreatedUserID.x,
                                          CreatedDate.x,
                                          LastUpdatedUserID.x,
                                          LastUpdatedDate.x,
                                          PropertyStateName,
                                          MSAName,
                                          CBSAName,
                                          OwnerSFAccountID,
                                          SurveyDate,
                                          UnitDescription,
                                          NumberPartialBath,
                                          NumberDens,
                                          CreatedUserID.y,
                                          CreatedDate.y,
                                          LastUpdatedUserID.y,
                                          LastUpdatedDate.y,
                                          Salesforce_RentID,
                                          ExcludeFromSyncInd,
                                          LoanLienPosition,
                                          PropertyZipCode))

#Delete the columns which are not logical and have more than 50% NA values
df <- subset(df, select = -c(OriginalLoanAmount,
                                          ConcessionAmount,
                                          NumberPropertiesOnLoan,
                                          LoanCount,
                                          WiFiInd,
                                          StoveInd,
                                          ExtraStorageInd,
                                          SpaInd,
                                          RefrigeratorInd,
                                          PlayroomInd,
                                          MicrowaveInd,
                                          MediaRoomInd,
                                          JacuzziInd,
                                          HardwoodFloorsInd,
                                          DoormanInd,
                                          DisposalInd,
                                          DishwasherInd,
                                          CourtyardInd,
                                          CeilingFansInd,
                                          CableInd,
                                          BarbequeInd,
                                          AdditionalCareInd,
                                          EarthquakeZoneInd))

#select the significant variables in the data frame
df <- subset(df, select = c(PropertyGoldenID,
                            Longitude,
                            OnMarket,
                            NumberUnits.x,
                            NumberUnits.y,
                            AverageSqFtPerUnit,
                            NumberAcres,
                            Metering,
                            MilitaryInd,
                            AgeRestrictedInd,
                            CentralAirConditioningInd,
                            GolfCourseInd,
                            LakeInd,
                            ParkingGarageDirectAccessInd,
                            ParkingGarageFreeStandingInd,
                            TennisSportsCourtInd,
                            UnitsPerAcre,
                            Region,
                            DataSource,
                            SquareFeet,
                            TotalSqFtUnitType,
                            PrimaryInd,
                            NumberFloors,
                            CurOccupancyPct,
                            ConstructionType,
                            AffordableHousingInd,
                            MajorStreetInd,
                            DevelopmentStatus,
                            CBSACode,
                            SquareFeet,
                            MarketRentUnitAmount,
                            UnitType))
summary(df$UnitType)

#imputations:

df1<- subset[df$UnitType %in% c("1 Bedroom/0 Bath",
                           "1 Bedroom/1 Bath",
                           "1 Bedroom/2 Bath",
                           "1 Bedroom/3 Bath",
                           "2 Bedroom/0 Bath",
                           "2 Bedroom/1 Bath",
                           "2 Bedroom/2 Bath",
                           "2 Bedroom/3 Bath",
                           "2 Bedroom/4 Bath",
                           "3 Bedroom/2 Bath",
                           "3 Bedroom/3 Bath",
                           "3 Bedroom/4 Bath",
                           "4 Bedroom/1 Bath",
                           "4 Bedroom/2 Bath",
                           "4 Bedroom/3 Bath",
                           "4 Bedroom/4 Bath",
                           "4 Bedroom/5 Bath",
                           "5 Bedroom/2 Bath",
                           "5 Bedroom/3 Bath",
                           "5 Bedroom/4 Bath",
                           "5 Bedroom/5 Bath",
                           "5 Bedroom/6 Bath",
                           "6 Bedroom/6 Bath",
                           "Studio"),]


summary(df$UnitType)


#sample of the data frame to test linear regression models:






#convert the values to integers for correlation calculations
for(i in 1:74) {
  df[, i] <- as.numeric(df[, i])
}



#correlation matrix calculation

#install.packages("Hmisc")
library(Hmisc)
correlations<-rcorr(as.matrix(df))



for (i in 70){
  for (j in 1:74){
    if ( !is.na(correlations$P[i,j])){
      if (  correlations$P[i,j] < (0) || correlations$P[i,j] > (0.10) ) {
        print(paste(rownames(correlations$P)[i], "-" , colnames(correlations$P)[j], ": ", correlations$P[i,j]))
      }
    }
  }
}




# 
# 
# #converting to right type
# df$PropertyName <- as.character(df$PropertyName)
# df$UnitType<- as.character(df$UnitType)
# 
# 
# df$PropertyGoldenID<- factor(df$PropertyGoldenID)
# df$OnMarket<- factor(df$OnMarket)
# df$NumberFloors<- factor(df$NumberFloors)
# df$NumberBuildings<- factor(df$NumberBuildings)
# df$YearBuilt<- factor(df$YearBuilt)
# df$AffordableHousingInd<- factor(df$AffordableHousingInd)
# df$LoanCount<- factor(df$LoanCount)
# df$BerkadiaServiced<- factor(df$BerkadiaServiced)
# 
# df$LoanLienPosition<- factor(df$LoanLienPosition)
# df$DevelopmentStatus<- factor(df$DevelopmentStatus)
# df$Region<- factor(df$Region)
# df$ExcludeFromSyncInd<- factor(df$ExcludeFromSyncInd)
# df$DataSource<- factor(df$DataSource)
# df$UnitType<- factor(df$UnitType)
# df$PrimaryInd<- factor(df$PrimaryInd)
# df$NumberBedrooms<- factor(df$NumberBedrooms)
# df$NumberBathrooms<- factor(df$NumberBathrooms)
# 
# 
# #df$NumberBedrooms<- as.numeric(df$NumberBedrooms)
# #df$UnitType<- as.numeric(df$UnitType)
# 
# 
# 
# 
# library(dplyr)
# df <- df %>% subset(df$NumberAcres>0)
# #df <- df %>% subset(df$NumberBedrooms>0)
# 
# df$DevelopmentStatus[df$DevelopmentStatus == 'Complete'] <- "Completed"
# 
# 
# 
# 
# samp <- subset(df, UnitType=='1 Bedroom/1 Bath')
# 
# 
# y<-try[,94]
# x<-try[,-94]
# 
# try<-try[,-1]
# try$PropertyGoldenID<- as.character(try$PropertyGoldenID)
# #missForest
# library(missForest)
# try<-missForest(try)
# samp1<-try$ximp
# 
# summary(samp)
# 
# str(try)
# summary(try)
# 
# 
# for(i in 2:98) {
#   try[, i] <- as.numeric(try[, i])
# }
# 
# 
# lm<-lm(EffectiveRentUnitAmount~.,data=try)
# 
# summary(try$PropertyCity)
# 
# library(glmnet)
# glmmod <- glmnet(x, y, alpha=1, family="binomial")
# 
# library(mice)
# imputed_Data <- mice(try, m=5, maxit = 50, method = 'pmm', seed = 500)
# summary(imputed_Data)
# 
# library(missForest)
# 
# try<-missForest(try)  
# try2<-try$ximp
# summary(try2)
# 
# pairs(df[1:10])
# 
# #lm = lm(EffectiveRentUnitAmount ~ ., data=df)
# 
# library(Hmisc)
# correlations <- rcorr(as.matrix(df))
