<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="Temperatures.xsd"/>
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
							<newline/>
							<chart chart-data-flexible="1">
								<styles border-style="solid" border-width="thin" height="600px" width="600px"/>
								<layer>
									<dataset>
										<dataseries for-each="." series-name="&apos;Temperature (°C)&apos;" x-value="Temperatures/data/@month" y-value="Temperatures/data/@temp"/>
									</dataset>
									<dataseries-xny-rows for-each="*"/>
									<wizard-data remove-empty-cat="1" remove-empty-ser="1">
										<wizard-data-categories/>
										<wizard-data-series/>
									</wizard-data>
									<chartsettings>
										<General SettingsVersion="2" ChartKind="LineChart" BKFileMode="ZoomToFit" PlotBKFile="chartbackground.bmp" Title="Temperature" ShowLegend="0">
											<TitleFont Size="6.%"/>
											<AxisLabelFont Size="4.5%"/>
										</General>
										<Line ConnectionShapeSize="5.px"/>
										<Colors Style="User" Colors="#04b508" Colors1="#000000" Colors2="#0879b5" Colors3="#dc7708" Colors4="#dc143c" Colors5="#ffd700" Colors6="#4410a3" Colors7="#878369" Colors8="#b71b68" Colors9="#a25d2d" Colors10="#0028ff" Colors11="#bfbfbf" Colors12="#237518" Colors13="#52aca0" Colors14="#d3c15d" Colors15="#8971d8"/>
										<XY>
											<XAxis AxisLabel="Month (YYYY-MM)" AxisGridColor="#000000"/>
											<YAxis/>
										</XY>
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
												</children>
											</tgridbody-cols>
											<tgridheader-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<children>
																	<text fixtext="Month"/>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="Temperature"/>
																	<newline/>
																	<text fixtext="(°C)"/>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="Classification"/>
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
															<template subtype="element" match="data">
																<children>
																	<tgridrow>
																		<properties _xbgcolor="if ( @desc = &apos;high&apos; ) then &apos;#ffa0a0&apos; else if ( @desc = &apos;low&apos; ) then &apos;#57c0ff&apos; else &apos;#ffffff&apos;"/>
																		<children>
																			<tgridcell>
																				<styles text-align="center"/>
																				<children>
																					<template subtype="attribute" match="month">
																						<children>
																							<content>
																								<format basic-type="xsd" datatype="gYearMonth"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles text-align="center"/>
																				<children>
																					<template subtype="attribute" match="temp">
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
																					<condition>
																						<children>
																							<conditionbranch xpath="@desc=&apos;high&apos;">
																								<children>
																									<text fixtext="HIGH"/>
																								</children>
																							</conditionbranch>
																							<conditionbranch xpath="@desc=&apos;low&apos;">
																								<children>
																									<text fixtext="LOW"/>
																								</children>
																							</conditionbranch>
																						</children>
																					</condition>
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
									<text fixtext=" Temporal statistics of the temperature in °C"/>
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
