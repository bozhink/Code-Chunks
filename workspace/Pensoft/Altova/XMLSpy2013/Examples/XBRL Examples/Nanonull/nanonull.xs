<?xml version="1.0" encoding="US-ASCII"?>
<!-- edited with XMLSpy v2012 rel. 2 (http://www.altova.com) by Mr. Nobody (Altova GmbH) -->
<xs:schema targetNamespace="http://www.altova.com/nanonull" elementFormDefault="qualified" attributeFormDefault="unqualified" xmlns:us-gaap="http://fasb.org/us-gaap/2012-01-31" xmlns:n1="http://fasb.org/us-gaap/attributes" xmlns:us-roles="http://fasb.org/us-roles/2012-01-31" xmlns:us-types="http://fasb.org/us-types/2012-01-31" xmlns:nanonull="http://www.altova.com/nanonull" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xl="http://www.xbrl.org/2003/XLink" xmlns:xbrli="http://www.xbrl.org/2003/instance" xmlns:link="http://www.xbrl.org/2003/linkbase" xmlns:ref="http://www.xbrl.org/2006/ref" xmlns:nonnum="http://www.xbrl.org/dtr/type/non-numeric" xmlns:num="http://www.xbrl.org/dtr/type/numeric" xmlns:xbrldt="http://xbrl.org/2005/xbrldt" xmlns:dei="http://xbrl.sec.gov/dei/2012-01-31" xmlns:us-gaap-att="http://xbrl.us/us-gaap/attributes" xmlns:negated="http://xbrl.us/us-gaap/negated/2008-03-31" xmlns:n2="http://xbrl.us/us-types/2009-01-31">
	<xs:annotation>
		<xs:appinfo>
			<link:roleType id="FinancialStatements" roleURI="http://www.nanonull.com/taxonomy/role/FinancialStatements">
				<link:definition>Notes to Financial Statements</link:definition>
				<link:usedOn>link:calculationLink</link:usedOn>
				<link:usedOn>link:presentationLink</link:usedOn>
			</link:roleType>
			<link:roleType id="SegmentRevenueAndOperatingIncome" roleURI="http://www.nanonull.com/taxonomy/role/SegmentRevenueAndOperatingIncome">
				<link:definition>091 - Disclosure - Segment Revenue and Operating Income</link:definition>
				<link:usedOn>link:calculationLink</link:usedOn>
				<link:usedOn>link:definitionLink</link:usedOn>
				<link:usedOn>link:presentationLink</link:usedOn>
			</link:roleType>
			<link:roleType id="IMetrix_StatementOfIncomeAlternative" roleURI="http://www.nanonull.com/taxonomy/role/StatementOfIncomeAlternative">
				<link:definition>103 - Statement - Nanonull &amp; Consolidated Statements of Income</link:definition>
				<link:usedOn>link:calculationLink</link:usedOn>
				<link:usedOn>link:presentationLink</link:usedOn>
				<link:usedOn>link:definitionLink</link:usedOn>
			</link:roleType>
			<link:roleType id="IMetrix_StatementOfFinancialPositionClassified" roleURI="http://www.nanonull.com/taxonomy/role/StatementOfFinancialPositionClassified">
				<link:definition>104 - Statement - Nanonull &amp; Consolidated Balance Sheets</link:definition>
				<link:usedOn>link:calculationLink</link:usedOn>
				<link:usedOn>link:presentationLink</link:usedOn>
				<link:usedOn>link:definitionLink</link:usedOn>
			</link:roleType>
			<link:roleType id="IMetrix_StatementOfFinancialPositionClassifiedParen" roleURI="http://www.nanonull.com/taxonomy/role/StatementOfFinancialPositionClassifiedParenthetical">
				<link:definition>105 - Statement - Nanonull &amp; Consolidated Balance Sheets (Parenthetical)</link:definition>
				<link:usedOn>link:calculationLink</link:usedOn>
				<link:usedOn>link:presentationLink</link:usedOn>
				<link:usedOn>link:definitionLink</link:usedOn>
			</link:roleType>
			<link:roleType id="IMetrix_StatementOfCashFlowsIndirect" roleURI="http://www.nanonull.com/taxonomy/role/StatementOfCashFlowsIndirect">
				<link:definition>106 - Statement - Nanonull &amp; Consolidated Statements of Cash Flows</link:definition>
				<link:usedOn>link:calculationLink</link:usedOn>
				<link:usedOn>link:presentationLink</link:usedOn>
				<link:usedOn>link:definitionLink</link:usedOn>
			</link:roleType>
			<link:linkbaseRef xlink:type="simple" xlink:role="http://www.xbrl.org/2003/role/calculationLinkbaseRef" xlink:arcrole="http://www.w3.org/1999/xlink/properties/linkbase" xlink:href="nanonull_cal.xml" xlink:title="Calculation Links, all"/>
			<link:linkbaseRef xlink:type="simple" xlink:role="http://www.xbrl.org/2003/role/definitionLinkbaseRef" xlink:arcrole="http://www.w3.org/1999/xlink/properties/linkbase" xlink:href="nanonull_def.xml" xlink:title="Definition Links, all"/>
			<link:linkbaseRef xlink:type="simple" xlink:role="http://www.xbrl.org/2003/role/labelLinkbaseRef" xlink:arcrole="http://www.w3.org/1999/xlink/properties/linkbase" xlink:href="nanonull_lab.xml" xlink:title="Label Links, all"/>
			<link:linkbaseRef xlink:type="simple" xlink:role="http://www.xbrl.org/2003/role/presentationLinkbaseRef" xlink:arcrole="http://www.w3.org/1999/xlink/properties/linkbase" xlink:href="nanonull_pre.xml" xlink:title="Presentation Links, all"/>
		</xs:appinfo>
	</xs:annotation>
	<xs:import namespace="http://www.xbrl.org/2003/instance" schemaLocation="http://www.xbrl.org/2003/xbrl-instance-2003-12-31.xsd"/>
	<xs:import namespace="http://www.xbrl.org/2003/linkbase" schemaLocation="http://www.xbrl.org/2003/xbrl-linkbase-2003-12-31.xsd"/>
	<xs:import namespace="http://xbrl.org/2005/xbrldt" schemaLocation="http://www.xbrl.org/2005/xbrldt-2005.xsd"/>
	<xs:import namespace="http://fasb.org/us-types/2012-01-31" schemaLocation="http://xbrl.fasb.org/us-gaap/2012/elts/us-types-2012-01-31.xsd"/>
	<xs:import namespace="http://www.xbrl.org/dtr/type/numeric" schemaLocation="http://www.xbrl.org/dtr/type/numeric-2009-12-16.xsd"/>
	<xs:import namespace="http://www.xbrl.org/dtr/type/non-numeric" schemaLocation="http://www.xbrl.org/dtr/type/nonNumeric-2009-12-16.xsd"/>
	<xs:import namespace="http://fasb.org/us-gaap/2012-01-31" schemaLocation="http://xbrl.fasb.org/us-gaap/2012/elts/us-gaap-2012-01-31.xsd"/>
	<xs:import namespace="http://xbrl.sec.gov/dei/2012-01-31" schemaLocation="http://xbrl.sec.gov/dei/2012/dei-2012-01-31.xsd"/>
	<xs:element name="ContinenciesDisclosureTextBlock" id="id_element6" type="nonnum:textBlockItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="USA" id="id_element4" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="Europe" id="id_element2" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="Asia" id="id_element1" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="AccumulatedOtherComprehensiveIncomeLossNetInvestmentHedgeNetOfTax" id="nanonull_AccumulatedOtherComprehensiveIncomeLossNetInvestmentHedgeNetOfTax" type="xbrli:monetaryItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:balance="debit" xbrli:periodType="instant"/>
	<xs:element name="BasisOfPresentationLineItems" id="nanonull_BasisOfPresentationLineItems" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="BasisOfPresentationTable" id="nanonull_BasisOfPresentationTable" type="xbrli:stringItemType" substitutionGroup="xbrldt:hypercubeItem" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="ChangeInAccountingPrinciple" id="nanonull_ChangeInAccountingPrinciple" type="xbrli:monetaryItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:balance="credit" xbrli:periodType="duration"/>
	<xs:element name="ComprehensiveIncomeTableTextBlock" id="nanonull_ComprehensiveIncomeTableTextBlock" type="nonnum:textBlockItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="ContingenciesDisclosureTextBlock" id="nanonull_ContingenciesDisclosureTextBlock" type="nonnum:textBlockItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="ContingentObligations" id="nanonull_ContingentObligations" type="xbrli:monetaryItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:balance="credit" xbrli:periodType="instant"/>
	<xs:element name="CostAndFairValueOfFinancialInstrumentsDisclosureTextBlock" id="nanonull_CostAndFairValueOfFinancialInstrumentsDisclosureTextBlock" type="nonnum:textBlockItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="CostOfOnboardAndOther" id="nanonull_CostOfOnboardAndOther" type="xbrli:monetaryItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:balance="debit" xbrli:periodType="duration"/>
	<xs:element name="CruiseCommissionsTransportationAndOther" id="nanonull_CruiseCommissionsTransportationAndOther" type="xbrli:monetaryItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:balance="debit" xbrli:periodType="duration"/>
	<xs:element name="CruiseMember" id="nanonull_CruiseMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="DisclosureBasicAndDilutedEarningsPerShareComputationAbstract" id="nanonull_DisclosureBasicAndDilutedEarningsPerShareComputationAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="DisclosureBasisOfPresentationAdditionalInformationAbstract" id="nanonull_DisclosureBasisOfPresentationAdditionalInformationAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="DisclosureCarryingAmountOfGoodwillAbstract" id="nanonull_DisclosureCarryingAmountOfGoodwillAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="DisclosureComprehensiveIncomeLossAbstract" id="nanonull_DisclosureComprehensiveIncomeLossAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="DisclosureContingenciesAdditionalInformationAbstract" id="nanonull_DisclosureContingenciesAdditionalInformationAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="DisclosureDebtAdditionalInformationAbstract" id="nanonull_DisclosureDebtAdditionalInformationAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="DisclosureEstimatedCarryingAndFairValuesOfFinancialInstrumentAssetsAndLiabilitiesNotMeasuredAtFairValueOnARecurringBasisAbstract" id="nanonull_DisclosureEstimatedCarryingAndFairValuesOfFinancialInstrumentAssetsAndLiabilitiesNotMeasuredAtFairValueOnARecurringBasisAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="DisclosureEstimatedFairValueAndBasisOfValuationOfFinancialInstrumentAssetsAndLiabilitiesMeasuredAtFairValueOnARecurringBasisAbstract" id="nanonull_DisclosureEstimatedFairValueAndBasisOfValuationOfFinancialInstrumentAssetsAndLiabilitiesMeasuredAtFairValueOnARecurringBasisAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="DisclosureFairValueMeasurementsDerivativeInstrumentsAndHedgingActivitiesAdditionalInformationAbstract" id="nanonull_DisclosureFairValueMeasurementsDerivativeInstrumentsAndHedgingActivitiesAdditionalInformationAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="DisclosureSelectedInformationForCruiseAndTourAndOtherSegmentsAbstract" id="nanonull_DisclosureSelectedInformationForCruiseAndTourAndOtherSegmentsAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="DocumentDocumentandEntityInformationAbstract" id="nanonull_DocumentDocumentandEntityInformationAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="EarningsPerShareComputationTextBlock" id="nanonull_EarningsPerShareComputationTextBlock" type="nonnum:textBlockItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="EuroAndSterlingDebtAndOtherObligationsMember" id="nanonull_EuroAndSterlingDebtAndOtherObligationsMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="EuroDenominatedBankLoansMember" id="nanonull_EuroDenominatedBankLoansMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="EuropeAustraliaAndAsiaCruiseBrandsMember" id="nanonull_EuropeAustraliaAndAsiaCruiseBrandsMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="FairValueAssetsAndLiabilitiesMeasuredOnARecurringBasisAxis" id="nanonull_FairValueAssetsAndLiabilitiesMeasuredOnARecurringBasisAxis" type="xbrli:stringItemType" substitutionGroup="xbrldt:dimensionItem" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="FairValueAssetsAndLiabilitiesMeasuredOnARecurringBasisDomain" id="nanonull_FairValueAssetsAndLiabilitiesMeasuredOnARecurringBasisDomain" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="FairValueAssetsAndLiabilitiesMeasuredOnRecurringBasisDerivativeFinancialInstrumentsAssetsAndLiabilities" id="nanonull_FairValueAssetsAndLiabilitiesMeasuredOnRecurringBasisDerivativeFinancialInstrumentsAssetsAndLiabilities" type="xbrli:monetaryItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:balance="credit" xbrli:periodType="instant"/>
	<xs:element name="FairValueAssetsAndLiabilitiesMeasuredOnRecurringBasisLineItems" id="nanonull_FairValueAssetsAndLiabilitiesMeasuredOnRecurringBasisLineItems" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="FairValueAssetsAndLiabilitiesMeasuredOnRecurringBasisTable" id="nanonull_FairValueAssetsAndLiabilitiesMeasuredOnRecurringBasisTable" type="xbrli:stringItemType" substitutionGroup="xbrldt:hypercubeItem" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="FairValueAssetsAndLiabilitiesMeasuredOnRecurringBasisTextBlock" id="nanonull_FairValueAssetsAndLiabilitiesMeasuredOnRecurringBasisTextBlock" type="nonnum:textBlockItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="FairValueMeasurementInputsDisclosureLineItems" id="nanonull_FairValueMeasurementInputsDisclosureLineItems" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="FairValueMeasurementInputsDisclosureTable" id="nanonull_FairValueMeasurementInputsDisclosureTable" type="xbrli:stringItemType" substitutionGroup="xbrldt:hypercubeItem" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="FinancialInstrumentsMeasuredAtFairValueOnRecurringBasisMember" id="nanonull_FinancialInstrumentsMeasuredAtFairValueOnRecurringBasisMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="FinancialInstrumentsNotMeasuredAtFairValueOnRecurringBasisMember" id="nanonull_FinancialInstrumentsNotMeasuredAtFairValueOnRecurringBasisMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="FixedRateExportCreditFacilitiesMember" id="nanonull_FixedRateExportCreditFacilitiesMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="FixedRateMember" id="nanonull_FixedRateMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="FloatingRateMember" id="nanonull_FloatingRateMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="IberoCruiseMember" id="nanonull_IberoCruiseMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="LeaseOutAndLeaseBackTypeTransactionsMember" id="nanonull_LeaseOutAndLeaseBackTypeTransactionsMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="MarketableSecuritiesHeldInRabbiTrustsMember" id="nanonull_MarketableSecuritiesHeldInRabbiTrustsMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="MaturityOfInterestRateSwaps" id="nanonull_MaturityOfInterestRateSwaps" type="us-types:durationStringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="instant"/>
	<xs:element name="MaximumMember" id="nanonull_MaximumMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="MinimumMember" id="nanonull_MinimumMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="NorthAmericaCruiseBrandsMember" id="nanonull_NorthAmericaCruiseBrandsMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="NotesToFinancialStatementsAbstract" id="nanonull_NotesToFinancialStatementsAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="OnboardAndOther" id="nanonull_OnboardAndOther" type="xbrli:monetaryItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:balance="credit" xbrli:periodType="duration"/>
	<xs:element name="OrdinarySharesMember" id="nanonull_OrdinarySharesMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="OtherComprehensiveIncomeLossFromContinuingOperationsNetOfTaxPeriodIncreaseDecreaseAbstract" id="nanonull_OtherComprehensiveIncomeLossFromContinuingOperationsNetOfTaxPeriodIncreaseDecreaseAbstract" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="OtherComprehensiveIncomeOtherNetOfTax" id="nanonull_OtherComprehensiveIncomeOtherNetOfTax" type="xbrli:monetaryItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:balance="credit" xbrli:periodType="duration"/>
	<xs:element name="PercentageDifferenceBetweenFairValueAndCarryingValueOfAsset" id="nanonull_PercentageDifferenceBetweenFairValueAndCarryingValueOfAsset" type="num:percentItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="instant"/>
	<xs:element name="PercentageOfNewbuildPassengerCapacityUnderContractExposedToCurrencyRisk" id="nanonull_PercentageOfNewbuildPassengerCapacityUnderContractExposedToCurrencyRisk" type="num:percentItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="instant"/>
	<xs:element name="PercentageOfNewbuildPassengerCapacityUnderContractHedged" id="nanonull_PercentageOfNewbuildPassengerCapacityUnderContractHedged" type="num:percentItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="instant"/>
	<xs:element name="PercentageOfNewbuildPassengerCapacityUnderContractNotExposedToCurrencyRisk" id="nanonull_PercentageOfNewbuildPassengerCapacityUnderContractNotExposedToCurrencyRisk" type="num:percentItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="instant"/>
	<xs:element name="PercentageOfWeightedAverageCostOfCapitalAdjustedForRisk" id="nanonull_PercentageOfWeightedAverageCostOfCapitalAdjustedForRisk" type="num:percentItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="instant"/>
	<xs:element name="RangeAxis" id="nanonull_RangeAxis" type="xbrli:stringItemType" substitutionGroup="xbrldt:dimensionItem" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="RangeDomain" id="nanonull_RangeDomain" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="ScheduleOfEarningsPerShareBasicAndDilutedByCommonClassLineItems" id="nanonull_ScheduleOfEarningsPerShareBasicAndDilutedByCommonClassLineItems" type="xbrli:stringItemType" substitutionGroup="xbrli:item" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="ScheduleOfEarningsPerShareBasicAndDilutedByCommonClassTable" id="nanonull_ScheduleOfEarningsPerShareBasicAndDilutedByCommonClassTable" type="xbrli:stringItemType" substitutionGroup="xbrldt:hypercubeItem" nillable="true" abstract="true" xbrli:periodType="duration"/>
	<xs:element name="ShipForeignCurrencyOptionsMember" id="nanonull_ShipForeignCurrencyOptionsMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
	<xs:element name="TourAndOtherMember" id="nanonull_TourAndOtherMember" type="nonnum:domainItemType" substitutionGroup="xbrli:item" nillable="true" abstract="false" xbrli:periodType="duration"/>
</xs:schema>
