<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="0" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<predefinedformats>
		<format basic-type="xsd" string="##0,000" datatype="integer"/>
	</predefinedformats>
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="YearlySales.xsd" workingxmlfile="YearlySales.xml"/>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
		<xpath-functions/>
	</flags>
	<scripts>
		<script language="javascript"/>
	</scripts>
	<script-project>
		<Project version="2" app="AuthenticView"/>
	</script-project>
	<importedxslt/>
	<globalstyles/>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<document-properties/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<bookmark>
								<action>
									<none/>
								</action>
								<bookmark>
									<fixtext value="Top"/>
								</bookmark>
							</bookmark>
							<template subtype="element" match="Data">
								<children>
									<newline/>
									<text fixtext="Yearly Sales by Region (Units Sold)">
										<styles color="#023d7d" font-family="Tahoma" font-size="20pt" font-weight="bold"/>
									</text>
									<newline/>
									<newline/>
									<text fixtext="Chart type: ">
										<styles color="#4b4b4b" font-family="Tahoma" font-size="11pt" font-weight="bold"/>
									</text>
									<text fixtext=" "/>
									<template subtype="element" match="ChartType">
										<children>
											<combobox enumeration="1">
												<styles color="#4b4b4b" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
												<children>
													<content/>
												</children>
											</combobox>
										</children>
										<variables/>
									</template>
									<newline/>
									<condition>
										<children>
											<conditionbranch xpath="ChartType=&apos;Pie Chart 2D&apos;">
												<children>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
													<text fixtext="Regions:">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt" font-weight="bold"/>
													</text>
													<text fixtext=" ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Americas">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Americas"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Europe">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Europe"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Asia">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Asia"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Yearly Market Share">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#YearlyMarketShare"/>
														</hyperlink>
													</link>
													<condition>
														<children>
															<conditionbranch xpath="$SV_OutputFormat = &apos;Authentic&apos;">
																<children>
																	<newline/>
																	<newline/>
																	<text fixtext="You can modify values in the regional tables below to see the effect on the charts.">
																		<styles font-style="italic"/>
																	</text>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<line>
														<styles color="#002780" height="2px" margin-bottom="20px" margin-top="10px"/>
													</line>
													<template subtype="element" match="Region">
														<children>
															<bookmark>
																<action>
																	<none/>
																</action>
																<bookmark>
																	<xpath value="@id"/>
																</bookmark>
															</bookmark>
															<text fixtext="Region: ">
																<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
															</text>
															<template subtype="attribute" match="id">
																<children>
																	<content>
																		<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext="   [ "/>
															<link>
																<children>
																	<text fixtext="Top">
																		<styles color="#787878" font-family="Tahoma" font-size="8pt" font-weight="bold"/>
																	</text>
																</children>
																<action>
																	<none/>
																</action>
																<hyperlink>
																	<fixtext value="#Top"/>
																</hyperlink>
															</link>
															<text fixtext=" ]"/>
															<newline/>
															<newline/>
															<chart chart-data-flexible="1">
																<styles border="1px gray solid" height="80mm" width="120mm"/>
																<layer>
																	<dataset>
																		<dataseries for-each="." series-name="&apos;None&apos;" x-value="Year/@id" y-value="Year"/>
																	</dataset>
																	<dataseries-xny-rows/>
																	<wizard-data>
																		<wizard-data-categories/>
																		<wizard-data-series/>
																	</wizard-data>
																	<chartsettings>
																		<General SettingsVersion="2" ChartKind="Pie"/>
																	</chartsettings>
																	<chartsettings-xpath>
																		<main-properties>
																			<main-property location="ChartSettings/General/@Title" xpath="concat(@id, ': Yearly Sales (in units)')"/>
																			<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Underline" xpath="'yes'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																		</main-properties>
																		<color-properties/>
																		<colorrange-properties/>
																	</chartsettings-xpath>
																</layer>
															</chart>
															<text fixtext=" "/>
															<text fixtext="  ">
																<styles color="#023d7d" font-family="Tahoma" font-size="10pt"/>
															</text>
															<newline/>
															<newline/>
															<tgrid>
																<properties cellpadding="2" cellspacing="0" frame="border" rules="none"/>
																<styles font-family="Arial" font-size="10pt"/>
																<children>
																	<tgridheader-cols>
																		<children>
																			<tgridcol/>
																		</children>
																	</tgridheader-cols>
																	<tgridbody-cols>
																		<children>
																			<template subtype="element" match="Year">
																				<children>
																					<tgridcol/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridbody-cols>
																	<tgridbody-rows>
																		<styles font-size="10pt"/>
																		<children>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Year">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="center"/>
																						<children>
																							<template subtype="attribute" match="id">
																								<children>
																									<content>
																										<styles color="black" font-family="Tahoma" font-size="10pt"/>
																										<format basic-type="xsd" datatype="short"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Sales">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="center"/>
																						<children>
																							<content>
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																								<format basic-type="xsd" string="##0,000" datatype="integer"/>
																							</content>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																		</children>
																	</tgridbody-rows>
																</children>
															</tgrid>
															<newline/>
															<template subtype="attribute" match="id">
																<children>
																	<content>
																		<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext=" ">
																<styles font-size="10pt"/>
															</text>
															<text fixtext="Total ">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<autocalc xpath="Year[1]/@id">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</autocalc>
															<text fixtext="-">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<autocalc xpath="Year[last()]/@id">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</autocalc>
															<text fixtext=":">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<text fixtext=" ">
																<styles color="black" font-family="Tahoma" font-size="10pt"/>
															</text>
															<autocalc xpath="sum(Year)">
																<styles font-family="Tahoma" font-size="10pt"/>
																<format basic-type="xsd" string="##0,000" datatype="integer"/>
															</autocalc>
															<newline/>
															<newline/>
															<line>
																<styles color="#002780" height="2px" margin-bottom="20px"/>
															</line>
														</children>
														<variables/>
													</template>
													<bookmark>
														<action>
															<none/>
														</action>
														<bookmark>
															<fixtext value="YearlyMarketShare"/>
														</bookmark>
													</bookmark>
													<text fixtext="Yearly Market Share ">
														<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
													</text>
													<text fixtext="   [ "/>
													<link>
														<children>
															<text fixtext="Top">
																<styles color="#787878" font-family="Tahoma" font-size="8pt" font-weight="bold"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Top"/>
														</hyperlink>
													</link>
													<text fixtext=" ]"/>
													<newline/>
													<paragraph>
														<styles margin-top="5px"/>
														<children>
															<text fixtext="Select Year:">
																<styles color="#4b4b4b" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<text fixtext=" ">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<template subtype="uservariable" match="$SelectYear">
																<children>
																	<combobox sortinauthentic="1" xpath="2005, 2006, 2007, 2008, 2009, 2010">
																		<styles width="0.66in"/>
																		<children>
																			<content>
																				<format basic-type="xsd" datatype="integer"/>
																			</content>
																		</children>
																	</combobox>
																</children>
																<variables/>
															</template>
														</children>
													</paragraph>
													<newline/>
													<chart chart-data-flexible="1">
														<styles border="1px gray solid" height="80mm" width="120mm"/>
														<layer>
															<dataset>
																<dataseries for-each="." series-name="&apos;None&apos;" x-value="Region/@id" y-value="for $i in //Year[@id=$SelectYear] return $i"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="Pie">
																	<LegendFont Size="4.%"/>
																</General>
																<Pie AddPercentToLabels="1">
																	<LabelFont Size="5.%"/>
																</Pie>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="concat('Yearly Market Share: ', $SelectYear)"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<text fixtext=" ">
														<styles color="#023d7d" font-family="Tahoma"/>
													</text>
													<newline/>
													<newline/>
													<tgrid>
														<properties cellpadding="5" cellspacing="0" frame="border" rules="none"/>
														<styles font-family="Tahoma" font-size="10pt"/>
														<children>
															<tgridheader-cols>
																<children>
																	<tgridcol/>
																</children>
															</tgridheader-cols>
															<tgridbody-cols>
																<children>
																	<template subtype="userdefined" match="for $i in distinct-values(//Year/@id) return $i">
																		<children>
																			<tgridcol/>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<styles background-color="#d2d2d2"/>
																		<children>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Region/Year ">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="center"/>
																				<children>
																					<content>
																						<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</content>
																					<text fixtext=" ">
																						<styles color="#1e1e1e" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Americas">
																						<styles color="#5a5a5a"/>
																					</text>
																					<newline/>
																					<text fixtext="(% in Year)">
																						<styles color="#5a5a5a" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="center"/>
																				<children>
																					<autocalc xpath="$XML/Data/Region[@id=&apos;Americas&apos;]/Year[@id= current() ]">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																					<newline/>
																					<text fixtext="("/>
																					<autocalc xpath="round-half-to-even($XML/Data/Region[@id=&apos;Americas&apos;]/Year[@id= current() ] div sum($XML/Data/Region/Year[@id= current() ]) * 100, 1)">
																						<format basic-type="xsd" datatype="integer"/>
																					</autocalc>
																					<text fixtext="%)"/>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Europe">
																						<styles color="#5a5a5a"/>
																					</text>
																					<newline/>
																					<text fixtext="(% in Year)">
																						<styles color="#5a5a5a" font-weight="bold"/>
																					</text>
																					<newline/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="center"/>
																				<children>
																					<autocalc xpath="$XML/Data/Region[@id=&apos;Europe&apos;]/Year[@id= current() ]">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																					<newline/>
																					<text fixtext="("/>
																					<autocalc xpath="round-half-to-even($XML/Data/Region[@id=&apos;Europe&apos;]/Year[@id= current() ] div sum($XML/Data/Region/Year[@id= current() ]) * 100, 1)">
																						<format basic-type="xsd" datatype="integer"/>
																					</autocalc>
																					<text fixtext="%)"/>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Asia">
																						<styles color="#5a5a5a"/>
																					</text>
																					<newline/>
																					<text fixtext="(% in Year)">
																						<styles color="#5a5a5a" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="center"/>
																				<children>
																					<autocalc xpath="$XML/Data/Region[@id=&apos;Asia&apos;]/Year[@id= current() ]">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																					<newline/>
																					<text fixtext="("/>
																					<autocalc xpath="round-half-to-even($XML/Data/Region[@id=&apos;Asia&apos;]/Year[@id= current() ] div sum($XML/Data/Region/Year[@id= current() ]) * 100, 1)">
																						<format basic-type="xsd" datatype="integer"/>
																					</autocalc>
																					<text fixtext="%)"/>
																					<newline/>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<styles background-color="#d2d2d2"/>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="All Regions"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="center"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
												</children>
											</conditionbranch>
											<conditionbranch xpath="ChartType=&apos;Pie Chart 3D&apos;">
												<children>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
													<text fixtext="Regions:">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt" font-weight="bold"/>
													</text>
													<text fixtext=" ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Americas">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Americas"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Europe">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Europe"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Asia">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Asia"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="All Regions">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#AllRegions"/>
														</hyperlink>
													</link>
													<condition>
														<children>
															<conditionbranch xpath="$SV_OutputFormat = &apos;Authentic&apos;">
																<children>
																	<newline/>
																	<newline/>
																	<text fixtext="You can modify values in the regional tables below to see the effect on the charts.">
																		<styles font-style="italic"/>
																	</text>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<line>
														<styles color="#002780" height="2px" margin-bottom="20px" margin-top="10px"/>
													</line>
													<template subtype="element" match="Region">
														<children>
															<bookmark>
																<action>
																	<none/>
																</action>
																<bookmark>
																	<xpath value="@id"/>
																</bookmark>
															</bookmark>
															<text fixtext="Region: ">
																<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
															</text>
															<template subtype="attribute" match="id">
																<children>
																	<content>
																		<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext="   [ "/>
															<link>
																<children>
																	<text fixtext="Top">
																		<styles color="#787878" font-family="Tahoma" font-size="8pt" font-weight="bold"/>
																	</text>
																</children>
																<action>
																	<none/>
																</action>
																<hyperlink>
																	<fixtext value="#Top"/>
																</hyperlink>
															</link>
															<text fixtext=" ]"/>
															<newline/>
															<newline/>
															<chart chart-data-flexible="1">
																<styles border="1px gray solid" height="80mm" width="107mm"/>
																<layer>
																	<dataset>
																		<dataseries for-each="." series-name="&apos;None&apos;" x-value="Year/@id" y-value="Year"/>
																	</dataset>
																	<dataseries-xny-rows/>
																	<wizard-data>
																		<wizard-data-categories/>
																		<wizard-data-series/>
																	</wizard-data>
																	<chartsettings>
																		<General SettingsVersion="2" ChartKind="Pie3d"/>
																		<Pie Tilt="30."/>
																	</chartsettings>
																	<chartsettings-xpath>
																		<main-properties>
																			<main-property location="ChartSettings/General/@Title" xpath="concat(@id, ': Yearly Sales (in units)')"/>
																			<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																		</main-properties>
																		<color-properties/>
																		<colorrange-properties/>
																	</chartsettings-xpath>
																</layer>
															</chart>
															<text fixtext=" "/>
															<text fixtext="  ">
																<styles color="#023d7d" font-family="Tahoma" font-size="10pt"/>
															</text>
															<newline/>
															<newline/>
															<tgrid>
																<properties cellpadding="2" cellspacing="0" frame="border" rules="none"/>
																<styles font-family="Arial" font-size="10pt"/>
																<children>
																	<tgridheader-cols>
																		<children>
																			<tgridcol/>
																		</children>
																	</tgridheader-cols>
																	<tgridbody-cols>
																		<children>
																			<template subtype="element" match="Year">
																				<children>
																					<tgridcol/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridbody-cols>
																	<tgridbody-rows>
																		<styles font-size="10pt"/>
																		<children>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Year">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="center"/>
																						<children>
																							<template subtype="attribute" match="id">
																								<children>
																									<content>
																										<styles color="black" font-family="Tahoma" font-size="10pt"/>
																										<format basic-type="xsd" datatype="short"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Sales">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="center"/>
																						<children>
																							<content>
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																								<format basic-type="xsd" string="##0,000" datatype="integer"/>
																							</content>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																		</children>
																	</tgridbody-rows>
																</children>
															</tgrid>
															<newline/>
															<template subtype="attribute" match="id">
																<children>
																	<content>
																		<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext=" ">
																<styles font-size="10pt"/>
															</text>
															<text fixtext="Total ">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<autocalc xpath="Year[1]/@id">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</autocalc>
															<text fixtext="-">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<autocalc xpath="Year[last()]/@id">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</autocalc>
															<text fixtext=":">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<text fixtext=" ">
																<styles color="black" font-family="Tahoma" font-size="10pt"/>
															</text>
															<autocalc xpath="sum(Year)">
																<styles font-family="Tahoma" font-size="10pt"/>
																<format basic-type="xsd" string="##0,000" datatype="integer"/>
															</autocalc>
															<newline/>
															<newline/>
															<line>
																<styles color="#002780" height="2px" margin-bottom="20px"/>
															</line>
														</children>
														<variables/>
													</template>
													<bookmark>
														<action>
															<none/>
														</action>
														<bookmark>
															<fixtext value="AllRegions"/>
														</bookmark>
													</bookmark>
													<text fixtext="Region: All Regions ">
														<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
													</text>
													<text fixtext="   [ "/>
													<link>
														<children>
															<text fixtext="Top">
																<styles color="#787878" font-family="Tahoma" font-size="8pt" font-weight="bold"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Top"/>
														</hyperlink>
													</link>
													<text fixtext=" ]"/>
													<newline/>
													<newline/>
													<chart chart-data-flexible="1">
														<styles border="1px gray solid" height="80mm" width="107mm"/>
														<layer>
															<dataset>
																<dataseries for-each="." series-name="&apos;None&apos;" x-value="for $i in distinct-values(//Year/@id) return $i" y-value="for $i in distinct-values(//Year/@id) return sum(//Year[@id=$i])"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="Pie3d"/>
																<Pie Tilt="30."/>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="'All Regions: Yearly Sales'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<text fixtext=" ">
														<styles color="#023d7d" font-family="Tahoma"/>
													</text>
													<newline/>
													<newline/>
													<tgrid>
														<properties cellpadding="2" cellspacing="0" frame="border" rules="none"/>
														<styles font-family="Tahoma" font-size="10pt"/>
														<children>
															<tgridheader-cols>
																<children>
																	<tgridcol/>
																</children>
															</tgridheader-cols>
															<tgridbody-cols>
																<children>
																	<template subtype="userdefined" match="for $i in distinct-values(//Year/@id) return $i">
																		<children>
																			<tgridcol/>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<styles background-color="#d2d2d2"/>
																		<children>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Region/Year">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="right"/>
																				<children>
																					<content>
																						<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</content>
																					<text fixtext=" ">
																						<styles color="#1e1e1e" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Americas">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Americas&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Europe">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Europe&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Asia">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Asia&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<styles background-color="#d2d2d2"/>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="All Regions"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
												</children>
											</conditionbranch>
											<conditionbranch xpath="ChartType=&apos;Bar Chart 2D&apos;">
												<children>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
													<text fixtext="Regions:">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt" font-weight="bold"/>
													</text>
													<text fixtext=" ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Americas">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Americas"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Europe">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Europe"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Asia">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Asia"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="All Regions">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#AllRegions"/>
														</hyperlink>
													</link>
													<condition>
														<children>
															<conditionbranch xpath="$SV_OutputFormat = &apos;Authentic&apos;">
																<children>
																	<newline/>
																	<newline/>
																	<text fixtext="You can modify values in the regional tables below to see the effect on the charts.">
																		<styles font-style="italic"/>
																	</text>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<line>
														<styles color="#002780" height="2px" margin-bottom="20px" margin-top="10px"/>
													</line>
													<template subtype="element" match="Region">
														<children>
															<bookmark>
																<action>
																	<none/>
																</action>
																<bookmark>
																	<xpath value="@id"/>
																</bookmark>
															</bookmark>
															<text fixtext="Region: ">
																<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
															</text>
															<template subtype="attribute" match="id">
																<children>
																	<content>
																		<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext="   [ "/>
															<link>
																<children>
																	<text fixtext="Top">
																		<styles color="#787878" font-family="Tahoma" font-size="8pt" font-weight="bold"/>
																	</text>
																</children>
																<action>
																	<none/>
																</action>
																<hyperlink>
																	<fixtext value="#Top"/>
																</hyperlink>
															</link>
															<text fixtext=" ]"/>
															<newline/>
															<newline/>
															<chart chart-data-flexible="1">
																<styles border="1px gray solid" height="80mm" width="120mm"/>
																<layer>
																	<dataset>
																		<dataseries for-each="." series-name="@id" x-value="Year/@id" y-value="Year"/>
																	</dataset>
																	<dataseries-xny-rows/>
																	<wizard-data>
																		<wizard-data-categories/>
																		<wizard-data-series/>
																	</wizard-data>
																	<chartsettings>
																		<General SettingsVersion="2"/>
																		<XY>
																			<XAxis/>
																			<YAxis UseAutoTick="0" ManualTickInterval="20000."/>
																		</XY>
																	</chartsettings>
																	<chartsettings-xpath>
																		<main-properties>
																			<main-property location="ChartSettings/General/@Title" xpath="concat(@id, ': Yearly Sales (in units)')"/>
																			<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																		</main-properties>
																		<color-properties/>
																		<colorrange-properties/>
																	</chartsettings-xpath>
																</layer>
															</chart>
															<text fixtext=" "/>
															<text fixtext="  ">
																<styles color="#023d7d" font-family="Tahoma" font-size="10pt"/>
															</text>
															<newline/>
															<newline/>
															<tgrid>
																<properties cellpadding="2" cellspacing="0" frame="border" rules="none"/>
																<styles font-family="Arial" font-size="10pt"/>
																<children>
																	<tgridheader-cols>
																		<children>
																			<tgridcol/>
																		</children>
																	</tgridheader-cols>
																	<tgridbody-cols>
																		<children>
																			<template subtype="element" match="Year">
																				<children>
																					<tgridcol/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridbody-cols>
																	<tgridbody-rows>
																		<styles font-size="10pt"/>
																		<children>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Year">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="center"/>
																						<children>
																							<template subtype="attribute" match="id">
																								<children>
																									<content>
																										<styles color="black" font-family="Tahoma" font-size="10pt"/>
																										<format basic-type="xsd" datatype="short"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Sales">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="center"/>
																						<children>
																							<content>
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																								<format basic-type="xsd" string="##0,000" datatype="integer"/>
																							</content>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																		</children>
																	</tgridbody-rows>
																</children>
															</tgrid>
															<newline/>
															<template subtype="attribute" match="id">
																<children>
																	<content>
																		<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext=" ">
																<styles font-size="10pt"/>
															</text>
															<text fixtext="Total ">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<autocalc xpath="Year[1]/@id">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</autocalc>
															<text fixtext="-">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<autocalc xpath="Year[last()]/@id">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</autocalc>
															<text fixtext=":">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<text fixtext=" ">
																<styles color="black" font-family="Tahoma" font-size="10pt"/>
															</text>
															<autocalc xpath="sum(Year)">
																<styles font-family="Tahoma" font-size="10pt"/>
																<format basic-type="xsd" string="##0,000" datatype="integer"/>
															</autocalc>
															<newline/>
															<newline/>
															<line>
																<styles color="#002780" height="2px" margin-bottom="20px"/>
															</line>
														</children>
														<variables/>
													</template>
													<bookmark>
														<action>
															<none/>
														</action>
														<bookmark>
															<fixtext value="AllRegions"/>
														</bookmark>
													</bookmark>
													<text fixtext="Region: All Regions ">
														<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
													</text>
													<text fixtext="   [ "/>
													<link>
														<children>
															<text fixtext="Top">
																<styles color="#787878" font-family="Tahoma" font-size="8pt" font-weight="bold"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Top"/>
														</hyperlink>
													</link>
													<text fixtext=" ]"/>
													<newline/>
													<newline/>
													<chart chart-data-flexible="1">
														<styles border="1px gray solid" height="80mm" margin-bottom="5px" width="120mm"/>
														<layer>
															<dataset>
																<dataseries for-each="." series-name="&apos;All Regions&apos;" x-value="for $i in distinct-values(//Year/@id) return $i" y-value="for $i in distinct-values(//Year/@id) return sum(//Year[@id=$i])"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2"/>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="'All Regions: Yearly Sales'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<text fixtext=" ">
														<styles color="#023d7d" font-family="Tahoma"/>
													</text>
													<text fixtext="  "/>
													<chart chart-data-flexible="1">
														<styles border="1px gray solid" height="80mm" width="120mm"/>
														<layer>
															<dataset>
																<dataseries for-each="." series-name="&apos;Americas&apos;" x-value="Region[@id=&apos;Europe&apos;]/Year/@id" y-value="Region[@id=&apos;Americas&apos;]/Year"/>
																<dataseries for-each="." series-name="&apos;Europe&apos;" x-value="Region[@id=&apos;Europe&apos;]/Year/@id" y-value="Region[@id=&apos;Europe&apos;]/Year"/>
																<dataseries for-each="." series-name="&apos;Asia&apos;" x-value="Region[@id=&apos;Europe&apos;]/Year/@id" y-value="Region[@id=&apos;Asia&apos;]/Year"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2"/>
																<XY>
																	<XAxis/>
																	<YAxis UseAutoTick="0" ManualTickInterval="20000."/>
																</XY>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="'Yearly Sales: Regional Comparison'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<newline/>
													<newline/>
													<tgrid>
														<properties cellpadding="5" cellspacing="0" frame="border" rules="none"/>
														<styles font-family="Tahoma" font-size="10pt"/>
														<children>
															<tgridheader-cols>
																<children>
																	<tgridcol/>
																</children>
															</tgridheader-cols>
															<tgridbody-cols>
																<children>
																	<template subtype="userdefined" match="for $i in distinct-values(//Year/@id) return $i">
																		<children>
																			<tgridcol/>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<styles background-color="#d2d2d2"/>
																		<children>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Region/Year">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="right"/>
																				<children>
																					<content>
																						<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</content>
																					<text fixtext=" ">
																						<styles color="#1e1e1e" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Americas">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Americas&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Europe">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Europe&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Asia">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Asia&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<styles background-color="#d2d2d2"/>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="All Regions"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
												</children>
											</conditionbranch>
											<conditionbranch xpath="ChartType=&apos;Bar Chart 3D&apos;">
												<children>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
													<text fixtext="Regions:">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt" font-weight="bold"/>
													</text>
													<text fixtext=" ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Americas">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Americas"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Europe">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Europe"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="Asia">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Asia"/>
														</hyperlink>
													</link>
													<text fixtext="  ">
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
													</text>
													<link>
														<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
														<children>
															<text fixtext="All Regions">
																<styles color="#2d2d2d" font-family="Tahoma" font-size="11pt"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#AllRegions"/>
														</hyperlink>
													</link>
													<condition>
														<children>
															<conditionbranch xpath="$SV_OutputFormat = &apos;Authentic&apos;">
																<children>
																	<newline/>
																	<newline/>
																	<text fixtext="You can modify values in the regional tables below to see the effect on the charts.">
																		<styles font-style="italic"/>
																	</text>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<line>
														<styles color="#002780" height="2px" margin-bottom="20px" margin-top="10px"/>
													</line>
													<template subtype="element" match="Region">
														<children>
															<bookmark>
																<action>
																	<none/>
																</action>
																<bookmark>
																	<xpath value="@id"/>
																</bookmark>
															</bookmark>
															<text fixtext="Region: ">
																<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
															</text>
															<template subtype="attribute" match="id">
																<children>
																	<content>
																		<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext="   [ "/>
															<link>
																<children>
																	<text fixtext="Top">
																		<styles color="#787878" font-family="Tahoma" font-size="8pt" font-weight="bold"/>
																	</text>
																</children>
																<action>
																	<none/>
																</action>
																<hyperlink>
																	<fixtext value="#Top"/>
																</hyperlink>
															</link>
															<text fixtext=" ]"/>
															<newline/>
															<newline/>
															<chart chart-data-flexible="1">
																<styles border="1px gray solid" height="80mm" width="107mm"/>
																<layer>
																	<dataset>
																		<dataseries for-each="." series-name="@id" x-value="Year/@id" y-value="Year"/>
																	</dataset>
																	<dataseries-xny-rows/>
																	<wizard-data>
																		<wizard-data-categories/>
																		<wizard-data-series/>
																	</wizard-data>
																	<chartsettings>
																		<General SettingsVersion="2" ChartKind="BarChart3d"/>
																		<XY>
																			<XAxis/>
																			<YAxis UseAutoTick="0" ManualTickInterval="20000."/>
																		</XY>
																		<XY3d Tilt="10.">
																			<ZAxis/>
																		</XY3d>
																	</chartsettings>
																	<chartsettings-xpath>
																		<main-properties>
																			<main-property location="ChartSettings/General/@Title" xpath="concat(@id, ': Yearly Sales (in units)')"/>
																			<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																			<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																		</main-properties>
																		<color-properties/>
																		<colorrange-properties/>
																	</chartsettings-xpath>
																</layer>
															</chart>
															<text fixtext=" "/>
															<text fixtext="  ">
																<styles color="#023d7d" font-family="Tahoma" font-size="10pt"/>
															</text>
															<newline/>
															<newline/>
															<tgrid>
																<properties cellpadding="2" cellspacing="0" frame="border" rules="none"/>
																<styles font-family="Arial" font-size="10pt"/>
																<children>
																	<tgridheader-cols>
																		<children>
																			<tgridcol/>
																		</children>
																	</tgridheader-cols>
																	<tgridbody-cols>
																		<children>
																			<template subtype="element" match="Year">
																				<children>
																					<tgridcol/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridbody-cols>
																	<tgridbody-rows>
																		<styles font-size="10pt"/>
																		<children>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Year">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="center"/>
																						<children>
																							<template subtype="attribute" match="id">
																								<children>
																									<content>
																										<styles color="black" font-family="Tahoma" font-size="10pt"/>
																										<format basic-type="xsd" datatype="short"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Sales">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" font-size="10pt" padding-right="10px" text-align="center"/>
																						<children>
																							<content>
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																								<format basic-type="xsd" string="##0,000" datatype="integer"/>
																							</content>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																		</children>
																	</tgridbody-rows>
																</children>
															</tgrid>
															<newline/>
															<template subtype="attribute" match="id">
																<children>
																	<content>
																		<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext=" ">
																<styles font-size="10pt"/>
															</text>
															<text fixtext="Total ">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<autocalc xpath="Year[1]/@id">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</autocalc>
															<text fixtext="-">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<autocalc xpath="Year[last()]/@id">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</autocalc>
															<text fixtext=":">
																<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<text fixtext=" ">
																<styles color="black" font-family="Tahoma" font-size="10pt"/>
															</text>
															<autocalc xpath="sum(Year)">
																<styles font-family="Tahoma" font-size="10pt"/>
																<format basic-type="xsd" string="##0,000" datatype="integer"/>
															</autocalc>
															<newline/>
															<newline/>
															<line>
																<styles color="#002780" height="2px" margin-bottom="20px"/>
															</line>
														</children>
														<variables/>
													</template>
													<bookmark>
														<action>
															<none/>
														</action>
														<bookmark>
															<fixtext value="AllRegions"/>
														</bookmark>
													</bookmark>
													<text fixtext="Region: All Regions ">
														<styles color="#023d7d" font-family="Tahoma" font-size="12pt" font-weight="bold"/>
													</text>
													<text fixtext="   [ "/>
													<link>
														<children>
															<text fixtext="Top">
																<styles color="#787878" font-family="Tahoma" font-size="8pt" font-weight="bold"/>
															</text>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="#Top"/>
														</hyperlink>
													</link>
													<text fixtext=" ]"/>
													<newline/>
													<newline/>
													<chart chart-data-flexible="1">
														<styles border="1px gray solid" height="80mm" margin-bottom="5px" width="120mm"/>
														<layer>
															<dataset>
																<dataseries for-each="." series-name="&apos;All Regions&apos;" x-value="for $i in distinct-values(//Year/@id) return $i" y-value="for $i in distinct-values(//Year/@id) return sum(//Year[@id=$i])"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="BarChart3d"/>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="'All Regions (Cumulative, per Year)'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<newline/>
													<newline/>
													<chart chart-data-flexible="1">
														<styles border="1px gray solid" height="80mm" width="120mm"/>
														<layer>
															<dataset>
																<dataseries for-each="." series-name="&apos;Americas&apos;" x-value="Region[@id=&apos;Europe&apos;]/Year/@id" y-value="Region[@id=&apos;Americas&apos;]/Year"/>
																<dataseries for-each="." series-name="&apos;Europe&apos;" x-value="Region[@id=&apos;Europe&apos;]/Year/@id" y-value="Region[@id=&apos;Europe&apos;]/Year"/>
																<dataseries for-each="." series-name="&apos;Asia&apos;" x-value="Region[@id=&apos;Europe&apos;]/Year/@id" y-value="Region[@id=&apos;Asia&apos;]/Year"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="BarChart3d"/>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="'All Regions (Separate, per Year)'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<text fixtext=" ">
														<styles color="#023d7d" font-family="Tahoma"/>
													</text>
													<newline/>
													<newline/>
													<tgrid>
														<properties cellpadding="5" cellspacing="0" frame="border" rules="none"/>
														<styles font-family="Tahoma" font-size="10pt"/>
														<children>
															<tgridheader-cols>
																<children>
																	<tgridcol/>
																</children>
															</tgridheader-cols>
															<tgridbody-cols>
																<children>
																	<template subtype="userdefined" match="for $i in distinct-values(//Year/@id) return $i">
																		<children>
																			<tgridcol/>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<styles background-color="#d2d2d2"/>
																		<children>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Region/Year">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="right"/>
																				<children>
																					<content>
																						<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</content>
																					<text fixtext=" ">
																						<styles color="#1e1e1e" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Americas">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Americas&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Europe">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Europe&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Asia">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Asia&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<styles background-color="#d2d2d2"/>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="All Regions"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
												</children>
											</conditionbranch>
											<conditionbranch xpath="ChartType=&apos;Bar Chart 3D Grouped&apos;">
												<children>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
													<condition>
														<children>
															<conditionbranch xpath="$SV_OutputFormat = &apos;Authentic&apos;">
																<children>
																	<text fixtext="You can modify values in the regional tables below (not the summary table) to see the effect on the chart.">
																		<styles font-style="italic"/>
																	</text>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<chart>
														<styles border="1px gray solid" height="100mm" width="150mm"/>
														<layer>
															<dataset>
																<dataseries for-each="." series-name="&apos;Americas&apos;" x-value="Region[@id=&apos;Europe&apos;]/Year/@id" y-value="Region[@id=&apos;Americas&apos;]/Year"/>
																<dataseries for-each="." series-name="&apos;Europe&apos;" y-value="Region[@id=&apos;Europe&apos;]/Year"/>
																<dataseries for-each="." series-name="&apos;Asia&apos;" y-value="Region[@id=&apos;Asia&apos;]/Year"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="BarChart3dGrouped"/>
																<XY>
																	<XAxis/>
																	<YAxis UseAutoTick="0" ManualTickInterval="20000."/>
																</XY>
																<XY3d Tilt="4.">
																	<ZAxis/>
																</XY3d>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="'Yearly Sales: Regional Comparison'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'18pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<text fixtext=" ">
														<styles color="#023d7d" font-family="Tahoma"/>
													</text>
													<newline/>
													<newline/>
													<text fixtext="Summary">
														<styles color="#023d7d" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
													</text>
													<newline/>
													<tgrid>
														<properties cellpadding="5" cellspacing="0" frame="border" rules="none"/>
														<styles font-family="Tahoma" font-size="10pt"/>
														<children>
															<tgridheader-cols>
																<children>
																	<tgridcol/>
																</children>
															</tgridheader-cols>
															<tgridbody-cols>
																<children>
																	<template subtype="userdefined" match="for $i in distinct-values(//Year/@id) return $i">
																		<children>
																			<tgridcol/>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<styles background-color="#e1e1e1"/>
																		<children>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Region/Year">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="right"/>
																				<children>
																					<content>
																						<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</content>
																					<text fixtext=" ">
																						<styles color="#1e1e1e" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Americas">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Americas&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Europe">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Europe&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Asia">
																						<styles color="#5a5a5a"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region[@id=&apos;Asia&apos;]/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<styles background-color="#e1e1e1"/>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="All Regions"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="right"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
													<template subtype="element" match="Region">
														<children>
															<newline/>
															<text fixtext="Region: ">
																<styles color="#023d7d" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<template subtype="attribute" match="id">
																<children>
																	<content>
																		<styles color="#023d7d" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<newline/>
															<tgrid>
																<properties cellpadding="5" cellspacing="0" frame="border" rules="none"/>
																<styles font-family="Arial"/>
																<children>
																	<tgridheader-cols>
																		<children>
																			<tgridcol/>
																		</children>
																	</tgridheader-cols>
																	<tgridbody-cols>
																		<children>
																			<template subtype="element" match="Year">
																				<children>
																					<tgridcol/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridbody-cols>
																	<tgridbody-rows>
																		<children>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Year">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" padding-right="10px" text-align="center"/>
																						<children>
																							<template subtype="attribute" match="id">
																								<children>
																									<content>
																										<styles color="black" font-family="Tahoma" font-size="10pt"/>
																										<format basic-type="xsd" datatype="short"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Sales">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" padding-right="10px" text-align="center"/>
																						<children>
																							<content>
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																								<format basic-type="xsd" string="##0,000" datatype="integer"/>
																							</content>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																		</children>
																	</tgridbody-rows>
																</children>
															</tgrid>
														</children>
														<variables/>
													</template>
													<newline/>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
												</children>
											</conditionbranch>
											<conditionbranch xpath="ChartType=&apos;Line Graph&apos;">
												<children>
													<line>
														<styles color="#002780" height="4px" margin-bottom="20px" margin-top="20px"/>
													</line>
													<text fixtext="Charts 1 to 4 produce identical plots. However, each is obtained using a different chart data selection method. Check the Chart Configuration dialog to see the difference between selection methods. In Authentic View, you can modify values in the regional tables below the charts to see the effect on the graphs. Two charts can be seen side-by-side if you broaden the Authentic View window.">
														<styles font-style="italic"/>
													</text>
													<newline/>
													<newline/>
													<chart chart-data-flexible="1">
														<styles border="1px gray solid" height="80mm" width="80mm"/>
														<layer>
															<dataset>
																<dataseries for-each="Region" series-name="@id" x-value="Year/@id" y-value="Year"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="LineChart"/>
																<Line ConnectionShapeSize="7.px"/>
																<XY>
																	<XAxis/>
																	<YAxis UseAutoTick="0" ManualTickInterval="20000."/>
																</XY>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="'Chart 1: Flexible Selection A'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'16pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<text fixtext="         "/>
													<chart chart-data-flexible="1">
														<styles border="1px gray solid" height="80mm" width="80mm"/>
														<layer>
															<dataset>
																<dataseries for-each="Region[@id=&apos;Americas&apos;]" series-name="&apos;Americas&apos;" x-value="Year/@id" y-value="Year"/>
																<dataseries for-each="Region[@id=&apos;Europe&apos;]" series-name="&apos;Europe&apos;" x-value="Year/@id" y-value="Year"/>
																<dataseries for-each="Region[@id=&apos;Asia&apos;]" series-name="&apos;Asia&apos;" x-value="Year/@id" y-value="Year"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="LineChart"/>
																<Line ConnectionShapeSize="7.px" DrawFilledConnectionShapes="0" DrawOutlineConnectionShapes="1"/>
																<XY>
																	<XAxis/>
																	<YAxis UseAutoTick="0" ManualTickInterval="20000."/>
																</XY>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="'Chart 2: Flexible Selection B'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'16pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<newline/>
													<newline/>
													<chart>
														<styles border="1px gray solid" height="80mm" width="80mm"/>
														<layer>
															<dataset>
																<dataseries for-each="Region" series-name="@id" x-value="Year/@id" y-value="Year"/>
															</dataset>
															<dataseries-xny-rows for-each="distinct-values(Region/Year/@id )" x-value="." auto-x-value="0">
																<col y-value="for $i in . return $XML//Region[@id eq &apos;Americas&apos; ]/Year[@id eq $i]" y-name="&quot;Americas&quot;"/>
																<col y-value="for $i in . return $XML//Region[@id eq &apos;Europe&apos;]/Year[@id eq $i]" y-name="&quot;Europe&quot;"/>
																<col y-value="for $i in . return $XML//Region[@id eq &apos;Asia&apos;]/Year[@id eq $i]" y-name="&quot;Asia&quot;"/>
															</dataseries-xny-rows>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="LineChart"/>
																<Line ConnectionShapeSize="7.px" DrawFilledConnectionShapes="0" DrawSlashConnectionShapes="1"/>
																<XY>
																	<XAxis/>
																	<YAxis UseAutoTick="0" ManualTickInterval="20000."/>
																</XY>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="'Chart 3: Simple Selection A'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'16pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<text fixtext="         "/>
													<chart>
														<styles border="1px gray solid" height="80mm" width="80mm"/>
														<layer>
															<dataset>
																<dataseries for-each="Region" series-name="@id" x-value="Year/@id" y-value="Year"/>
															</dataset>
															<dataseries-xny-rows for-each="Region[1]/Year" x-value="@id" auto-x-value="0">
																<col y-value="text()" y-name="&quot;Americas&quot;"/>
																<col y-value="for $i in @id return //Region[2]/Year[@id = $i]" y-name="&quot;Europe&quot;"/>
																<col y-value="for $i in @id return //Region[3]/Year[@id = $i]" y-name="&quot;Asia&quot;"/>
															</dataseries-xny-rows>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="LineChart"/>
																<Line ConnectionShapeSize="7.px" DrawFilledConnectionShapes="0" DrawBackslashConnectionShapes="1"/>
																<XY>
																	<XAxis/>
																	<YAxis UseAutoTick="0" ManualTickInterval="20000."/>
																</XY>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="'Chart 4: Simple Selection B'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'16pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<newline/>
													<template subtype="element" match="Region">
														<children>
															<newline/>
															<text fixtext="Region: ">
																<styles color="#023d7d" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<template subtype="attribute" match="id">
																<children>
																	<content>
																		<styles color="#023d7d" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<newline/>
															<tgrid>
																<properties cellpadding="5" cellspacing="0" frame="border" rules="none"/>
																<styles font-family="Arial"/>
																<children>
																	<tgridheader-cols>
																		<children>
																			<tgridcol/>
																		</children>
																	</tgridheader-cols>
																	<tgridbody-cols>
																		<children>
																			<template subtype="element" match="Year">
																				<children>
																					<tgridcol/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridbody-cols>
																	<tgridbody-rows>
																		<children>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Year">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" padding-right="10px" text-align="center"/>
																						<children>
																							<template subtype="attribute" match="id">
																								<children>
																									<content>
																										<styles color="black" font-family="Tahoma" font-size="10pt"/>
																										<format basic-type="xsd" datatype="short"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<styles border="1px solid #666666" padding-right="10px" text-align="left"/>
																						<children>
																							<text fixtext="Sales">
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid #666666" padding-right="10px" text-align="center"/>
																						<children>
																							<content>
																								<styles color="black" font-family="Tahoma" font-size="10pt"/>
																								<format basic-type="xsd" string="##0,000" datatype="integer"/>
																							</content>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																		</children>
																	</tgridbody-rows>
																</children>
															</tgrid>
														</children>
														<variables/>
													</template>
													<line>
														<styles color="#002780" height="4px" margin-bottom="20px" margin-top="20px"/>
													</line>
												</children>
											</conditionbranch>
											<conditionbranch xpath="ChartType=&apos;Gauge&apos;">
												<children>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
													<paragraph>
														<styles margin-top="5px"/>
														<children>
															<text fixtext="Select Region:">
																<styles color="#4b4b4b" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<text fixtext=" ">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<template subtype="uservariable" match="$SelectRegion">
																<children>
																	<combobox sortinauthentic="1" xpath="distinct-values($XML/Data/Region/@id)">
																		<styles width="0.92in"/>
																		<children>
																			<content>
																				<format basic-type="xsd" datatype="integer"/>
																			</content>
																		</children>
																	</combobox>
																</children>
																<variables/>
															</template>
															<text fixtext=" "/>
															<text fixtext=" Select Year:">
																<styles color="#4b4b4b" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<text fixtext=" ">
																<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
															</text>
															<template subtype="uservariable" match="$SelectYear">
																<children>
																	<combobox sortinauthentic="1" xpath="2005, 2006, 2007, 2008, 2009, 2010">
																		<styles width="0.66in"/>
																		<children>
																			<content>
																				<format basic-type="xsd" datatype="integer"/>
																			</content>
																		</children>
																	</combobox>
																</children>
																<variables/>
															</template>
														</children>
													</paragraph>
													<newline/>
													<chart chart-data-flexible="1">
														<styles border="1px gray solid" height="80mm" width="85.73mm"/>
														<layer>
															<dataset>
																<dataseries for-each="." series-name="&apos;None&apos;" x-value="&apos;None&apos;" y-value="Region[@id=$SelectRegion]/Year[@id=$SelectYear]"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="RoundGauge"/>
																<Gauge MaxVal="200000." MajorTickWidth="2.px" MajorTickStep="20000." MinorTickStep="10000.">
																	<ColorRanges/>
																</Gauge>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="concat($SelectRegion, ' in ', $SelectYear, ' = ', Region[@id=$SelectRegion]/Year[@id=$SelectYear] )"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'15pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<text fixtext="    ">
														<styles color="#023d7d" font-family="Tahoma"/>
													</text>
													<chart chart-data-flexible="1">
														<styles border="1px gray solid" height="80mm" width="85.73mm"/>
														<layer>
															<dataset>
																<dataseries for-each="." series-name="&apos;None&apos;" x-value="&apos;None&apos;" y-value="round-half-to-even(Region[@id=$SelectRegion]/Year[@id= $SelectYear] div sum(//Year[@id= $SelectYear]) * 100, 1)"/>
															</dataset>
															<dataseries-xny-rows/>
															<wizard-data>
																<wizard-data-categories/>
																<wizard-data-series/>
															</wizard-data>
															<chartsettings>
																<General SettingsVersion="2" ChartKind="BarGauge"/>
																<Gauge MajorTickWidth="2.px" FillColor="#acc9d2" MajorTickColor="#4b4b4b" MinorTickColor="#4b4b4b" BarGaugeRadius="1.%" BarGaugeMaxHeight="10.%">
																	<TicksFont Color="#000000"/>
																	<ColorRanges/>
																</Gauge>
															</chartsettings>
															<chartsettings-xpath>
																<main-properties>
																	<main-property location="ChartSettings/General/@Title" xpath="concat($SelectRegion, ' = ', round-half-to-even(Region[@id=$SelectRegion]/Year[@id= $SelectYear] div sum(//Year[@id= $SelectYear]) * 100, 1), '% of Total in ', $SelectYear)"/>
																	<main-property location="ChartSettings/General/TitleFont/@Color" xpath="'#023d7d'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Name" xpath="'Tahoma'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Bold" xpath="'1'"/>
																	<main-property location="ChartSettings/General/TitleFont/@Size" xpath="'15pt'"/>
																</main-properties>
																<color-properties/>
																<colorrange-properties/>
															</chartsettings-xpath>
														</layer>
													</chart>
													<newline/>
													<newline/>
													<tgrid>
														<properties cellpadding="5" cellspacing="0" frame="border" rules="none"/>
														<styles font-family="Tahoma" font-size="10pt"/>
														<children>
															<tgridheader-cols>
																<children>
																	<tgridcol/>
																</children>
															</tgridheader-cols>
															<tgridbody-cols>
																<children>
																	<template subtype="userdefined" match="for $i in distinct-values(//Year/@id) return $i">
																		<children>
																			<tgridcol/>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<styles background-color="#d2d2d2"/>
																		<children>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Region/Year ">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles background-color="silver" border="1px solid #666666" text-align="center"/>
																				<children>
																					<content>
																						<styles color="black" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</content>
																					<text fixtext=" ">
																						<styles color="#1e1e1e" font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Americas">
																						<styles color="#5a5a5a"/>
																					</text>
																					<newline/>
																					<text fixtext="(% in Year)">
																						<styles color="#5a5a5a" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="center"/>
																				<children>
																					<autocalc xpath="$XML/Data/Region[@id=&apos;Americas&apos;]/Year[@id= current() ]">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																					<newline/>
																					<text fixtext="("/>
																					<autocalc xpath="round-half-to-even($XML/Data/Region[@id=&apos;Americas&apos;]/Year[@id= current() ] div sum($XML/Data/Region/Year[@id= current() ]) * 100, 1)">
																						<format basic-type="xsd" datatype="integer"/>
																					</autocalc>
																					<text fixtext="%)"/>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Europe">
																						<styles color="#5a5a5a"/>
																					</text>
																					<newline/>
																					<text fixtext="(% in Year)">
																						<styles color="#5a5a5a" font-weight="bold"/>
																					</text>
																					<newline/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="center"/>
																				<children>
																					<autocalc xpath="$XML/Data/Region[@id=&apos;Europe&apos;]/Year[@id= current() ]">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																					<newline/>
																					<text fixtext="("/>
																					<autocalc xpath="round-half-to-even($XML/Data/Region[@id=&apos;Europe&apos;]/Year[@id= current() ] div sum($XML/Data/Region/Year[@id= current() ]) * 100, 1)">
																						<format basic-type="xsd" datatype="integer"/>
																					</autocalc>
																					<text fixtext="%)"/>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="Asia">
																						<styles color="#5a5a5a"/>
																					</text>
																					<newline/>
																					<text fixtext="(% in Year)">
																						<styles color="#5a5a5a" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="center"/>
																				<children>
																					<autocalc xpath="$XML/Data/Region[@id=&apos;Asia&apos;]/Year[@id= current() ]">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																					<newline/>
																					<text fixtext="("/>
																					<autocalc xpath="round-half-to-even($XML/Data/Region[@id=&apos;Asia&apos;]/Year[@id= current() ] div sum($XML/Data/Region/Year[@id= current() ]) * 100, 1)">
																						<format basic-type="xsd" datatype="integer"/>
																					</autocalc>
																					<text fixtext="%)"/>
																					<newline/>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<styles background-color="#d2d2d2"/>
																		<children>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="left"/>
																				<children>
																					<text fixtext="All Regions"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="1px solid #666666" text-align="center"/>
																				<children>
																					<autocalc xpath="sum($XML/Data/Region/Year[@id= current() ])">
																						<format basic-type="xsd" string="##0,000" datatype="integer"/>
																					</autocalc>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
													<line>
														<styles color="#002780" height="4px" margin-bottom="10px" margin-top="20px"/>
													</line>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
								<variables>
									<variable name="SelectYear" value="2005" valuetype="xs:integer" editable="1"/>
									<variable name="SelectRegion" value="&apos;Americas&apos;" valuetype="xs:string" editable="1"/>
								</variables>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>
