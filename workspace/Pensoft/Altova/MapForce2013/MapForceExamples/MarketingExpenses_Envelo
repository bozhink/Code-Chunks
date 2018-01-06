<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="UTF-8" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces>
			<nspair prefix="ds" uri="http://www.w3.org/2000/09/xmldsig#"/>
		</namespaces>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="MarketingExpensesSigned.xsd"/>
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
							<template subtype="element" match="marketing-expenses">
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
									<condition>
										<children>
											<conditionbranch xpath="count( expense-item ) &gt; 0">
												<children>
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
																					<text fixtext="Marketing Expense Report">
																						<styles font-size="20pt" font-weight="bold" margin-top="3pt"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<properties bgcolor="#D2FFFF" nowrap="set"/>
																				<children>
																					<text fixtext="Total:  ">
																						<styles font-family="Tahoma" font-size="10pt" font-weight="bold"/>
																					</text>
																					<autocalc xpath="sum( expense-item/expense  )" update="@total-sum">
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
																		<styles height="0.08in"/>
																		<children>
																			<tgridcell/>
																			<tgridcell/>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<children>
																					<tgrid>
																						<properties border="1" width="100%"/>
																						<styles border-collapse="collapse" border-style="none"/>
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
																												<styles border-style="none"/>
																												<children>
																													<condition>
																														<children>
																															<conditionbranch xpath="exists( ds:Signature )">
																																<children>
																																	<text fixtext="☒">
																																		<styles text-align="center"/>
																																	</text>
																																</children>
																															</conditionbranch>
																															<conditionbranch>
																																<children>
																																	<text fixtext="☐">
																																		<styles color="#b4b4b4" text-align="center"/>
																																	</text>
																																</children>
																															</conditionbranch>
																														</children>
																													</condition>
																													<text fixtext=" Reported data is authenticated by digital signature!">
																														<styles _xcolor="if ( exists( ds:Signature ) ) then &apos;#00c024&apos; else &apos;#b4b4b4&apos;" font-family="Verdana" font-style="italic" font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																										</children>
																									</tgridrow>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-style="none"/>
																												<children>
																													<condition>
																														<children>
																															<conditionbranch xpath="exists( ds:Signature )">
																																<children>
																																	<text fixtext="☐">
																																		<styles color="#b4b4b4" text-align="center"/>
																																	</text>
																																</children>
																															</conditionbranch>
																															<conditionbranch>
																																<children>
																																	<text fixtext="☒">
																																		<styles text-align="center"/>
																																	</text>
																																</children>
																															</conditionbranch>
																														</children>
																													</condition>
																													<text fixtext=" Reported data is not authenticated">
																														<styles _xcolor="if ( exists( ds:Signature ) ) then &apos;#b4b4b4&apos; else &apos;#ff4200&apos;" font-family="Verdana" font-style="italic" font-weight="bold"/>
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
																			<tgridcell>
																				<children>
																					<text fixtext=" "/>
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
											<conditionbranch>
												<children>
													<tgrid>
														<properties border="0" width="100%"/>
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
																				<properties align="left" valign="top"/>
																				<children>
																					<text fixtext="Marketing Expense Report">
																						<styles font-size="20pt" font-weight="bold" margin-top="3pt"/>
																					</text>
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
												</children>
											</conditionbranch>
										</children>
									</condition>
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
																								<styles width="auto"/>
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
																											<template subtype="element" match="FullName">
																												<children>
																													<content/>
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
																													<conditionbranch xpath="string-length( FullName ) &gt; 0">
																														<children>
																															<text fixtext="Name">
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
									<condition>
										<children>
											<conditionbranch xpath="count( expense-item ) &gt; 0">
												<children>
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
																	<tgridcol>
																		<styles width="auto"/>
																	</tgridcol>
																	<tgridcol>
																		<styles width="auto"/>
																	</tgridcol>
																	<tgridcol>
																		<styles width="auto"/>
																	</tgridcol>
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
																					<text fixtext="Date">
																						<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																					</text>
																					<text fixtext=" (">
																						<styles font-family="Arial" font-size="9pt" font-weight="bold"/>
																					</text>
																					<text fixtext="mm/dd/yyyy">
																						<styles font-family="Arial" font-size="9pt" font-style="italic" font-weight="bold"/>
																					</text>
																					<text fixtext=")">
																						<styles font-family="Arial" font-size="9pt" font-weight="bold"/>
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
																							<template subtype="element" match="type">
																								<children>
																									<content/>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<properties align="center"/>
																						<children>
																							<template subtype="element" match="Date">
																								<children>
																									<content>
																										<styles white-space="nowrap"/>
																										<format basic-type="xsd" string="MM/DD/YYYY" datatype="date"/>
																									</content>
																									<text fixtext=" "/>
																									<button>
																										<action>
																											<datepicker/>
																										</action>
																									</button>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<properties align="right"/>
																						<children>
																							<template subtype="element" match="expense">
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
														<properties width="100%"/>
														<children>
															<tgridbody-cols>
																<children>
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
																				<styles text-align="left"/>
																				<children>
																					<chart>
																						<styles height="100px" width="400px"/>
																						<layer>
																							<dataset/>
																							<dataseries-xny-rows for-each="distinct-values(expense-item/( type ) )" x-value="concat( . , &apos; (&apos;, for $i in . return sum($XML//expense-item[( type )=$i]/expense), &apos;)&apos; )" auto-x-value="0">
																								<col y-value="for $i in . return sum($XML//expense-item[( type )=$i]/expense)" y-name="&quot;Series 1&quot;"/>
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
																							<conditionbranch xpath="expense-item/type = &apos;Parking&apos;">
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
																																	<autocalc xpath="sum(expense-item[type=&apos;Parking&apos;]/expense)">
																																		<styles font-family="Verdana"/>
																																		<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																																	</autocalc>
																																	<text fixtext=" "/>
																																	<text fixtext="$">
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
																							<conditionbranch xpath="expense-item/type = &apos;Meal&apos;">
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
																																	<autocalc xpath="sum(expense-item[type=&apos;Meal&apos;]/expense)">
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
																							<conditionbranch xpath="expense-item/type = &apos;Travel&apos;">
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
																																	<autocalc xpath="sum(expense-item[type=&apos;Travel&apos;]/expense)">
																																		<styles font-family="Verdana"/>
																																		<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																																	</autocalc>
																																	<text fixtext=" "/>
																																	<text fixtext="$">
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
																							<conditionbranch xpath="expense-item/type = &apos;Lodging&apos;">
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
																																	<autocalc xpath="sum(expense-item[type=&apos;Lodging&apos;]/expense)">
																																		<styles font-family="Verdana"/>
																																		<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																																	</autocalc>
																																	<text fixtext=" "/>
																																	<text fixtext="$">
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
																							<conditionbranch xpath="expense-item/type = &apos;Entertainment&apos;">
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
																																	<autocalc xpath="sum(expense-item[type=&apos;Entertainment&apos;]/expense)">
																																		<styles font-family="Verdana"/>
																																		<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																																	</autocalc>
																																	<text fixtext=" "/>
																																	<text fixtext="$">
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
																							<conditionbranch xpath="expense-item/type = &apos;Misc&apos;">
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
																																	<autocalc xpath="sum(expense-item[type=&apos;Misc&apos;]/expense)">
																																		<styles font-family="Verdana"/>
																																		<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																																	</autocalc>
																																	<text fixtext=" "/>
																																	<text fixtext="$">
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
																					<autocalc xpath="sum( expense-item/expense  )" update="@total-sum">
																						<styles font-family="Verdana" font-size="medium"/>
																						<format basic-type="xsd" string="###,##0.00" datatype="decimal"/>
																					</autocalc>
																					<text fixtext=" "/>
																					<text fixtext="$">
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
												</children>
											</conditionbranch>
										</children>
									</condition>
									<newline/>
									<tgrid>
										<properties border="0" width="100%"/>
										<styles table-layout="fixed"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<properties width="15%"/>
													</tgridcol>
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
																<properties align="left"/>
																<children>
																	<text fixtext="This expense report has exceeded ">
																		<styles font-size="10pt"/>
																	</text>
																	<text fixtext="100">
																		<styles font-size="10pt" font-weight="bold"/>
																	</text>
																	<text fixtext="$ which under corporate policy requires approval of your direct superior.  All forms must be presented in triplicate and be submitted to the human resources department server in its current XML form.">
																		<styles font-size="10pt"/>
																	</text>
																</children>
															</tgridcell>
															<tgridcell joinleft="1">
																<properties align="left"/>
															</tgridcell>
														</children>
													</tgridrow>
													<tgridrow>
														<styles height="101px"/>
														<children>
															<tgridcell>
																<properties valign="bottom"/>
																<styles border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
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
																							<tgridcell/>
																						</children>
																					</tgridrow>
																					<tgridrow>
																						<children>
																							<tgridcell>
																								<children>
																									<text fixtext="Date"/>
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
																<properties valign="bottom"/>
																<styles border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
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
																							<tgridcell/>
																						</children>
																					</tgridrow>
																					<tgridrow>
																						<children>
																							<tgridcell>
																								<children>
																									<text fixtext="Signature"/>
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
