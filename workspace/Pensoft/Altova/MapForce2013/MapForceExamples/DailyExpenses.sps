<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="UTF-8" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="DailyExpenses.xsd"/>
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
						<properties columncount="1" columngap="0.50in" headerfooterheight="variable" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="1" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.0in" papermarginheader="0.0in" papermarginleft="0.6in" papermarginright="0.6in" papermargintop="0.79in" paperwidth="8.5in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<template subtype="element" match="daily-expenses">
								<children>
									<newline/>
									<tgrid>
										<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
										<styles border-collapse="collapse"/>
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
																<styles border-bottom-color="#0588BA" border-bottom-style="solid" border-bottom-width="medium"/>
																<children>
																	<image>
																		<properties border="0"/>
																		<styles height="76px" width="153px"/>
																		<target>
																			<fixtext value="http://www.nanonull.com/nanonull.gif"/>
																		</target>
																	</image>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<tgrid>
										<properties border="0" cellspacing="0" width="100%"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<properties width="85%"/>
													</tgridcol>
													<tgridcol>
														<properties width="15%"/>
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
																	<text fixtext="Daily Expense Report">
																		<styles font-size="20pt" font-weight="bold" margin-top="3pt"/>
																	</text>
																</children>
															</tgridcell>
															<tgridcell>
																<properties bgcolor="#D2FFFF"/>
																<children>
																	<text fixtext="Total:  ">
																		<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																	</text>
																	<autocalc xpath="sum( expense-item/@expense  )" update="@total-sum">
																		<styles font-family="Tahoma" font-size="10pt"/>
																		<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																	</autocalc>
																	<text fixtext=" $">
																		<styles font-family="Tahoma" font-size="10pt"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
													<tgridrow>
														<children>
															<tgridcell/>
															<tgridcell>
																<properties bgcolor="#D2FFFF"/>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<tgrid>
										<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
										<styles border-collapse="collapse" table-layout="fixed"/>
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
																<properties bgcolor="#D2FFFF"/>
																<styles border-bottom-color="black" border-bottom-style="solid" border-bottom-width="1pt"/>
																<children>
																	<text fixtext="Employee Information">
																		<styles font-family="Verdana" font-size="14pt"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<template subtype="element" match="Person">
										<children>
											<tgrid>
												<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
												<styles border-collapse="collapse"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<properties width="2%"/>
															</tgridcol>
															<tgridcol>
																<properties width="48%"/>
															</tgridcol>
															<tgridcol>
																<properties width="48%"/>
															</tgridcol>
															<tgridcol>
																<properties width="2%"/>
															</tgridcol>
														</children>
													</tgridbody-cols>
													<tgridbody-rows>
														<children>
															<tgridrow>
																<children>
																	<tgridcell/>
																	<tgridcell>
																		<children>
																			<tgrid>
																				<properties border="0" width="100%"/>
																				<children>
																					<tgridbody-cols>
																						<children>
																							<tgridcol>
																								<properties width="50%"/>
																							</tgridcol>
																							<tgridcol>
																								<properties width="50%"/>
																							</tgridcol>
																						</children>
																					</tgridbody-cols>
																					<tgridbody-rows>
																						<children>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties bgcolor="#F3F3F3"/>
																										<styles border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<template subtype="element" match="First">
																												<children>
																													<content>
																														<format basic-type="xsd" datatype="string"/>
																													</content>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<properties bgcolor="#F3F3F3"/>
																										<styles border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<template subtype="element" match="Last">
																												<children>
																													<content>
																														<format basic-type="xsd" datatype="string"/>
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
																										<children>
																											<condition>
																												<children>
																													<conditionbranch xpath="string-length( First ) &gt; 0">
																														<children>
																															<text fixtext="First Name">
																																<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																															</text>
																														</children>
																													</conditionbranch>
																													<conditionbranch>
																														<children>
																															<text fixtext="First Name is required">
																																<styles color="#FF0000" font-family="Arial" font-size="10pt" font-weight="bold"/>
																															</text>
																														</children>
																													</conditionbranch>
																												</children>
																											</condition>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<condition>
																												<children>
																													<conditionbranch xpath="string-length( Last ) &gt; 0">
																														<children>
																															<text fixtext="Last Name">
																																<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																															</text>
																														</children>
																													</conditionbranch>
																													<conditionbranch>
																														<children>
																															<text fixtext="Last Name is required">
																																<styles color="#FF0000" font-family="Arial" font-size="10pt" font-weight="bold"/>
																															</text>
																														</children>
																													</conditionbranch>
																												</children>
																											</condition>
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
																										<properties bgcolor="#F3F3F3"/>
																										<styles border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<template subtype="element" match="Title">
																												<children>
																													<content>
																														<format basic-type="xsd" datatype="string"/>
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
																										<children>
																											<text fixtext="Title">
																												<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																											</text>
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
																	<tgridcell/>
																</children>
															</tgridrow>
															<tgridrow>
																<children>
																	<tgridcell/>
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
																										<properties bgcolor="#F3F3F3"/>
																										<styles border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<template subtype="element" match="Email">
																												<children>
																													<content>
																														<format basic-type="xsd" datatype="string"/>
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
																										<children>
																											<condition>
																												<children>
																													<conditionbranch xpath="string-length( Email ) &gt; 0">
																														<children>
																															<text fixtext="E-Mail">
																																<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																															</text>
																														</children>
																													</conditionbranch>
																													<conditionbranch>
																														<children>
																															<text fixtext="E-Mail is required">
																																<styles color="#FF0000" font-family="Arial" font-size="10pt" font-weight="bold"/>
																															</text>
																														</children>
																													</conditionbranch>
																												</children>
																											</condition>
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
																										<properties bgcolor="#F3F3F3"/>
																										<styles border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<template subtype="element" match="Phone">
																												<children>
																													<content>
																														<format basic-type="xsd" datatype="string"/>
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
																										<children>
																											<text fixtext="Phone">
																												<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																											</text>
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
																	<tgridcell/>
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
									<tgrid>
										<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
										<styles border-collapse="collapse" table-layout="fixed"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol/>
												</children>
											</tgridbody-cols>
											<tgridbody-rows>
												<children>
													<tgridrow>
														<styles height="24px"/>
														<children>
															<tgridcell>
																<properties bgcolor="#D2FFFF"/>
																<styles border-bottom-color="black" border-bottom-style="solid" border-bottom-width="1pt"/>
																<children>
																	<text fixtext="Expense List">
																		<styles font-family="Verdana" font-size="14pt"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<tgrid>
										<properties border="0" width="100%"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol/>
													<tgridcol/>
													<tgridcol/>
												</children>
											</tgridbody-cols>
											<tgridheader-rows>
												<children>
													<tgridrow>
														<properties bgcolor="#C0C0C0"/>
														<children>
															<tgridcell>
																<properties align="left"/>
																<children>
																	<text fixtext="Type">
																		<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																	</text>
																</children>
															</tgridcell>
															<tgridcell>
																<properties align="left"/>
																<children>
																	<text fixtext="Expense To">
																		<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																	</text>
																</children>
															</tgridcell>
															<tgridcell>
																<properties align="left"/>
																<children>
																	<text fixtext="Expense">
																		<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridheader-rows>
											<tgridbody-rows>
												<children>
													<template subtype="element" match="expense-item">
														<children>
															<tgridrow>
																<properties bgcolor="#E0E0E0"/>
																<children>
																	<tgridcell>
																		<children>
																			<template subtype="attribute" match="type">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<children>
																			<template subtype="attribute" match="expto">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<properties align="right"/>
																		<children>
																			<template subtype="attribute" match="expense">
																				<children>
																					<content>
																						<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																					</content>
																				</children>
																				<variables/>
																			</template>
																			<text fixtext=" "/>
																			<text fixtext="$">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
														<variables/>
													</template>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<newline/>
									<tgrid>
										<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
										<styles border-collapse="collapse" table-layout="fixed"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol/>
												</children>
											</tgridbody-cols>
											<tgridbody-rows>
												<children>
													<tgridrow>
														<styles height="24px"/>
														<children>
															<tgridcell>
																<properties bgcolor="#D2FFFF"/>
																<styles border-bottom-color="black" border-bottom-style="solid" border-bottom-width="1pt"/>
																<children>
																	<text fixtext="Expense Split">
																		<styles font-family="Verdana" font-size="14pt"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<tgrid>
										<properties border="0" cellpadding="2pt" cellspacing="0" width="100%"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<styles width="1.50in"/>
													</tgridcol>
													<tgridcol>
														<styles width="6in"/>
													</tgridcol>
												</children>
											</tgridbody-cols>
											<tgridbody-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<children>
																	<text fixtext="by Type:"/>
																</children>
															</tgridcell>
															<tgridcell>
																<styles text-align="left"/>
																<children>
																	<chart>
																		<styles height="100px" width="400px"/>
																		<layer>
																			<dataset/>
																			<dataseries-xny-rows for-each="distinct-values(expense-item/( @type ) )" x-value="concat( . , &apos; (&apos;, for $i in . return sum($XML//expense-item[( @type )=$i]/@expense), &apos;)&apos; )" auto-x-value="0">
																				<col y-value="for $i in . return sum($XML//expense-item[( @type )=$i]/@expense)" y-name="&quot;Series 1&quot;"/>
																			</dataseries-xny-rows>
																			<wizard-data remove-empty-cat="1" remove-empty-ser="1">
																				<wizard-data-categories/>
																				<wizard-data-series/>
																			</wizard-data>
																			<chartsettings>
																				<General SettingsVersion="2" ChartKind="Pie" ShowLegend="0"/>
																				<Pie StartAngle="270."/>
																			</chartsettings>
																			<chartsettings-xpath>
																				<main-properties/>
																				<color-properties/>
																				<colorrange-properties/>
																			</chartsettings-xpath>
																		</layer>
																	</chart>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
													<tgridrow>
														<children>
															<tgridcell>
																<children>
																	<text fixtext="by Department:"/>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<chart>
																		<styles height="100px" width="400px"/>
																		<layer>
																			<dataset/>
																			<dataseries-xny-rows for-each="distinct-values(expense-item/( @expto ) )" x-value="concat( . , &apos; (&apos;, for $i in . return sum($XML//expense-item[( @expto )=$i]/@expense), &apos;)&apos; )" auto-x-value="0">
																				<col y-value="for $i in . return sum($XML//expense-item[( @expto )=$i]/@expense)" y-name="&quot;Series 1&quot;"/>
																			</dataseries-xny-rows>
																			<wizard-data remove-empty-cat="1" remove-empty-ser="1">
																				<wizard-data-categories/>
																				<wizard-data-series/>
																			</wizard-data>
																			<chartsettings>
																				<General SettingsVersion="2" ChartKind="Pie" ShowLegend="0"/>
																				<Pie StartAngle="270."/>
																			</chartsettings>
																			<chartsettings-xpath>
																				<main-properties/>
																				<color-properties/>
																				<colorrange-properties/>
																			</chartsettings-xpath>
																		</layer>
																	</chart>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<newline/>
									<tgrid>
										<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
										<styles border-collapse="collapse" table-layout="fixed"/>
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
																<properties bgcolor="#D2FFFF"/>
																<styles border-bottom-color="black" border-bottom-style="solid" border-bottom-width="1pt"/>
																<children>
																	<text fixtext="Expense Summary">
																		<styles font-family="Verdana" font-size="14pt"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<tgrid>
										<properties border="0" width="100%"/>
										<styles table-layout="fixed"/>
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
																<styles border-color="black" border-style="solid" border-width="1pt"/>
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@type = &apos;Parking&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt"/>
																												<children>
																													<text fixtext="Total Parking Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@type=&apos;Parking&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@type = &apos;Meal&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Meal Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@type=&apos;Meal&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@type = &apos;Travel&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Travel Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@type=&apos;Travel&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@type = &apos;Lodging&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Lodging Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@type=&apos;Lodging&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@type = &apos;Entertainment&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Entertainment Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@type=&apos;Entertainment&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@type = &apos;Misc&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Miscellaneous Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@type=&apos;Misc&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<tgrid>
										<properties border="0" width="100%"/>
										<styles table-layout="fixed"/>
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
																<styles border-color="black" border-style="solid" border-width="1pt" white-space="nowrap"/>
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@expto = &apos;Marketing&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Marketing Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@expto=&apos;Marketing&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@expto = &apos;Development&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Development Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@expto=&apos;Development&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@expto = &apos;Accounting&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Accounting Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@expto=&apos;Accounting&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@expto = &apos;Sales&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Sales Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@expto=&apos;Sales&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@expto = &apos;Operations&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Operations Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@expto=&apos;Operations&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@expto = &apos;Support&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Support Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@expto=&apos;Support&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles white-space="nowrap"/>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="expense-item/@expto = &apos;IT&apos;">
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="47%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="52%"/>
																									</tgridcol>
																									<tgridcol>
																										<properties width="1%"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<text fixtext="Total Information Technology Expenses">
																														<styles font-family="Verdana"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties align="right"/>
																												<styles border-bottom-color="silver" border-bottom-style="solid" border-bottom-width="1pt" white-space="nowrap"/>
																												<children>
																													<autocalc xpath="sum(expense-item[@expto=&apos;IT&apos;]/@expense)">
																														<styles font-family="Verdana"/>
																														<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																													</autocalc>
																													<text fixtext=" $">
																														<styles font-family="Verdana" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																											<tgridcell/>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<tgrid>
										<properties border="0" width="100%"/>
										<styles table-layout="fixed"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<properties width="50%"/>
													</tgridcol>
													<tgridcol>
														<properties width="50%"/>
													</tgridcol>
												</children>
											</tgridbody-cols>
											<tgridbody-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<children>
																	<text fixtext="TOTAL EXPENSES">
																		<styles font-family="Verdana" font-size="medium"/>
																	</text>
																</children>
															</tgridcell>
															<tgridcell>
																<properties align="right"/>
																<children>
																	<autocalc xpath="sum( expense-item/@expense  )" update="@total-sum">
																		<styles font-family="Verdana" font-size="medium"/>
																		<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																	</autocalc>
																	<text fixtext=" $">
																		<styles font-family="Verdana" font-weight="bold"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<newline/>
								</children>
								<variables/>
							</template>
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
