#-----------------------------------------------------------------------------------------------------------------


#Project Name: Berkadia Rent Estimator 
#version: 3.1


#-----------------------------------------------------------------------------------------------------------------



#get the two data frames
setwd("PATH")
df1 <- read.csv("GOLD_PROPERTY_02_21_18.csv", na.strings = c("NA","NULL","","NaN"))
df2 <- read.csv("GOLD_RENTS_02_21_18.csv", na.strings = c("NA","NULL","","NaN"))


#Change the column name
colnames(df1)[colnames(df1) == 'ï..PropertyGoldenID'] <- 'PropertyGoldenID'
colnames(df2)[colnames(df2) == 'ï..PropertyGoldenID'] <- 'PropertyGoldenID'

#Merge the two data frames into one by the common column "PropertyGoldenID"
df <- merge(df1, df2, by="PropertyGoldenID")
write.csv(df, file="Berkadia_data.csv")
df<-read.csv("Berkadia_data.csv")
df_copy<-df

#split into train and test
library(dplyr)
set.seed(123)
train<-sample_frac(df, 0.7)
sid<-as.numeric(rownames(train)) # because rownames() returns character
test<-df[-sid,]
#test<-na.omit(test)
str(test)
write.csv(test,file="test_dataset.csv")
test<-na.omit(test)
test<-read.csv("test_dataset.csv")
y_test<-test[,28]
write.csv(y_test,file="y_test.csv")
x_test<-test[,-28]
write.csv(x_test,file="x_test.csv")

summary(x_test)

# missing data visualization
library(ggplot2)
gg_miss_fct(x = train, fct = UnitType) + labs(title="Missing values in the data set") + scale_color_gradientn(colours = rainbow(5))



#Delete the column with more than 70% NA values                   
train <- subset(train, select = -c(MostRecentSaleDate,
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
train <- subset(train, select = -c(OriginalLoanAmount,
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
lm1<-lm(log(EffectiveRentUnitAmount)~., train)
summary(lm1)

#select the significant variables in the data frame
train <- subset(train, select = c(Longitude,
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
                            UnitType,
                            EffectiveRentUnitAmount)) #removed COnstructionType  #metering?

#correlation matrix calculation

#install.packages("Hmisc")
library(Hmisc)
correlations<-rcorr(as.matrix(ggtest))



for (i in 70){
  for (j in 1:74){
    if ( !is.na(correlations$P[i,j])){
      if (  correlations$P[i,j] < (0) || correlations$P[i,j] > (0.10) ) {
        print(paste(rownames(correlations$P)[i], "-" , colnames(correlations$P)[j], ": ", correlations$P[i,j]))
      }
    }
  }
}


#convert to correct type of variables
train$PropertyGoldenID<- factor(train$PropertyGoldenID)
train$OnMarket<- factor(train$OnMarket)
train$NumberBuildings<- factor(train$NumberBuildings)
train$YearBuilt<- factor(train$YearBuilt)
train$AffordableHousingInd<- factor(train$AffordableHousingInd)
train$LoanCount<- factor(train$LoanCount)
train$BerkadiaServiced<- factor(train$BerkadiaServiced)
train$LoanLienPosition<- factor(train$LoanLienPosition)
train$DevelopmentStatus<- factor(train$DevelopmentStatus)
train$Region<- factor(train$Region)
train$ExcludeFromSyncInd<- factor(train$ExcludeFromSyncInd)
train$DataSource<- factor(train$DataSource)
train$UnitType<- factor(train$UnitType)
train$PrimaryInd<- factor(train$PrimaryInd)
train$NumberBedrooms<- factor(train$NumberBedrooms)
train$NumberBathrooms<- factor(train$NumberBathrooms)
train$MilitaryInd<-factor(train$MilitaryInd)
train$AgeRestrictedInd<-factor(train$AgeRestrictedInd) 
train$CentralAirConditioningInd<-factor(train$CentralAirConditioningInd)
train$GolfCourseInd<-factor(train$GolfCourseInd)
train$LakeInd<-factor(train$LakeInd)
train$ParkingGarageDirectAccessInd<-factor(train$ParkingGarageDirectAccessInd)
train$ParkingGarageFreeStandingInd<-factor(train$ParkingGarageFreeStandingInd)
train$TennisSportsCourtInd<-factor(train$TennisSportsCourtInd)
train$MajorStreetInd<-factor(train$MajorStreetInd)



#join complete and Completed
train$DevelopmentStatus[train$DevelopmentStatus == 'Complete'] <- "Completed"

#Impute NULL values in the effectiveRentUnitAmount variable
train$EffectiveRentUnitAmount<-imputeTS::na.mean(train$EffectiveRentUnitAmount, option = "mean") 

#remove outliers
train <- subset(train, !(train$EffectiveRentUnitAmount == 23002200))
train <- subset(train, (train$NumberAcres > 1))
train <- subset(train, (train$UnitsPerAcre > 1))
train <- subset(train, (train$SquareFeet > 1))
train <- subset(train, !(train$EffectiveRentUnitAmount == 889550))
train <- subset(train, !(train$EffectiveRentUnitAmount == 840890))
train <- subset(train, !(train$EffectiveRentUnitAmount == 750795))
train <- subset(train, !(train$EffectiveRentUnitAmount == 503900))


#subset according to the unit type.   

df<- subset(df, UnitType %in% c("1 Bedroom/0 Bath",
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


#separate data on UnitType and then impute for better results:
Df1b0b<- train %>% subset(train$UnitType == "1 Bedroom/0 Bath")
Df1b1b<- train %>% subset(train$UnitType == "1 Bedroom/1 Bath")
Df1b2b<- train %>% subset(train$UnitType == "1 Bedroom/2 Bath")
Df1b3b<- train %>% subset(train$UnitType == "1 Bedroom/3 Bath")
Df2b0b<- train %>% subset(train$UnitType == "2 Bedroom/0 Bath")
Df2b1b<- train %>% subset(train$UnitType == "2 Bedroom/1 Bath")
Df2b2b<- train %>% subset(train$UnitType == "2 Bedroom/2 Bath")
Df2b3b<- train %>% subset(train$UnitType == "2 Bedroom/3 Bath")
Df2b4b<- train %>% subset(train$UnitType == "2 Bedroom/4 Bath")
Df3b2b<- train %>% subset(train$UnitType == "3 Bedroom/2 Bath")
Df3b3b <- train %>% subset(train$UnitType == "3 Bedroom/3 Bath")
Df3b4b <- train %>% subset(train$UnitType == "3 Bedroom/4 Bath")
Df4b1b <- train %>% subset(train$UnitType == "4 Bedroom/1 Bath")
Df4b2b <- train %>% subset(train$UnitType == "4 Bedroom/2 Bath")
Df4b3b <- train %>% subset(train$UnitType == "4 Bedroom/3 Bath")
Df4b4b <- train %>% subset(train$UnitType == "4 Bedroom/4 Bath")
Df4b5b <- train %>% subset(train$UnitType == "4 Bedroom/5 Bath")
Df5b2b <- train %>% subset(train$UnitType == "5 Bedroom/2 Bath")
Df5b3b <- train %>% subset(train$UnitType == "5 Bedroom/3 Bath")
Df5b4b <- train %>% subset(train$UnitType =="5 Bedroom/4 Bath")
Df5b5b<- train %>% subset(train$UnitType == "5 Bedroom/5 Bath")
Df5b6b <- train %>% subset(train$UnitType == "5 Bedroom/6 Bath")
Df6b6b <- train %>% subset(train$UnitType == "6 Bedroom/6 Bath")
DfStd<- train %>% subset(train$UnitType == "Studio")


ggtest<-read.csv("test_dataset.csv")

#boxplot 
boxplot((log(EffectiveRentUnitAmount))~(Region),data=ggtest, main="Distribution of Rent according to Region", ylab="Rent", xlab="Region")
boxplot((log(EffectiveRentUnitAmount))~(DevelopmentStatus),data=ggtest, main="Distribution of Rent according to Development Status", ylab="Rent",las=3)
axis(1, 1:9, paste(c("Prosp","Constr"), 1:9), las=1)
boxplot((log(EffectiveRentUnitAmount))~(MajorStreetInd),data=ggtest, main="Distribution of Rent according to property type", ylab="Rent", xlab="Property Type")
boxplot((log(EffectiveRentUnitAmount))~(AffordableHousingInd),data=ggtest, main="Distribution of Rent according to property type", ylab="Rent", xlab="Property Type")
boxplot((log(EffectiveRentUnitAmount))~(TotalSqFtUnitType),data=ggtest, main="Distribution of Rent according to property type", ylab="Rent", xlab="Property Type")



#pairs
library(psych)
pairs(ggtest[,c(27,28)], smooth = TRUE, scale = TRUE, density=TRUE,ellipses=TRUE,
      digits = 2,method="pearson", pch = 20, lm=TRUE,cor=TRUE,jiggle=FALSE,factor=2,
      hist.col="cyan",show.points=FALSE,rug=TRUE, breaks = "Sturges",cex.cor=0.1,wt=NULL,
      smoother=FALSE,stars=FALSE,ci=FALSE,alpha=.05)








# Dataset distributed according to the Unit type
dflist<-c("Df1b0b",
          "Df1b1b",
          "Df1b2b",
          "Df1b3b",
          "Df2b0b",
          "Df2b1b",
          "Df2b2b",
          "Df2b3b",
          "Df2b4b",
          "Df3b2b",
          "Df3b3b",
          "Df3b4b",
          "Df4b1b", 
          "Df4b2b", 
          "Df4b3b", 
          "Df4b4b",
          "Df4b5b",
          "Df5b2b", 
          "Df5b3b", 
          "Df5b4b", 
          "Df5b5b",
          "Df5b6b", 
          "Df6b6b", 
          "DfStd")


#impute missing in EffectiveRentUnitAmount
train$EffectiveRentUnitAmount<-imputeTS::na.mean(train$EffectiveRentUnitAmount, option = "mean")   
summary(train)



#imputation:
library(imputeTS)
library(mice)
for(i in dflist){
  #Impute mean for longitude 
  t<-get(i)[['Longitude']]
  t<-imputeTS::na.mean(t,  option = "mean")
  eval(parse(text=sprintf('%s$%s <- t',i,'Longitude')))
  t<-NA

  #impute using logreg for OnMarket values
  t<-eval(parse(text=sprintf('%s[,c(2,28)]',i)))
  imp<-mice(t, m = 1, method ="pmm", where = is.na(t),maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'OnMarket','imp1','OnMarket')))
  t<-NA
  
  #impute mean for NumberUnits.x
  t<-get(i)[['NumberUnits.x']]
  t<-imputeTS::na.mean(t, option = "mean")
  eval(parse(text=sprintf('%s$%s <- t',i,'NumberUnits.x')))
  t<-NA
  
  #impute mean for NumberUnits.y
  t<-get(i)[['NumberUnits.y']]
  t<-imputeTS::na.mean(t, option = "mean")
  eval(parse(text=sprintf('%s$%s <- t',i,'NumberUnits.y')))
  t<-NA
  
  
  #impute mean for AverageSqFtPerUnit
  t<-get(i)[['AverageSqFtPerUnit']]
  t<-imputeTS::na.mean(t, option = "mean")
  eval(parse(text=sprintf('%s$%s <- t',i,'AverageSqFtPerUnit')))
  t<-NA
  
  #impute mean for NumberAcres
  t<-get(i)[['NumberAcres']]
  t<-imputeTS::na.mean(t, option = "mean")
  eval(parse(text=sprintf('%s$%s <- t',i,'NumberAcres')))
  t<-NA
  ########################
  # impute logreg using mice on MilitaryInd
  t<-eval(parse(text=sprintf('%s[,c(7,28)]',i)))
  imp<-mice(t, m = 1, method ="logreg", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'MilitaryInd','imp1','MilitaryInd')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  
  #logreg for AgeRestrictedInd
  t<-eval(parse(text=sprintf('%s[,c(8,28)]',i)))
  imp<-mice(t, m = 1, method ="logreg", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'AgeRestrictedInd','imp1','AgeRestrictedInd')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  #logreg for CentralAirConditioningInd
  t<-eval(parse(text=sprintf('%s[,c(9,28)]',i)))
  imp<-mice(t, m = 1, method ="logreg", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'CentralAirConditioningInd','imp1','CentralAirConditioningInd')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  #logreg for GolfCourseInd
  t<-eval(parse(text=sprintf('%s[,c(10,28)]',i)))
  imp<-mice(t, m = 1, method ="logreg", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'GolfCourseInd','imp1','GolfCourseInd')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  names(train)
  
  #logreg for LakeInd
  t<-eval(parse(text=sprintf('%s[,c(11,28)]',i)))
  imp<-mice(t, m = 1, method ="logreg", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'LakeInd','imp1','LakeInd')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  #logreg for ParkingGarageDirectAccessInd
  t<-eval(parse(text=sprintf('%s[,c(12,28)]',i)))
  imp<-mice(t, m = 1, method ="logreg", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'ParkingGarageDirectAccessInd','imp1','ParkingGarageDirectAccessInd')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  #logregfor ParkingGarageFreeStandingInd
  t<-eval(parse(text=sprintf('%s[,c(13,28)]',i)))
  imp<-mice(t, m = 1, method ="logreg", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'ParkingGarageFreeStandingInd','imp1','ParkingGarageFreeStandingInd')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  #logreg for TennisSportsCourtInd
  t<-eval(parse(text=sprintf('%s[,c(14,28)]',i)))
  imp<-mice(t, m = 1, method ="logreg", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'TennisSportsCourtInd','imp1','TennisSportsCourtInd')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  #impute mean for UnitsPerAcre
  t<-get(i)[['UnitsPerAcre']]
  t<-imputeTS::na.mean(t, option = "mean")
  eval(parse(text=sprintf('%s$%s <- t',i,'UnitsPerAcre')))
  t<-NA
  
  
  #impute Predictive mean matching for Region
  t<-eval(parse(text=sprintf('%s[,c(16,28)]',i)))
  imp<-mice(t, m = 1, method ="rf", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'Region','imp1','Region')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  #impute mean for SquareFeet
  t<-get(i)[['SquareFeet']]
  t<-imputeTS::na.mean(t, option = "mean")
  eval(parse(text=sprintf('%s$%s <- t',i,'SquareFeet')))
  t<-NA
  
  
  #impute mean for TotalSqFtUnitType
  t<-get(i)[['TotalSqFtUnitType']]
  t<-imputeTS::na.mean(t, option = "mean")
  eval(parse(text=sprintf('%s$%s <- t',i,'TotalSqFtUnitType')))
  t<-NA
  
  
  
  
  #impute norm for CurOccupancyPct  #could also use mean/median, result is skewed
  t<-get(i)[['CurOccupancyPct']]
  t<-imputeTS::na.mean(t, option = "mean")
  eval(parse(text=sprintf('%s$%s <- t',i,'CurOccupancyPct')))
  t<-NA
  
  
  #impute using logreg for AffordableHousingInd
  t<-eval(parse(text=sprintf('%s[,c(23,28)]',i)))
  imp<-mice(t, m = 1, method ="pmm", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'AffordableHousingInd','imp1','AffordableHousingInd')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  # impute using Predictive mean matching for MajorStreetInd
  t<-eval(parse(text=sprintf('%s[,c(24,28)]',i)))
  imp<-mice(t, m = 1, method ="pmm", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'MajorStreetInd','imp1','MajorStreetInd')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  # impute using Predictive mean matching for DevelopmentStatus
  t<-eval(parse(text=sprintf('%s[,c(25,28)]',i)))
  imp<-mice(t, m = 1, method ="pmm", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'DevelopmentStatus','imp1','DevelopmentStatus')))
  t<-NA
  imp<-NA
  imp1<-NA
  
  #impute mean for CBSACode
  t<-get(i)[['CBSACode']]
  t<-imputeTS::na.mean(t, option = "mean")
  eval(parse(text=sprintf('%s$%s <- t',i,'CBSACode')))
  t<-NA
  
  names(train)
  # impute using Predictive mean matching for NumberFloors
  t<-eval(parse(text=sprintf('%s[,c(21,28)]',i)))
  imp<-mice(t, m = 1, method ="pmm", where = is.na(t), maxit = 1,printFlag = TRUE, seed = 123)
  imp1<-mice::complete(imp)
  eval(parse(text=sprintf('%s$%s <- %s$%s',i,'NumberFloors','imp1','NumberFloors')))
  t<-NA
  imp<-NA
  # imp1<-NA
}


#join all the data frames
Imputed_df <- rbind(Df1b0b,
                    Df1b1b,
                    Df1b2b,
                    Df1b3b,
                    Df2b0b,
                    Df2b1b,
                    Df2b2b,
                    Df2b3b,
                    Df2b4b,
                    Df3b2b,
                    Df3b3b,
                    Df3b4b,
                    Df4b1b, 
                    Df4b2b, 
                    Df4b3b, 
                    Df4b4b,
                    Df4b5b,
                    Df5b2b, 
                    Df5b3b, 
                    Df5b4b, 
                    Df5b5b,
                    Df5b6b, 
                    Df6b6b, 
                    DfStd)


summary(Imputed_df)


# gg<-mice(Imputed_df[,c(2,28)], m = 1, method ="logreg", where = is.na(Imputed_df[,c(2,28)]),defaultMethod = "logreg", maxit = 1,printFlag = TRUE, seed = 123)
# gg_comp<-complete(gg)
# ggtest<-na.omit(Imputed_df)



summary(ggtest)

write.csv(ggtest,file = "impute1.csv")
ggtest<-read.csv("impute1.csv")





####################################################################################################################################
#REGRESSION MODEL#
####################################################################################################################################

library(caret)
library(randomForest)
library(doParallel)
library(ggplot2)
library(knitr)
library(rminer)
library(matrixStats)
library(RWeka)

cores <- 2
cl <- makePSOCKcluster(cores)
registerDoParallel(cl)

dati <- data.frame(ggtest)
summary(ggtest)

metrics_list <- c("MAE","RMSE","MAPE","RMSPE","RAE","RRSE","R2")

# 3 times cross validation.
my_control <- trainControl(method = "cv", number = 3 )

my_forest <- train(log(EffectiveRentUnitAmount)~., 
                   data = ggtest,
                   method = "parRF",
                   ntree = 3,
                   trControl=my_control)
plot(my_forest)
varImpPlot(my_forest)
str(my_forest)
x_test$X = seq.int(nrow(x_test))
summary(result)
result<-result[,-1]
#write.csv(my_forest,file="my_forest.csv")
result<-predict(my_forest,x_test)
write.csv(result,file="result.csv")
result<-read.csv("result.csv")
str(x_test)


write.csv(result,file="result.csv")
save(my_forest,file="my_forest.RData")

mmetric(log(y_test),result,metrics_list)



merged <- cbind(result, y_test)
str(merged)
merged<-as.data.frame.matrix(merged) 

ggplot(merged,aes(exp(result),y_test), color='blue') + geom_point() + ylim(0,25000) + xlim(0,25000)

write.csv(merged,file="merged.csv")




####################################################################################################################################
#SHINY APP
####################################################################################################################################


library(shiny)
library(randomForest)
library(datasets)
str(ggtest)

ui <- fluidPage(  titlePanel("Berkadia - Rent Estimator"),
                  #numericInput("X","X",value=2,min=1,max=5000),
                  numericInput("ZipCode","ZipCode",value=84102,min=00501,max=99950),
                  # numericInput("CBSACode","CBSACode",value=29632,min=10100,max=49780),
                  numericInput("CurOccupancyPct","CurOccupancyPct",value=50,min=1,max=100),
                  # numericInput("NumberFloors","NumberFloors",value=4,min=1,max=87),
                  # numericInput("TotalSqFtUnitType","TotalSqFtUnitType",value=20160,min=100,max=61210188),
                  # numericInput("SquareFeet","SquareFeet",value=920,min=36,max=10201698),
                  # numericInput("UnitsPerAcre","UnitsPerAcre",value=43,min=1,max=160534.62),
                  # numericInput("NumberAcres","NumberAcres",value=43,min=1,max=750),
                  # numericInput("NumberAcres","NumberAcres",value=43,min=1,max=750),
                  # numericInput("NumberUnits.y","NumberUnits.y",value=7,min=1,max=2016),
                  # numericInput("NumberUnits.x","NumberUnits.x",value=7,min=5,max=250434.0),
                  # numericInput("Longitude","Longitude",value=-121.48066,min= -158,max=-69),
                  # radioButtons("ParkingGarageFreeStandingInd","ParkingGarageFreeStandingInd",list("Not Available" = 0,"Available" = 1),"0"),
                  # radioButtons("TennisSportsCourtInd","TennisSportsCourtInd",list("Not Available" = 0,"Available" = 1),"0"),
                  # radioButtons("ParkingGarageDirectAccessInd","Parking",list("Not Available" = 0,"Available" = 1),"0"),
                  # radioButtons("MajorStreetInd","MajorStreetInd",list("Not Available" = 0,"Available" = 1),"0"),
                  # radioButtons("AffordableHousingInd","AffordableHousingInd",list("Not Available" = 0,"Available" = 1),"0"),
                  # radioButtons("PrimaryInd","PrimaryInd",list("Not Available" = 0,"Available" = 1),"0"),
                  # radioButtons("LakeInd","LakeInd",list("Not Available" = 0,"Available" = 1),"0"),
                  # radioButtons("GolfCourseInd","GolfCourseInd",list("Not Available" = 0,"Available" = 1),"0"),
                  # radioButtons("CentralAirConditioningInd","CentralAirConditioningInd",list("Not Available" = 0,"Available" = 1),"0"),
                  # radioButtons("AgeRestrictedInd","AgeRestrictedInd",list("Not Available" = 0,"Available" = 1),"0"),
                  # radioButtons("MilitaryInd","MilitaryInd",list("Not Available" = 0,"Available" = 1),"0"),
                  radioButtons("OnMarket","OnMarket",list("Not Available" = 0,"Available" = 1),"1"),
                  sliderInput("AverageSqFtPerUnit", "Average Sq Feet Unit Area", value = 794.6667, min = 17.36, max = 9505.00,animate=T),
                  # selectInput(input = "DataSource", label = "Data Source", choices = as.factor(c("Axio",
                  #                                                                                "BCM",
                  #                                                                                "BCM-Eco",
                  #                                                                                "Yardi"))),
                  # selectInput(input = "Region", label = "Region", choices = as.factor(c("Mid-Atlantic",
                  #                                                                       "Midwest",
                  #                                                                       "Northeast",
                  #                                                                       "Southeast",
                  #                                                                       "Southwest",
                  #                                                                       "West"))),
                  selectInput(input = "UnitType", label = "Unit Type", choices = as.factor(c("1 Bedroom/0 Bath",
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
                                                                                             "Studio"))),
                  selectInput(input = "DevelopmentStatus", label = "Development Status", choices = as.factor(c("Bidding",
                                                                                                               "Completed",
                                                                                                               "On Hold",
                                                                                                               "Permitting",
                                                                                                               "Planned",
                                                                                                               "Planning",
                                                                                                               "Post Bid",
                                                                                                               "Prospective",
                                                                                                               "Under Construction"
                  ))),
                  
                  actionButton("guess","Predict!",align = "left"),
                  
                  #32
                  
                  
                  mainPanel(
                    tabsetPanel(
                      tabPanel("Plot", plotOutput("guess"))))
                  
                  
                  
                  
)


RF <- get(load("my_forest.RData"))



pred <- function(UnitType) 
{
  
  inputdata <- c(UnitType,X)
  
  pred_data <- as.data.frame(t(inputdata))
  
  colnames(pred_data) <- c("UnitType","X")
  
  prob_out <- predict(RF, pred_data)
  prob_out <- exp(prob_out)
  return(prob_out)
  
  
}



server <- function(input, output) {
  output$guess <- renderPlot({
    ggplot(merged,aes(exp(result),y_test), color="blue") + geom_point() + ylim(0,25000) + xlim(0,25000) + ggtitle("Actual VS Predicted graph") + labs(x="Predicted", y="Actual")
  })
}  



shinyApp(ui, server)










