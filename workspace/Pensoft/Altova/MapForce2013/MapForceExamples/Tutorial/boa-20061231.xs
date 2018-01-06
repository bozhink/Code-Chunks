<?xml version="1.0" encoding="UTF-8"?>
<!-- (c) 2008 XBRL US Inc. All Rights Reserved. http://xbrl.us/ 
     This document may be copied and furnished to others, and derivative works that 
     comment on or otherwise explain it or assist in its implementation may be 
     prepared, copied, published and distributed, in whole or in part, without 
     restriction of any kind, provided that the above copyright notice and this
     paragraph are included on all such copies and derivative works.  XBRL is a
     registered trademark of AICPA licensed exclusively to XBRL International. -->
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            xmlns:boa="http://xbrl.boa.com/2006-12-31"
            xmlns:link="http://www.xbrl.org/2003/linkbase"
            xmlns:ref="http://www.xbrl.org/2006/ref"
            xmlns:us-types="http://xbrl.us/us-types/2008-03-31"
            xmlns:us-gaap-std="http://xbrl.us/us-gaap-std/2008-03-31"
            xmlns:xbrldt="http://xbrl.org/2005/xbrldt"
            xmlns:us-roles="http://xbrl.us/us-roles/2008-03-31"
            xmlns:xl="http://www.xbrl.org/2003/XLink"
            xmlns:xbrli="http://www.xbrl.org/2003/instance"
            xmlns:us-gaap="http://xbrl.us/us-gaap/2008-03-31"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            targetNamespace="http://xbrl.boa.com/2006-12-31"
            attributeFormDefault="unqualified"
            elementFormDefault="qualified">
  <xsd:annotation>
      <xsd:appinfo>
         <link:linkbaseRef xlink:type="simple" xlink:href="boa-20061231_pre.xml"
                           xlink:role="http://www.xbrl.org/2003/role/presentationLinkbaseRef"
                           xlink:arcrole="http://www.w3.org/1999/xlink/properties/linkbase"/>
         <link:linkbaseRef xlink:type="simple" xlink:href="boa-20061231_cal.xml"
                           xlink:role="http://www.xbrl.org/2003/role/calculationLinkbaseRef"
                           xlink:arcrole="http://www.w3.org/1999/xlink/properties/linkbase"/>
         <link:linkbaseRef xlink:type="simple" xlink:href="boa-20061231_def.xml"
                           xlink:role="http://www.xbrl.org/2003/role/definitionLinkbaseRef"
                           xlink:arcrole="http://www.w3.org/1999/xlink/properties/linkbase"/>
         <link:linkbaseRef xlink:type="simple" xlink:href="boa-20061231_lab.xml"
                           xlink:role="http://www.xbrl.org/2003/role/labelLinkbaseRef"
                           xlink:arcrole="http://www.w3.org/1999/xlink/properties/linkbase"/>
         <link:roleType roleURI="http://xbrl.boa.com/2006-12-31/ext/BalanceSheet" id="BalanceSheet">
            <link:definition>000020 - Statement - Balance Sheet</link:definition>
            <link:usedOn>link:presentationLink</link:usedOn>
            <link:usedOn>link:calculationLink</link:usedOn>
            <link:usedOn>link:definitionLink</link:usedOn>
         </link:roleType>
         <link:roleType roleURI="http://xbrl.boa.com/2006-12-31/ext/CashFlow" id="CashFlows">
            <link:definition>000040 - Statement - Cash Flows</link:definition>
            <link:usedOn>link:presentationLink</link:usedOn>
            <link:usedOn>link:calculationLink</link:usedOn>
            <link:usedOn>link:definitionLink</link:usedOn>
         </link:roleType>
         <link:roleType roleURI="http://xbrl.boa.com/2006-12-31/ext/IncomeStatement"
                        id="IncomeStatement">
            <link:definition>000010 - Statement - Income Statement </link:definition>
            <link:usedOn>link:presentationLink</link:usedOn>
            <link:usedOn>link:calculationLink</link:usedOn>
            <link:usedOn>link:definitionLink</link:usedOn>
         </link:roleType>
         <link:roleType roleURI="http://xbrl.boa.com/2006-12-31/ext/StockholdersEquity"
                        id="ChangesInStockholdersEquity">
            <link:definition>000030 - Statement - Stockholder's Equity</link:definition>
            <link:usedOn>link:presentationLink</link:usedOn>
            <link:usedOn>link:calculationLink</link:usedOn>
            <link:usedOn>link:definitionLink</link:usedOn>
         </link:roleType>
      </xsd:appinfo>
  </xsd:annotation>
  <xsd:import namespace="http://www.xbrl.org/2003/instance"
               schemaLocation="http://www.xbrl.org/2003/xbrl-instance-2003-12-31.xsd"/>
  <xsd:import namespace="http://xbrl.us/us-types/2008-03-31"
               schemaLocation="http://xbrl.us/us-gaap/1.0/elts/us-types-2008-03-31.xsd"/>
  <xsd:import namespace="http://xbrl.us/us-gaap-std/2008-03-31"
               schemaLocation="http://xbrl.us/us-gaap/1.0/elts/us-gaap-std-2008-03-31.xsd"/>
  <xsd:element name="AccruedExpensesAndOtherLiabilitiesincludes397And395OfReserveForUnfundedLendingCommitments"
                id="boa_AccruedExpensesAndOtherLiabilitiesincludes397And395OfReserveForUnfundedLendingCommitments"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="instant"/>
  <xsd:element name="Accruedexpensesandotherliabilitiesofreserveforunfundedlendingcommitments"
                id="boa_Accruedexpensesandotherliabilitiesofreserveforunfundedlendingcommitments"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:periodType="instant"/>
  <xsd:element name="AvailableforsaleSecuritiesDebtSecuritiesCollateral"
                id="boa_AvailableforsaleSecuritiesDebtSecuritiesCollateral"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:periodType="instant"/>
  <xsd:element name="CashDividendPaidAbstract" id="boa_CashDividendPaidAbstract"
                type="xbrli:stringItemType"
                substitutionGroup="xbrli:item"
                abstract="true"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="CommercialDomestic" id="boa_CommercialDomestic"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:periodType="instant"/>
  <xsd:element name="CommonStockIssuedUnderEmployeePlansAndRelatedTaxBenefits"
                id="boa_CommonStockIssuedUnderEmployeePlansAndRelatedTaxBenefits"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="CommonStockIssuedUnderEmployeePlansAndRelatedTaxBenefitsTSE"
                id="boa_CommonStockIssuedUnderEmployeePlansAndRelatedTaxBenefitsTSE"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="CommonStockIssuedunderEmployeeplansandrelatedtaxbenefits"
                id="boa_CommonStockIssuedunderEmployeeplansandrelatedtaxbenefits"
                type="xbrli:sharesItemType"
                substitutionGroup="xbrli:item"
                abstract="false"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="CommonStockRepurchasedRetainedEarnings"
                id="boa_CommonStockRepurchasedRetainedEarnings"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="CommonStockRepurchasedStockholdersEquity"
                id="boa_CommonStockRepurchasedStockholdersEquity"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="ComprehensiveIncomeAbstract" id="boa_ComprehensiveIncomeAbstract"
                type="xbrli:stringItemType"
                substitutionGroup="xbrli:item"
                abstract="true"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="DebtSecuritiesAbstract" id="boa_DebtSecuritiesAbstract"
                type="xbrli:stringItemType"
                substitutionGroup="xbrli:item"
                abstract="true"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="DepositsInDomesticOfficesAbstract"
                id="boa_DepositsInDomesticOfficesAbstract"
                type="xbrli:stringItemType"
                substitutionGroup="xbrli:item"
                abstract="true"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="DepositsInForeignOfficesAbstract"
                id="boa_DepositsInForeignOfficesAbstract"
                type="xbrli:stringItemType"
                substitutionGroup="xbrli:item"
                abstract="true"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="Directindirectconsumer" id="boa_Directindirectconsumer"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="instant"/>
  <xsd:element name="EquityInvestmentGains" id="boa_EquityInvestmentGains"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="FleetBostonbalanceApril12004" id="boa_FleetBostonbalanceApril12004"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:periodType="instant"/>
  <xsd:element name="HeldtomaturitySecuritiesTotalCollateral"
                id="boa_HeldtomaturitySecuritiesTotalCollateral"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:periodType="instant"/>
  <xsd:element name="InvestmentAndBrokerageServices" id="boa_InvestmentAndBrokerageServices"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="InvestmentinChinaConstructionBank"
                id="boa_InvestmentinChinaConstructionBank"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="MBNAAllowanceforloansandleases" id="boa_MBNAAllowanceforloansandleases"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="instant"/>
  <xsd:element name="StatementAbstract" id="boa_StatementAbstract" type="xbrli:stringItemType"
                substitutionGroup="xbrli:item"
                abstract="true"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="OtherBalance" id="boa_OtherBalance" type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="instant"/>
  <xsd:element name="OtherChangesInShareholdersEquity"
                id="boa_OtherChangesInShareholdersEquity"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="duration"/>
  <xsd:element name="OtherCommonStock" id="boa_OtherCommonStock" type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="duration"/>
  <xsd:element name="OtherCommonStockIssuedUnderEmployeePlansAndRelatedTaxBenefits"
                id="boa_OtherCommonStockIssuedUnderEmployeePlansAndRelatedTaxBenefits"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="duration"/>
  <xsd:element name="OtherComprehensiveIncomeLossNetofTax"
                id="boa_OtherComprehensiveIncomeLossNetofTax"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="duration"/>
  <xsd:element name="ParentheticalDisclosuresAbstract"
                id="boa_ParentheticalDisclosuresAbstract"
                type="xbrli:stringItemType"
                substitutionGroup="xbrli:item"
                abstract="true"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="OtherOther" id="boa_OtherOther" type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="duration"/>
  <xsd:element name="OtherProvisionforunfundedlendingcommitments"
                id="boa_OtherProvisionforunfundedlendingcommitments"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="instant"/>
  <xsd:element name="OtherRetainedEarnings" id="boa_OtherRetainedEarnings"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="OtherStockholdersEquityAbstract" id="boa_OtherStockholdersEquityAbstract"
                type="xbrli:stringItemType"
                substitutionGroup="xbrli:item"
                abstract="true"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="PerCommonShareInformationAbstract"
                id="boa_PerCommonShareInformationAbstract"
                type="xbrli:stringItemType"
                substitutionGroup="xbrli:item"
                abstract="true"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="Provisionforunfundedlendingcommitments"
                id="boa_Provisionforunfundedlendingcommitments"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="instant"/>
  <xsd:element name="ReserveForUnfundedLendingCommitments"
                id="boa_ReserveForUnfundedLendingCommitments"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="instant"/>
  <xsd:element name="Reserveforunfundedlendingcommitmentsbeginningbalance"
                id="boa_Reserveforunfundedlendingcommitmentsbeginningbalance"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="instant"/>
  <xsd:element name="StockIssuedinAcquisitionPreferredStock"
                id="boa_StockIssuedinAcquisitionPreferredStock"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="StockIssuedInAcquisitionStockholdersEquity"
                id="boa_StockIssuedInAcquisitionStockholdersEquity"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="StockissuedinAcquisition" id="boa_StockissuedinAcquisition"
                type="xbrli:sharesItemType"
                substitutionGroup="xbrli:item"
                abstract="false"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="StockissuedinAcquisitionStockholdersEquity"
                id="boa_StockissuedinAcquisitionStockholdersEquity"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="Telecommunications" id="boa_Telecommunications"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="duration"/>
  <xsd:element name="TimeDepositsPlacedAndOtherShorttermInvestments"
                id="boa_TimeDepositsPlacedAndOtherShorttermInvestments"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="instant"/>
  <xsd:element name="TotalDebtSecurities" id="boa_TotalDebtSecurities"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="instant"/>
  <xsd:element name="CashDividendsPaidCommonStock" id="boa_CashDividendsPaidCommonStock"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                abstract="false"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="duration"/>
  <xsd:element name="CashDividendsPaidPreferredStock" id="boa_CashDividendsPaidPreferredStock"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                abstract="false"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="duration"/>
  <xsd:element name="CommonStockIssuedUnderEmployeePlansAndRelatedTaxBenefitsValue"
                id="boa_CommonStockIssuedUnderEmployeePlansAndRelatedTaxBenefitsValue"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                abstract="false"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="OtherMember" id="boa_OtherMember" type="us-types:domainItemType"
                substitutionGroup="xbrli:item"
                abstract="false"
                nillable="true"
                xbrli:periodType="duration"/>
  <xsd:element name="CommonStockSharesOutstanding" id="boa_CommonStockSharesOutstanding"
                type="xbrli:sharesItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:periodType="instant"/>
  <xsd:element name="FairValueOptionAndMeasurement" id="boa_FairValueOptionAndMeasurement"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                abstract="false"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="LeveragedLeases" id="boa_LeveragedLeases" type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                abstract="false"
                nillable="true"
                xbrli:balance="credit"
                xbrli:periodType="duration"/>
  <xsd:element name="MortgageServicingRights" id="boa_MortgageServicingRights"
                type="xbrli:monetaryItemType"
                substitutionGroup="xbrli:item"
                nillable="true"
                xbrli:balance="debit"
                xbrli:periodType="instant"/>
</xsd:schema>