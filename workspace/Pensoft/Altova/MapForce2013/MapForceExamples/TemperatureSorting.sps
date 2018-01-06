<?xml version="1.0" encoding="UTF-8"?>
<structure version="15" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
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
		<mainparts/>
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
									<link>
										<children>
											<text fixtext="Figure 1"/>
										</children>
										<action>
											<none/>
										</action>
										<hyperlink>
											<fixtext value="#Figure_Two"/>
										</hyperlink>
									</link>
									<text fixtext=" contains a list of the warmest temperatures throughout the last years. Tables in StyleVision are highly customizable."/>
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
													<tgridcol>
														<styles width="150px"/>
													</tgridcol>
													<tgridcol>
														<styles width="228px"/>
													</tgridcol>
													<tgridcol/>
												</children>
											</tgridbody-cols>
											<tgridheader-rows>
												<children>
													<tgridrow>
														<styles background-color="#ffa0a0"/>
														<children>
															<tgridcell>
																<children>
																	<text fixtext="Rank"/>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="Temperature (°C)"/>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="Month"/>
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
																		<styles background-color="#ffe9e9"/>
																		<children>
																			<tgridcell>
																				<styles text-align="center"/>
																				<children>
																					<template subtype="uservariable" match="$rank">
																						<children>
																							<content>
																								<styles font-style="italic"/>
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
																		</children>
																	</tgridrow>
																</children>
																<variables>
																	<variable name="rank" value="position()" valuetype="&lt;auto&gt;"/>
																</variables>
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
											<text fixtext="Figure 1:"/>
										</children>
										<action>
											<none/>
										</action>
										<bookmark>
											<fixtext value="Figure_Two"/>
										</bookmark>
									</bookmark>
									<text fixtext=" Ranking of the warmest temperature in °C"/>
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
