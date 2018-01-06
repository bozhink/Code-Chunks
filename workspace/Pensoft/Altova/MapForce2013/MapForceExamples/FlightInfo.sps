<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="UTF-8" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="FlightInformation.xsd"/>
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
				<styles background-color="#f0f0f0"/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="variable" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="1" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.0in" papermarginheader="0.0in" papermarginleft="0.6in" papermarginright="0.6in" papermargintop="0.79in" paperwidth="8.5in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<template subtype="element" match="FlightInformation">
								<children>
									<tgrid>
										<properties border="0" cellspacing="0" width="100%"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<properties width="85%"/>
													</tgridcol>
												</children>
											</tgridbody-cols>
											<tgridbody-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<properties align="left" valign="top"/>
																<children>
																	<text fixtext="Flight Information Response (FLIRES)">
																		<styles font-size="20pt" font-weight="bold" margin-top="3pt"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<template subtype="element" match="FlightInfo">
										<children>
											<line/>
											<tgrid>
												<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
												<styles border-collapse="collapse" table-layout="fixed"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<styles width="100%"/>
															</tgridcol>
														</children>
													</tgridbody-cols>
													<tgridbody-rows>
														<children>
															<tgridrow>
																<children>
																	<tgridcell>
																		<properties bgcolor="#D2FFFF"/>
																		<styles background-color="white"/>
																		<children>
																			<text fixtext="Flight  ">
																				<styles font-family="Verdana" font-size="14pt"/>
																			</text>
																			<template subtype="attribute" match="flightname">
																				<children>
																					<content>
																						<styles font-family="Verdana" font-size="14pt" font-style="italic" font-weight="bold"/>
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
																	<tgridcell/>
																</children>
															</tgridrow>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
											<tgrid>
												<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
												<styles border-collapse="collapse"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<properties width="45%"/>
															</tgridcol>
															<tgridcol>
																<properties width="45%"/>
															</tgridcol>
															<tgridcol>
																<properties width="10%"/>
															</tgridcol>
														</children>
													</tgridbody-cols>
													<tgridbody-rows>
														<children>
															<tgridrow>
																<children>
																	<tgridcell>
																		<children>
																			<tgrid>
																				<properties border="0" width="100%"/>
																				<children>
																					<tgridbody-cols>
																						<children>
																							<tgridcol>
																								<properties width="50%"/>
																								<styles width="auto"/>
																							</tgridcol>
																						</children>
																					</tgridbody-cols>
																					<tgridbody-rows>
																						<children>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Departure">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties bgcolor="#F3F3F3"/>
																										<styles background-color="white" border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<text fixtext=" "/>
																											<template subtype="userdefined" match="format-dateTime(@departuredatetime, &apos;[Y]-[M,2]-[D,2] [H,2]:[m,2]&apos;)">
																												<children>
																													<content>
																														<format basic-type="xsd" datatype="dateTime"/>
																													</content>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																						</children>
																					</tgridbody-rows>
																				</children>
																			</tgrid>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<children>
																			<tgrid>
																				<properties border="0" width="100%"/>
																				<children>
																					<tgridbody-cols>
																						<children>
																							<tgridcol/>
																						</children>
																					</tgridbody-cols>
																					<tgridbody-rows>
																						<children>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Arrival">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties bgcolor="#F3F3F3"/>
																										<styles background-color="white" border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<text fixtext=" "/>
																											<template subtype="userdefined" match="format-dateTime(@arrivaldatetime, &apos;[Y]-[M,2]-[D,2] [H,2]:[m,2]&apos;)">
																												<children>
																													<content>
																														<format basic-type="xsd" datatype="dateTime"/>
																													</content>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																						</children>
																					</tgridbody-rows>
																				</children>
																			</tgrid>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<children>
																			<tgrid>
																				<properties border="0" width="100%"/>
																				<children>
																					<tgridbody-cols>
																						<children>
																							<tgridcol/>
																						</children>
																					</tgridbody-cols>
																					<tgridbody-rows>
																						<children>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Day(s)">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties bgcolor="#F3F3F3"/>
																										<styles background-color="white" border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<template subtype="attribute" match="daysofoperation">
																												<children>
																													<content>
																														<format basic-type="xsd" datatype="integer"/>
																													</content>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																						</children>
																					</tgridbody-rows>
																				</children>
																			</tgrid>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
											<template subtype="element" match="Station">
												<children>
													<tgrid>
														<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
														<styles border-collapse="collapse"/>
														<children>
															<tgridbody-cols>
																<children>
																	<tgridcol>
																		<properties width="100%"/>
																	</tgridcol>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<children>
																					<tgrid>
																						<properties border="0" width="85%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="5%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="20%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="10%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="65%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell/>
																											<tgridcell>
																												<properties bgcolor="#F3F3F3"/>
																												<styles background-color="#f0f0f0" font-weight="bold" text-align="right"/>
																												<children>
																													<template subtype="userdefined" match="if ( $cnt = 1 ) then &apos;Start:&apos; else if ( $cnt = $maxcnt ) then &apos;Destination:&apos; else &apos;Via:&apos;">
																														<children>
																															<content/>
																														</children>
																														<variables/>
																													</template>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties bgcolor="#F3F3F3"/>
																												<styles background-color="white" border-color="#D3D3D3" border-style="solid" border-width="1pt" font-weight="bold" text-align="center"/>
																												<children>
																													<template subtype="attribute" match="airportcode">
																														<children>
																															<content>
																																<format basic-type="xsd" datatype="dateTime"/>
																															</content>
																														</children>
																														<variables/>
																													</template>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles background-color="white" border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																												<children>
																													<text fixtext="  "/>
																													<image>
																														<properties height="11px" width="16px"/>
																														<target>
																															<xpath value="if ( @airportcode = &apos;VIE&apos; ) then &apos;at.gif&apos; else 
if ( @airportcode = &quot;JFK&quot; or @airportcode = &quot;BOS&quot; ) then &apos;us.gif&apos; else
if ( @airportcode = &quot;YVR&quot; or @airportcode = &quot;YYZ&quot; ) then &apos;ca.gif&apos; else
if ( @airportcode = &apos;MUC&apos; ) then &apos;de.gif&apos; else 
if ( @airportcode = &apos;HND&apos; ) then &apos;jp.gif&apos; else
if ( @airportcode = &apos;PEK&apos; ) then &apos;cn.gif&apos; else &apos;&apos;"/>
																														</target>
																													</image>
																													<text fixtext="  "/>
																													<template subtype="attribute" match="name">
																														<children>
																															<content>
																																<format basic-type="xsd" datatype="dateTime"/>
																															</content>
																														</children>
																														<variables/>
																													</template>
																												</children>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
												</children>
												<variables>
													<variable name="cnt" value="position()" valuetype="&lt;auto&gt;"/>
												</variables>
											</template>
										</children>
										<variables>
											<variable name="maxcnt" value="count(Station)" valuetype="&lt;auto&gt;"/>
										</variables>
									</template>
								</children>
								<variables/>
							</template>
							<line/>
						</children>
						<variables>
							<variable name="ShowExpenseSplit" value="true()" valuetype="xs:boolean" editable="1"/>
							<variable name="ExpenseSplitBy" value="&apos;type&apos;" valuetype="xs:string" editable="1"/>
						</variables>
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
