<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="UTF-8" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="mf-ExpRep-Target.xsd" workingxmlfile="mf-ExpReport-co.xml"/>
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
							<template subtype="element" match="expense-report">
								<children>
									<tgrid>
										<properties border="0" width="575"/>
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
																	<tgrid>
																		<properties border="0" width="575"/>
																		<children>
																			<tgridbody-cols>
																				<children>
																					<tgridcol/>
																					<tgridcol/>
																					<tgridcol>
																						<styles width="44px"/>
																					</tgridcol>
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
																										<target>
																											<fixtext value="nanonull.bmp"/>
																										</target>
																									</image>
																								</children>
																							</tgridcell>
																							<tgridcell joinleft="1"/>
																							<tgridcell joinleft="1"/>
																						</children>
																					</tgridrow>
																					<tgridrow>
																						<children>
																							<tgridcell>
																								<properties align="left"/>
																								<children>
																									<text fixtext="Personal Expense Report">
																										<styles font-size="x-large" font-weight="bold"/>
																									</text>
																								</children>
																							</tgridcell>
																							<tgridcell>
																								<properties bgcolor="#D2FFFF" valign="bottom"/>
																								<children>
																									<text fixtext="Currency:  ">
																										<styles font-family="Tahoma" font-size="x-small" font-weight="bold"/>
																									</text>
																									<template subtype="attribute" match="currency">
																										<children>
																											<radiobutton checkedvalue="USD">
																												<styles font-family="Tahoma" font-size="x-small"/>
																												<children>
																													<content/>
																												</children>
																											</radiobutton>
																											<text fixtext="Dollars">
																												<styles font-family="Tahoma" font-size="x-small"/>
																											</text>
																										</children>
																										<variables/>
																									</template>
																									<text fixtext=" ">
																										<styles font-family="Tahoma" font-size="x-small"/>
																									</text>
																									<template subtype="attribute" match="currency">
																										<children>
																											<radiobutton checkedvalue="Euro">
																												<styles font-family="Tahoma" font-size="x-small"/>
																												<children>
																													<content/>
																												</children>
																											</radiobutton>
																											<text fixtext="Euros">
																												<styles font-family="Tahoma" font-size="x-small"/>
																											</text>
																										</children>
																										<variables/>
																									</template>
																									<text fixtext=" ">
																										<styles font-family="Tahoma" font-size="x-small"/>
																									</text>
																									<template subtype="attribute" match="currency">
																										<children>
																											<radiobutton checkedvalue="JPY">
																												<styles font-family="Tahoma" font-size="x-small"/>
																												<children>
																													<content/>
																												</children>
																											</radiobutton>
																											<text fixtext="Yen">
																												<styles font-family="Tahoma" font-size="x-small"/>
																											</text>
																										</children>
																										<variables/>
																									</template>
																								</children>
																							</tgridcell>
																							<tgridcell>
																								<properties align="center" bgcolor="#D2FFFF" valign="bottom"/>
																								<styles white-space="nowrap"/>
																								<children>
																									<text fixtext=" ">
																										<styles font-family="Tahoma" font-size="x-small" font-weight="bold"/>
																									</text>
																									<text fixtext=" Currency ">
																										<styles font-family="Tahoma" font-size="x-small" font-weight="bold"/>
																									</text>
																									<condition>
																										<children>
																											<conditionbranch xpath=" /expense-report/@currency  = &quot;USD&quot;">
																												<children>
																													<text fixtext="$">
																														<styles font-size="x-small"/>
																													</text>
																												</children>
																											</conditionbranch>
																											<conditionbranch xpath=" /expense-report/@currency  = &quot;Euro&quot;">
																												<children>
																													<text fixtext="€">
																														<styles font-size="x-small"/>
																													</text>
																												</children>
																											</conditionbranch>
																											<conditionbranch xpath=" /expense-report/@currency = &quot;JPY&quot;">
																												<children>
																													<text fixtext="¥">
																														<styles font-size="x-small"/>
																													</text>
																												</children>
																											</conditionbranch>
																										</children>
																									</condition>
																								</children>
																							</tgridcell>
																						</children>
																					</tgridrow>
																					<tgridrow>
																						<children>
																							<tgridcell joinabove="1"/>
																							<tgridcell>
																								<properties bgcolor="#D2FFFF" valign="bottom"/>
																								<children>
																									<template subtype="attribute" match="detailed">
																										<children>
																											<checkbox checkedvalue="true" checkedvalue1="1">
																												<children>
																													<content/>
																												</children>
																											</checkbox>
																										</children>
																										<variables/>
																									</template>
																									<text fixtext="Detailed report">
																										<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																									</text>
																								</children>
																							</tgridcell>
																							<tgridcell joinleft="1"/>
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
																				</children>
																			</tgridbody-cols>
																			<tgridbody-rows>
																				<children>
																					<tgridrow>
																						<children>
																							<tgridcell>
																								<children>
																									<template subtype="element" match="Person">
																										<editorproperties autoaddname="1" editable="1" adding="all" markupmode="hide"/>
																										<children>
																											<newline/>
																											<tgrid>
																												<properties border="0" width="575"/>
																												<children>
																													<tgridbody-cols>
																														<children>
																															<tgridcol>
																																<styles width="66px"/>
																															</tgridcol>
																															<tgridcol/>
																															<tgridcol/>
																														</children>
																													</tgridbody-cols>
																													<tgridbody-rows>
																														<children>
																															<tgridrow>
																																<properties bgcolor="#D2FFFF"/>
																																<children>
																																	<tgridcell>
																																		<properties align="left"/>
																																		<styles border-bottom-color="black" border-bottom-style="solid" border-bottom-width="1pt"/>
																																		<children>
																																			<text fixtext="Employee Information">
																																				<styles font-family="Verdana" font-size="medium"/>
																																			</text>
																																		</children>
																																	</tgridcell>
																																	<tgridcell joinleft="1"/>
																																	<tgridcell joinleft="1"/>
																																</children>
																															</tgridrow>
																															<tgridrow>
																																<styles height="61px"/>
																																<children>
																																	<tgridcell/>
																																	<tgridcell>
																																		<children>
																																			<tgrid>
																																				<properties border="0" width="250"/>
																																				<children>
																																					<tgridbody-cols>
																																						<children>
																																							<tgridcol>
																																								<styles width="133px"/>
																																							</tgridcol>
																																							<tgridcol>
																																								<styles width="200px"/>
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
																																													<content/>
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
																																													<conditionbranch xpath="string-length( First ) &gt; 0">
																																														<children>
																																															<text fixtext="First Name">
																																																<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																															</text>
																																														</children>
																																													</conditionbranch>
																																													<conditionbranch>
																																														<children>
																																															<text fixtext="First Name is required">
																																																<styles color="#FF0000" font-family="Arial" font-size="x-small" font-weight="bold"/>
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
																																																<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																															</text>
																																														</children>
																																													</conditionbranch>
																																													<conditionbranch>
																																														<children>
																																															<text fixtext="Last Name is required">
																																																<styles color="#FF0000" font-family="Arial" font-size="x-small" font-weight="bold"/>
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
																																		<properties valign="top"/>
																																		<children>
																																			<tgrid>
																																				<properties border="0" width="250"/>
																																				<children>
																																					<tgridbody-cols>
																																						<children>
																																							<tgridcol>
																																								<styles width="200px"/>
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
																																											<template subtype="element" match="Title">
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
																																											<text fixtext="Title">
																																												<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
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
																																</children>
																															</tgridrow>
																															<tgridrow>
																																<styles height="61px"/>
																																<children>
																																	<tgridcell joinabove="1"/>
																																	<tgridcell>
																																		<children>
																																			<tgrid>
																																				<properties border="0" width="250"/>
																																				<children>
																																					<tgridbody-cols>
																																						<children>
																																							<tgridcol>
																																								<styles width="200px"/>
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
																																											<template subtype="element" match="Email">
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
																																													<conditionbranch xpath="string-length( Email ) &gt; 0">
																																														<children>
																																															<text fixtext="E-Mail">
																																																<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																															</text>
																																														</children>
																																													</conditionbranch>
																																													<conditionbranch>
																																														<children>
																																															<text fixtext="E-Mail is required">
																																																<styles color="#FF0000" font-family="Arial" font-size="x-small" font-weight="bold"/>
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
																																				<properties border="0" width="250"/>
																																				<children>
																																					<tgridbody-cols>
																																						<children>
																																							<tgridcol>
																																								<styles width="200px"/>
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
																																											<template subtype="element" match="Phone">
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
																																											<text fixtext="Phone">
																																												<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
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
																																</children>
																															</tgridrow>
																														</children>
																													</tgridbody-rows>
																												</children>
																											</tgrid>
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
																									<tgrid>
																										<properties border="0" width="575"/>
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
																																	<text fixtext="Expense List">
																																		<styles font-family="Verdana" font-size="medium"/>
																																	</text>
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
																											<conditionbranch xpath="contains( @detailed  , &quot;true&quot;)">
																												<children>
																													<tgrid>
																														<properties border="0" width="100%"/>
																														<children>
																															<tgridbody-cols>
																																<children>
																																	<tgridcol>
																																		<styles width="110px"/>
																																	</tgridcol>
																																	<tgridcol>
																																		<styles width="122px"/>
																																	</tgridcol>
																																	<tgridcol>
																																		<styles width="130px"/>
																																	</tgridcol>
																																	<tgridcol>
																																		<styles width="150px"/>
																																	</tgridcol>
																																	<tgridcol>
																																		<styles width="205px"/>
																																	</tgridcol>
																																</children>
																															</tgridbody-cols>
																															<tgridheader-rows>
																																<children>
																																	<tgridrow>
																																		<properties bgcolor="#C0C0C0"/>
																																		<children>
																																			<tgridcell>
																																				<children>
																																					<text fixtext="Type">
																																						<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																					</text>
																																				</children>
																																			</tgridcell>
																																			<tgridcell>
																																				<children>
																																					<text fixtext="Expense To">
																																						<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																					</text>
																																				</children>
																																			</tgridcell>
																																			<tgridcell>
																																				<children>
																																					<text fixtext="Date ">
																																						<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																					</text>
																																					<text fixtext="(yyyy-mm-dd)">
																																						<styles font-size="x-small" font-style="italic" font-weight="bold"/>
																																					</text>
																																				</children>
																																			</tgridcell>
																																			<tgridcell>
																																				<children>
																																					<text fixtext="Expenses ">
																																						<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																					</text>
																																					<condition>
																																						<children>
																																							<conditionbranch xpath=" /expense-report/@currency  = &quot;USD&quot;">
																																								<children>
																																									<text fixtext="$">
																																										<styles font-family="Verdana" font-weight="bold"/>
																																									</text>
																																								</children>
																																							</conditionbranch>
																																							<conditionbranch xpath=" /expense-report/@currency  = &quot;Euro&quot;">
																																								<children>
																																									<text fixtext="€">
																																										<styles font-family="Verdana" font-weight="bold"/>
																																									</text>
																																								</children>
																																							</conditionbranch>
																																							<conditionbranch xpath=" /expense-report/@currency = &quot;JPY&quot;">
																																								<children>
																																									<text fixtext="¥">
																																										<styles font-family="Verdana" font-weight="bold"/>
																																									</text>
																																								</children>
																																							</conditionbranch>
																																						</children>
																																					</condition>
																																				</children>
																																			</tgridcell>
																																			<tgridcell>
																																				<children>
																																					<text fixtext="Description">
																																						<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
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
																																		<editorproperties autoaddname="1" editable="1" adding="all" markupmode="hide"/>
																																		<children>
																																			<tgridrow>
																																				<properties bgcolor="#E0E0E0"/>
																																				<styles height="29px"/>
																																				<children>
																																					<tgridcell>
																																						<children>
																																							<template subtype="attribute" match="type">
																																								<editorproperties autoaddname="1" editable="1" markupmode="hide"/>
																																								<children>
																																									<combobox>
																																										<editorproperties editable="1"/>
																																										<children>
																																											<content/>
																																										</children>
																																										<selectoption description="Meal" value="Meal"/>
																																										<selectoption description="Lodging" value="Lodging"/>
																																										<selectoption description="Travel" value="Travel"/>
																																										<selectoption description="Parking" value="Parking"/>
																																										<selectoption description="Entertainment" value="Entertainment"/>
																																										<selectoption description="Misc" value="Misc"/>
																																									</combobox>
																																								</children>
																																								<variables/>
																																							</template>
																																						</children>
																																					</tgridcell>
																																					<tgridcell>
																																						<children>
																																							<template subtype="attribute" match="expto">
																																								<editorproperties autoaddname="1" editable="1" markupmode="hide"/>
																																								<children>
																																									<combobox enumeration="1">
																																										<editorproperties editable="1"/>
																																										<children>
																																											<content/>
																																										</children>
																																									</combobox>
																																								</children>
																																								<variables/>
																																							</template>
																																						</children>
																																					</tgridcell>
																																					<tgridcell>
																																						<children>
																																							<template subtype="element" match="Date">
																																								<children>
																																									<content>
																																										<format basic-type="xsd" datatype="date"/>
																																									</content>
																																								</children>
																																								<variables/>
																																							</template>
																																						</children>
																																					</tgridcell>
																																					<tgridcell>
																																						<properties align="right"/>
																																						<styles white-space="nowrap"/>
																																						<children>
																																							<tgrid>
																																								<properties border="1" width="100%"/>
																																								<children>
																																									<tgridbody-cols>
																																										<children>
																																											<tgridcol/>
																																											<tgridcol/>
																																										</children>
																																									</tgridbody-cols>
																																									<tgridbody-rows>
																																										<children>
																																											<tgridrow>
																																												<children>
																																													<tgridcell>
																																														<children>
																																															<text fixtext="Travel">
																																																<styles font-weight="bold"/>
																																															</text>
																																														</children>
																																													</tgridcell>
																																													<tgridcell>
																																														<children>
																																															<text fixtext="Lodging">
																																																<styles font-weight="bold"/>
																																															</text>
																																														</children>
																																													</tgridcell>
																																												</children>
																																											</tgridrow>
																																											<tgridrow>
																																												<children>
																																													<tgridcell>
																																														<children>
																																															<template subtype="element" match="Travel">
																																																<children>
																																																	<template subtype="attribute" match="Trav-cost">
																																																		<children>
																																																			<content>
																																																				<format basic-type="xsd" datatype="decimal"/>
																																																			</content>
																																																		</children>
																																																		<variables/>
																																																	</template>
																																																</children>
																																																<variables/>
																																															</template>
																																														</children>
																																													</tgridcell>
																																													<tgridcell>
																																														<children>
																																															<template subtype="element" match="Lodging">
																																																<children>
																																																	<template subtype="attribute" match="Lodge-cost">
																																																		<children>
																																																			<content>
																																																				<format basic-type="xsd" datatype="decimal"/>
																																																			</content>
																																																		</children>
																																																		<variables/>
																																																	</template>
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
																																							<template subtype="element" match="description">
																																								<children>
																																									<paragraph>
																																										<children>
																																											<content/>
																																										</children>
																																									</paragraph>
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
																															</tgridbody-rows>
																														</children>
																													</tgrid>
																												</children>
																											</conditionbranch>
																											<conditionbranch>
																												<children>
																													<tgrid>
																														<properties border="0" width="575"/>
																														<children>
																															<tgridbody-cols>
																																<children>
																																	<tgridcol>
																																		<styles width="178px"/>
																																	</tgridcol>
																																	<tgridcol>
																																		<styles width="122px"/>
																																	</tgridcol>
																																	<tgridcol>
																																		<styles width="130px"/>
																																	</tgridcol>
																																	<tgridcol>
																																		<styles width="150px"/>
																																	</tgridcol>
																																</children>
																															</tgridbody-cols>
																															<tgridheader-rows>
																																<children>
																																	<tgridrow>
																																		<properties bgcolor="#C0C0C0"/>
																																		<children>
																																			<tgridcell>
																																				<children>
																																					<text fixtext="Type">
																																						<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																					</text>
																																				</children>
																																			</tgridcell>
																																			<tgridcell>
																																				<children>
																																					<text fixtext="Expense To">
																																						<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																					</text>
																																				</children>
																																			</tgridcell>
																																			<tgridcell>
																																				<children>
																																					<text fixtext="Date">
																																						<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																					</text>
																																					<text fixtext=" ">
																																						<styles font-size="x-small" font-weight="bold"/>
																																					</text>
																																					<text fixtext="(yyyy-mm-dd)">
																																						<styles font-size="x-small" font-style="italic" font-weight="bold"/>
																																					</text>
																																				</children>
																																			</tgridcell>
																																			<tgridcell>
																																				<children>
																																					<text fixtext="Expense ">
																																						<styles font-family="Arial" font-size="x-small" font-weight="bold"/>
																																					</text>
																																					<condition>
																																						<children>
																																							<conditionbranch xpath=" /expense-report/@currency  = &quot;USD&quot;">
																																								<children>
																																									<text fixtext="$">
																																										<styles font-family="Verdana" font-weight="bold"/>
																																									</text>
																																								</children>
																																							</conditionbranch>
																																							<conditionbranch xpath=" /expense-report/@currency  = &quot;UKP&quot;">
																																								<children>
																																									<text fixtext="£">
																																										<styles font-family="Verdana" font-weight="bold"/>
																																									</text>
																																								</children>
																																							</conditionbranch>
																																							<conditionbranch xpath=" /expense-report/@currency  = &quot;Euro&quot;">
																																								<children>
																																									<text fixtext="€">
																																										<styles font-family="Verdana" font-weight="bold"/>
																																									</text>
																																								</children>
																																							</conditionbranch>
																																							<conditionbranch xpath=" /expense-report/@currency = &quot;JPY&quot;">
																																								<children>
																																									<text fixtext="¥">
																																										<styles font-family="Verdana" font-weight="bold"/>
																																									</text>
																																								</children>
																																							</conditionbranch>
																																							<conditionbranch xpath=" /expense-report/@currency = &quot;AUD&quot;">
																																								<children>
																																									<text fixtext="AU">
																																										<styles font-family="Verdana" font-size="x-small" font-weight="bold"/>
																																									</text>
																																									<text fixtext="$">
																																										<styles font-family="Verdana" font-weight="bold"/>
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
																															</tgridheader-rows>
																															<tgridbody-rows>
																																<children>
																																	<template subtype="element" match="expense-item">
																																		<editorproperties autoaddname="1" editable="1" adding="all" markupmode="hide"/>
																																		<children>
																																			<tgridrow>
																																				<properties bgcolor="#E0E0E0"/>
																																				<styles height="29px"/>
																																				<children>
																																					<tgridcell>
																																						<children>
																																							<template subtype="attribute" match="type">
																																								<addvalidations>
																																									<addvalidation usermsg="The miscellaneous expense requires an detailed report" xpath="(. = &apos;Misc&apos;  and  /expense-report/@detailed != &apos;true&apos;)  or  . != &apos;Misc&apos;"/>
																																									<addvalidation usermsg="The meal expense requires an detailed report" xpath="((. = &apos;Meal&apos;  and  ../expense &gt;500) and  ../../@detailed !=&apos;true&apos;) or  . != &apos;Meal&apos;"/>
																																								</addvalidations>
																																								<editorproperties autoaddname="1" editable="1" markupmode="hide"/>
																																								<children>
																																									<combobox>
																																										<editorproperties editable="1"/>
																																										<children>
																																											<content/>
																																										</children>
																																										<selectoption description="Meal" value="Meal"/>
																																										<selectoption description="Lodging" value="Lodging"/>
																																										<selectoption description="Travel" value="Travel"/>
																																										<selectoption description="Parking" value="Parking"/>
																																										<selectoption description="Entertainment" value="Entertainment"/>
																																										<selectoption description="Misc" value="Misc"/>
																																									</combobox>
																																								</children>
																																								<variables/>
																																							</template>
																																						</children>
																																					</tgridcell>
																																					<tgridcell>
																																						<children>
																																							<template subtype="attribute" match="expto">
																																								<editorproperties autoaddname="1" editable="1" markupmode="hide"/>
																																								<children>
																																									<combobox enumeration="1">
																																										<editorproperties editable="1"/>
																																										<children>
																																											<content/>
																																										</children>
																																										<addvalidations>
																																											<addvalidation usermsg="All accounting expenses must have a detailed report" xpath="( . = &apos;Accounting&apos; and  /expense-report/@detailed = &apos;true&apos;) or   . != &apos;Accounting&apos;"/>
																																										</addvalidations>
																																									</combobox>
																																								</children>
																																								<variables/>
																																							</template>
																																						</children>
																																					</tgridcell>
																																					<tgridcell>
																																						<children>
																																							<template subtype="element" match="Date">
																																								<children>
																																									<content>
																																										<format basic-type="xsd" datatype="date"/>
																																									</content>
																																								</children>
																																								<variables/>
																																							</template>
																																						</children>
																																					</tgridcell>
																																					<tgridcell>
																																						<properties align="right"/>
																																						<styles white-space="nowrap"/>
																																						<children>
																																							<tgrid>
																																								<properties border="1" width="100%"/>
																																								<children>
																																									<tgridbody-cols>
																																										<children>
																																											<tgridcol/>
																																											<tgridcol/>
																																										</children>
																																									</tgridbody-cols>
																																									<tgridbody-rows>
																																										<children>
																																											<tgridrow>
																																												<children>
																																													<tgridcell>
																																														<children>
																																															<text fixtext="Travel">
																																																<styles font-weight="bold"/>
																																															</text>
																																														</children>
																																													</tgridcell>
																																													<tgridcell>
																																														<children>
																																															<text fixtext="Lodging">
																																																<styles font-weight="bold"/>
																																															</text>
																																														</children>
																																													</tgridcell>
																																												</children>
																																											</tgridrow>
																																											<tgridrow>
																																												<children>
																																													<tgridcell>
																																														<children>
																																															<template subtype="element" match="Travel">
																																																<children>
																																																	<template subtype="attribute" match="Trav-cost">
																																																		<children>
																																																			<content>
																																																				<format basic-type="xsd" datatype="decimal"/>
																																																			</content>
																																																		</children>
																																																		<variables/>
																																																	</template>
																																																</children>
																																																<variables/>
																																															</template>
																																														</children>
																																													</tgridcell>
																																													<tgridcell>
																																														<children>
																																															<template subtype="element" match="Lodging">
																																																<children>
																																																	<template subtype="attribute" match="Lodge-cost">
																																																		<children>
																																																			<content>
																																																				<format basic-type="xsd" datatype="decimal"/>
																																																			</content>
																																																		</children>
																																																		<variables/>
																																																	</template>
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
																																		<variables/>
																																	</template>
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
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts>
		<children>
			<globaltemplate subtype="element" match="italic">
				<children>
					<template subtype="element" match="italic">
						<children>
							<content>
								<styles font-style="italic"/>
							</content>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="strong">
				<children>
					<template subtype="element" match="strong">
						<children>
							<content>
								<styles font-weight="bold"/>
							</content>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</globalparts>
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>
