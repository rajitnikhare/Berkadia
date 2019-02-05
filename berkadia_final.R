#----------------------------------------------------------------------------------------------------------------


#Project Name: Berkadia Rent Estimator 
#version: 1.1
#contributors: Rajit Nikhare, Naveen, Akansha Toppo, SAISRIVATHSALA Ragireddy, Vineel Talupula


#-----------------------------------------------------------------------------------------------------------------



#get the two data frames
setwd("C:/Users/rnikhare/Downloads/")
df1 <- read.csv("GOLD_PROPERTY_02_21_18.csv",na.strings = c("NA","NULL"))
df2 <- read.csv("GOLD_RENTS_02_21_18.csv",na.strings = c("NA","NULL"))

#Change the column name
colnames(df1)[colnames(df1) == 'ï..PropertyGoldenID'] <- 'PropertyGoldenID'
colnames(df2)[colnames(df2) == 'ï..PropertyGoldenID'] <- 'PropertyGoldenID'

#Merge the two data frames into one by the common column "PropertyGoldenID"
df <- merge(df1, df2, by="PropertyGoldenID")
df_copy<-df
#df<-df_copy

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
#sampling the data
sample1 <- df[sample(1:971802, 10000,replace=FALSE),]
sample2 <- df[sample(1:971802, 10000,replace=FALSE),]
sample3 <- df[sample(1:971802, 10000,replace=FALSE),]

#running lm model to check p-values for the significant variables.
lm1<-lm(EffectiveRentUnitAmount~., sample1)
summary(lm1)

#select the significant variables in the data frame
df <- subset(df, select = c(PropertyGoldenID,
                            Longitude,
                            OnMarket,
                            NumberUnits.x,
                            NumberUnits.y,
                            AverageSqFtPerUnit,
                            NumberAcres,
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
                            AffordableHousingInd,
                            MajorStreetInd,
                            DevelopmentStatus,
                            CBSACode,
                            SquareFeet,
                            MarketRentUnitAmount,
                            UnitType)) #removed COnstructionType  #metering?
summary(df$UnitType)
str(df)

#separate the categorical values:

df_cat<-df[,c(17,18,26)]
df_num <- df[,-c(1,17,18,26,30)]

names(df)        
str(df_num)
summary(df_cat)

#subset according to the unit type.   
           
df_num<- filter(df_num, UnitType %in% c("1 Bedroom/0 Bath",
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
                           "Studio"))


df_num<-df_num[,-26]

#missForest
library(missForest)
imp_df_cat<-missForest(df_cat)
imp_df <- mice(df, m=1, maxit = 1, method = 'polyreg', seed = 500)

str(imp_df_cat$ximp)

imp_df_num<-missForest(df_num)

str(df_num)
str(df)

sum(is.na(df)) # 7% data is still NA (220/3086)

imp1<-subset(df_num, UnitType == "1 Bedroom/0 Bath")
imp2<-subset(df_num, UnitType == "1 Bedroom/1 Bath")
imp3<-subset(df_num, UnitType == "1 Bedroom/2 Bath")
imp4<-subset(df_num, UnitType == "1 Bedroom/3 Bath")
imp5<-subset(df_num, UnitType == "2 Bedroom/0 Bath")
imp6<-subset(df_num, UnitType == "2 Bedroom/1 Bath")
imp7<-subset(df_num, UnitType == "2 Bedroom/2 Bath")
imp8<-subset(df_num, UnitType == "2 Bedroom/3 Bath")
imp9<-subset(df_num, UnitType == "2 Bedroom/4 Bath")
imp10<-subset(df_num, UnitType == "3 Bedroom/2 Bath")
imp11<-subset(df_num, UnitType == "3 Bedroom/3 Bath")
imp12<-subset(df_num, UnitType == "3 Bedroom/4 Bath")
imp13<-subset(df_num, UnitType == "4 Bedroom/1 Bath")
imp14<-subset(df_num, UnitType == "4 Bedroom/2 Bath")
imp15<-subset(df_num, UnitType == "4 Bedroom/3 Bath")
imp16<-subset(df_num, UnitType == "4 Bedroom/4 Bath")
imp17<-subset(df_num, UnitType == "4 Bedroom/5 Bath")
imp18<-subset(df_num, UnitType == "5 Bedroom/2 Bath")
imp19<-subset(df_num, UnitType == "5 Bedroom/3 Bath")
imp20<-subset(df_num, UnitType == "5 Bedroom/4 Bath")
imp21<-subset(df_num, UnitType == "5 Bedroom/5 Bath")
imp22<-subset(df_num, UnitType == "5 Bedroom/6 Bath")
imp23<-subset(df_num, UnitType == "6 Bedroom/6 Bath")
imp24<-subset(df_num, UnitType == "Studio")

str(imp1)

completedData1<- complete(imp1,1)



#impute values according to the unit type
# imp1 <- mice(imp1, m=1, maxit = 1,  method = c("logreg","pmm","pmm","pmm","pmm","pmm","pmm","logreg","pmm","pmm","pmm","pmm","pmm","pmm","pmm","pmm","pmm","logreg","logreg","pmm","pmm","pmm","pmm","pmm","logreg","pmm","pmm","logreg","pmm","pmm","pmm",""), seed = 500)
imp1_num <- mice(imp1, m=1, maxit = 1, method = 'pmm', seed = 500)
imp2_num <- mice(imp2, m=1, maxit = 1, method = 'mean', seed = 500)
imp3_num <- mice(imp3, m=1, maxit = 1, method = 'pmm', seed = 500)
imp4_num <- mice(imp4, m=1, maxit = 1, method = 'pmm', seed = 500)
imp5_num <- mice(imp5, m=1, maxit = 1, method = 'pmm', seed = 500)
imp6_num <- mice(imp6, m=1, maxit = 1, method = 'pmm', seed = 500)
imp7_num <- mice(imp7, m=1, maxit = 1, method = 'pmm', seed = 500)
imp8_num <- mice(imp8, m=1, maxit = 1, method = 'pmm', seed = 500)
imp9_num <- mice(imp9, m=1, maxit = 1, method = 'pmm', seed = 500)
imp10_num<- mice(imp10, m=1, maxit = 1, method = 'pmm', seed = 500)
imp11_num<- mice(imp11, m=1, maxit = 1, method = 'pmm', seed = 500)
imp12<- mice(imp12, m=1, maxit = 1, method = 'pmm', seed = 500)
imp13<- mice(imp13, m=1, maxit = 1, method = 'pmm', seed = 500)
imp14<- mice(imp14, m=1, maxit = 1, method = 'pmm', seed = 500)
imp15<- mice(imp15, m=1, maxit = 1, method = 'pmm', seed = 500)
imp16<- mice(imp16, m=1, maxit = 1, method = 'pmm', seed = 500)
imp17<- mice(imp17, m=1, maxit = 1, method = 'pmm', seed = 500)
imp18<- mice(imp18, m=1, maxit = 1, method = 'pmm', seed = 500)
imp19<- mice(imp19, m=1, maxit = 1, method = 'pmm', seed = 500)
imp20<- mice(imp20, m=1, maxit = 1, method = 'pmm', seed = 500)
imp21<- mice(imp21, m=1, maxit = 1, method = 'pmm', seed = 500)
imp22<- mice(imp22, m=1, maxit = 1, method = 'pmm', seed = 500)
imp23<- mice(imp23, m=1, maxit = 1, method = 'pmm', seed = 500)
imp24<- mice(imp24, m=1, maxit = 1, method = 'pmm', seed = 500)


#write the imputed files to a csv for regression modelling

rbind
write.csv(final_property_data_set, file = "final_property.csv")












#convert the values to integers for correlation calculations
for(i in 1:31) {
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



