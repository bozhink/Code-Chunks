<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="TemperaturesYearly.xsd"/>
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
							<newline/>
							<paragraph paragraphtag="h2">
								<styles border-bottom="2px solid navy" color="navy"/>
								<children>
									<text fixtext="Temperature statistics"/>
								</children>
							</paragraph>
							<paragraph paragraphtag="p">
								<styles font-family="Tahoma" font-size="14pt"/>
								<children>
									<text fixtext="Analyzing raw data and creating convincingly understandable reports becomes more and more a key issue in many fields of business and research. Communicating complex data in a quick and flexible way is vital to make sure that business analysts and decision makers get the confidential information they need."/>
								</children>
							</paragraph>
							<paragraph paragraphtag="p">
								<styles font-family="Tahoma" font-size="14pt"/>
								<children>
									<text fixtext="Temperature statistics and analysis is but one of many examples. Tracking the temperature on a local and global level by means of reliable temperature acquisition systems is state of the art and modern systems are available at reasonable costs and yield mass of raw data. But to gain real evidence about trends requires the analysis of this data by means of flexible and versatile reporting tools."/>
								</children>
							</paragraph>
							<paragraph paragraphtag="p">
								<styles font-family="Tahoma" font-size="14pt"/>
								<children>
									<text fixtext="See "/>
									<link>
										<children>
											<text fixtext="Figure 1"/>
										</children>
										<action>
											<none/>
										</action>
										<hyperlink>
											<fixtext value="#Figure_One"/>
										</hyperlink>
									</link>
									<text fixtext=" as an example how charts can display data."/>
								</children>
							</paragraph>
							<chart chart-data-flexible="1">
								<styles border-style="solid" border-width="thin" height="500px" width="600px"/>
								<layer>
									<dataset>
										<dataseries for-each="." series-name="&apos;Maximum&apos;" x-value="Temperatures/YearlyStats/@Year" y-value="Temperatures/YearlyStats/MaximumTemp"/>
										<dataseries for-each="." series-name="&apos;Average&apos;" x-value="Temperatures/YearlyStats/@Year" y-value="Temperatures/YearlyStats/AverageTemp"/>
										<dataseries for-each="." series-name="&apos;Minimum&apos;" x-value="Temperatures/YearlyStats/@Year" y-value="Temperatures/YearlyStats/MinimumTemp"/>
									</dataset>
									<dataseries-xny-rows for-each="*"/>
									<wizard-data remove-empty-cat="1" remove-empty-ser="1">
										<wizard-data-categories/>
										<wizard-data-series/>
									</wizard-data>
									<chartsettings>
										<General SettingsVersion="2" BKColor="#d2d2d2" BKColorGradientEnd="#f0f0f0" BKMode="VertGradient"/>
										<Colors Style="User" Colors="#dc143c" Colors1="#04b508" Colors2="#0879b5" Colors3="#dc7708" Colors4="#ffd700" Colors5="#4410a3" Colors6="#878369" Colors7="#b71b68" Colors8="#a25d2d" Colors9="#0028ff" Colors10="#bfbfbf" Colors11="#237518" Colors12="#52aca0" Colors13="#d3c15d" Colors14="#8971d8"/>
									</chartsettings>
									<chartsettings-xpath>
										<main-properties/>
										<color-properties/>
										<colorrange-properties/>
									</chartsettings-xpath>
								</layer>
							</chart>
							<newline/>
							<newline/>
							<paragraph paragraphtag="center">
								<styles text-align="left"/>
								<children>
									<bookmark>
										<children>
											<text fixtext="Figure 1:"/>
										</children>
										<action>
											<none/>
										</action>
										<bookmark>
											<fixtext value="Figure_One"/>
										</bookmark>
									</bookmark>
									<text fixtext=" Temporal statistics of the minimum, maximum and average temperature from 2006 to 2010"/>
								</children>
							</paragraph>
							<newline/>
							<paragraph paragraphtag="p">
								<styles font-family="Tahoma" font-size="14pt"/>
								<children>
									<text fixtext="Similarly tables containing the base data for the chart can be easily included into reports. See "/>
									<link>
										<children>
											<text fixtext="Figure 2"/>
										</children>
										<action>
											<none/>
										</action>
										<hyperlink>
											<fixtext value="#Figure_Two"/>
										</hyperlink>
									</link>
									<text fixtext=" as an illustration. Charts and tables are highly customizable."/>
								</children>
							</paragraph>
							<paragraph paragraphtag="p">
								<styles font-family="Tahoma" font-size="14pt"/>
								<children>
									<tgrid>
										<properties border="1"/>
										<styles border="1px solid black" border-collapse="collapse" width="600px"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol/>
													<tgridcol>
														<styles width="150px"/>
													</tgridcol>
													<tgridcol>
														<styles width="150px"/>
													</tgridcol>
													<tgridcol>
														<styles width="150px"/>
													</tgridcol>
												</children>
											</tgridbody-cols>
											<tgridheader-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<children>
																	<text fixtext="Year"/>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="Max. Temperature"/>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="Min. Temperature"/>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="Avg. Temperature"/>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridheader-rows>
											<tgridbody-rows>
												<children>
													<template subtype="element" match="Temperatures">
														<children>
															<template subtype="element" match="YearlyStats">
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles text-align="center"/>
																				<children>
																					<template subtype="attribute" match="Year">
																						<children>
																							<content>
																								<format basic-type="xsd" datatype="int"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles text-align="center"/>
																				<children>
																					<template subtype="element" match="MinimumTemp">
																						<children>
																							<content>
																								<format basic-type="xsd" datatype="decimal"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles text-align="center"/>
																				<children>
																					<template subtype="element" match="MaximumTemp">
																						<children>
																							<content>
																								<format basic-type="xsd" datatype="decimal"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles text-align="center"/>
																				<children>
																					<template subtype="element" match="AverageTemp">
																						<children>
																							<content>
																								<format basic-type="xsd" datatype="decimal"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
								</children>
							</paragraph>
							<paragraph paragraphtag="center">
								<styles text-align="left"/>
								<children>
									<bookmark>
										<children>
											<text fixtext="Figure 2:"/>
										</children>
										<action>
											<none/>
										</action>
										<bookmark>
											<fixtext value="Figure_Two"/>
										</bookmark>
									</bookmark>
									<text fixtext=" Temporal statistics of the minimum, maximum and average temperature in °C"/>
								</children>
							</paragraph>
							<newline/>
							<newline/>
							<paragraph paragraphtag="p">
								<styles font-family="Tahoma" font-size="14pt"/>
								<children>
									<text fixtext="Click "/>
									<link>
										<properties target="_blank"/>
										<children>
											<text fixtext="here"/>
										</children>
										<action>
											<none/>
										</action>
										<hyperlink>
											<fixtext value="http://www.altova.com/stylevision.html"/>
										</hyperlink>
									</link>
									<text fixtext=" to find further information on StyleVision including all feature highlights."/>
								</children>
							</paragraph>
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
