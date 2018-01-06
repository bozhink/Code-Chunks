<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="UTF-8" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces>
			<nspair prefix="sql" uri="urn:schemas-microsoft-com:mapping-schema"/>
		</namespaces>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="Altova_Hierarchical.xsd"/>
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
							<template subtype="element" match="Altova">
								<children>
									<newline/>
									<template subtype="element" match="Name">
										<children>
											<content>
												<styles color="#0588BA" font-family="Arial" font-size="20pt" font-weight="bold"/>
												<format basic-type="xsd" datatype="string"/>
											</content>
										</children>
										<variables/>
									</template>
									<newline/>
									<newline/>
									<toc name="toc">
										<children>
											<text fixtext="Quick Finder">
												<styles font-family="Arial" font-size="14pt" font-weight="bold"/>
											</text>
											<newline/>
											<reflevel>
												<children>
													<newline/>
													<ref name="toc" createhyperlink="1">
														<children>
															<field type="ref-entrytext">
																<styles font-family="Arial" font-size="12pt" font-weight="bold"/>
															</field>
														</children>
													</ref>
													<newline/>
													<tgrid>
														<properties cellspacing="0" width="100%"/>
														<styles margin-top="2pt"/>
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
																					<text fixtext="Departments">
																						<styles font-size="10pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<text fixtext="Persons">
																						<styles font-size="10pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
													<reflevel>
														<children>
															<tgrid>
																<properties cellspacing="0" width="100%"/>
																<styles line-height="12pt"/>
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
																				<properties _xbgcolor="if ( position() mod 2 ) then &quot;antiquewhite&quot; else &quot;navajowhite&quot;"/>
																				<children>
																					<tgridcell>
																						<properties valign="top"/>
																						<children>
																							<ref name="toc" createhyperlink="1">
																								<children>
																									<num-lvl format="A.1" omitlevels="1">
																										<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																									</num-lvl>
																									<text fixtext=". ">
																										<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																									</text>
																									<field type="ref-entrytext">
																										<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																									</field>
																								</children>
																							</ref>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<properties valign="top"/>
																						<children>
																							<reflevel>
																								<children>
																									<tgrid>
																										<properties cellpadding="0" cellspacing="0"/>
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
																																<properties valign="top"/>
																																<children>
																																	<ref name="toc" createhyperlink="1">
																																		<children>
																																			<num-lvl format="A.1" omitlevels="1">
																																				<styles font-family="Arial" font-size="8pt"/>
																																			</num-lvl>
																																			<text fixtext=" ">
																																				<styles font-family="Arial" font-size="8pt"/>
																																			</text>
																																			<field type="ref-entrytext">
																																				<styles font-family="Arial" font-size="8pt"/>
																																			</field>
																																		</children>
																																	</ref>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																												</children>
																											</tgridbody-rows>
																										</children>
																									</tgrid>
																								</children>
																							</reflevel>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																		</children>
																	</tgridbody-rows>
																</children>
															</tgrid>
														</children>
													</reflevel>
												</children>
											</reflevel>
										</children>
									</toc>
									<newline/>
									<template subtype="element" levelflag="1" match="Office">
										<editorproperties adding="no"/>
										<children>
											<newline/>
											<marker xpath="." name="toc">
												<children>
													<template subtype="element" match="Name">
														<editorproperties adding="no"/>
														<children>
															<content>
																<styles color="#707070" font-family="Arial" font-size="15pt" font-weight="bold"/>
																<format basic-type="xsd" datatype="string"/>
															</content>
														</children>
														<variables/>
													</template>
												</children>
											</marker>
											<newline/>
											<newline/>
											<template subtype="element" match="Address">
												<editorproperties adding="no"/>
												<children>
													<template subtype="element" match="city">
														<children>
															<content>
																<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold"/>
																<format basic-type="xsd" datatype="string"/>
															</content>
														</children>
														<variables/>
													</template>
												</children>
												<variables/>
											</template>
											<text fixtext=" Office Summary:">
												<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold"/>
											</text>
											<text fixtext="  "/>
											<autocalc xpath="count(Department)">
												<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold"/>
											</autocalc>
											<text fixtext=" department">
												<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold"/>
											</text>
											<condition>
												<children>
													<conditionbranch xpath="count(Department) != 1">
														<children>
															<text fixtext="s">
																<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold"/>
															</text>
														</children>
													</conditionbranch>
												</children>
											</condition>
											<text fixtext=", ">
												<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold"/>
											</text>
											<autocalc xpath="count(Department/Person)">
												<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold"/>
											</autocalc>
											<text fixtext=" employee">
												<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold"/>
											</text>
											<condition>
												<children>
													<conditionbranch xpath="count(Department/Person) != 1">
														<children>
															<text fixtext="s">
																<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold"/>
															</text>
														</children>
													</conditionbranch>
												</children>
											</condition>
											<text fixtext=".">
												<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold"/>
											</text>
											<newline/>
											<template subtype="element" match="Desc">
												<editorproperties adding="no"/>
												<children>
													<content>
														<styles color="gray" font-size="smaller"/>
													</content>
												</children>
												<variables/>
											</template>
											<newline/>
											<newline/>
											<template subtype="element" levelflag="1" match="Department">
												<editorproperties adding="no"/>
												<children>
													<marker xpath="." name="toc">
														<children>
															<template subtype="element" match="Name">
																<editorproperties adding="no"/>
																<children>
																	<content>
																		<styles color="#D39658" font-family="Arial" font-weight="bold"/>
																		<format basic-type="xsd" datatype="string"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
													</marker>
													<text fixtext=" "/>
													<text fixtext="( ">
														<styles color="#D39658" font-family="Arial" font-weight="bold"/>
													</text>
													<autocalc xpath="count(Person)">
														<styles color="#D39658" font-family="Arial" font-weight="bold"/>
													</autocalc>
													<text fixtext=" )">
														<styles color="#D39658" font-family="Arial" font-weight="bold"/>
													</text>
													<newline/>
													<tgrid>
														<properties border="1" cellpadding="3" cellspacing="0" width="100%"/>
														<children>
															<tgridbody-cols>
																<children>
																	<tgridcol>
																		<properties width="10%"/>
																	</tgridcol>
																	<tgridcol>
																		<properties width="12%"/>
																	</tgridcol>
																	<tgridcol>
																		<properties width="16%"/>
																	</tgridcol>
																	<tgridcol>
																		<properties width="5%"/>
																	</tgridcol>
																	<tgridcol>
																		<properties width="23%"/>
																	</tgridcol>
																</children>
															</tgridbody-cols>
															<tgridheader-rows>
																<children>
																	<tgridrow>
																		<properties bgcolor="#D2C8AE"/>
																		<children>
																			<tgridcell>
																				<properties align="center" bgcolor="#D2C8AE"/>
																				<children>
																					<text fixtext="First">
																						<styles color="#606060" font-family="Arial" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<properties align="center" bgcolor="#D2C8AE"/>
																				<children>
																					<text fixtext="Last">
																						<styles color="#606060" font-family="Arial" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<properties align="center" bgcolor="#D2C8AE"/>
																				<children>
																					<text fixtext="Title">
																						<styles color="#606060" font-family="Arial" font-weight="bold"/>
																					</text>
																					<newline/>
																					<condition>
																						<children>
																							<conditionbranch xpath="$SV_OutputFormat = &apos;Authentic&apos;"/>
																							<conditionbranch xpath="$SV_OutputFormat = &apos;HTML&apos;">
																								<children>
																									<text fixtext="(sorted by)">
																										<styles color="#606060" font-family="Arial" font-size="x-small" font-weight="bold"/>
																									</text>
																								</children>
																							</conditionbranch>
																							<conditionbranch xpath="$SV_OutputFormat = &apos;RTF&apos; or $SV_OutputFormat = &apos;Word2007&apos;">
																								<children>
																									<text fixtext="(sorted by)">
																										<styles color="#606060" font-family="Arial" font-size="x-small" font-weight="bold"/>
																									</text>
																								</children>
																							</conditionbranch>
																							<conditionbranch xpath="$SV_OutputFormat = &apos;PDF&apos;">
																								<children>
																									<text fixtext="(sorted by)">
																										<styles color="#606060" font-family="Arial" font-size="x-small" font-weight="bold"/>
																									</text>
																								</children>
																							</conditionbranch>
																						</children>
																					</condition>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<properties align="center" bgcolor="#D2C8AE"/>
																				<children>
																					<text fixtext="Ext">
																						<styles color="#606060" font-family="Arial" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<properties align="center" bgcolor="#D2C8AE"/>
																				<children>
																					<text fixtext="EMail">
																						<styles color="#606060" font-family="Arial" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridheader-rows>
															<tgridbody-rows>
																<children>
																	<template subtype="element" levelflag="1" match="Person">
																		<sort>
																			<key match="Title"/>
																		</sort>
																		<editorproperties adding="mandatory"/>
																		<children>
																			<tgridrow>
																				<properties _xbgcolor="if ( position() mod 2 ) then &quot;antiquewhite&quot; else &quot;navajowhite&quot;"/>
																				<children>
																					<tgridcell>
																						<children>
																							<marker xpath="concat(Last,&apos; &apos;,First)" name="toc" uses="xpath"/>
																							<template subtype="element" match="First">
																								<editorproperties adding="mandatory"/>
																								<children>
																									<content>
																										<styles font-size="10pt"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<children>
																							<template subtype="element" match="Last">
																								<editorproperties adding="mandatory"/>
																								<children>
																									<content>
																										<styles font-size="10pt"/>
																										<format basic-type="xsd" datatype="string"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<children>
																							<template subtype="element" match="Title">
																								<editorproperties autoaddname="1" editable="1" adding="mandatory"/>
																								<children>
																									<content>
																										<styles font-size="10pt"/>
																										<format basic-type="xsd" datatype="string"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<properties align="center"/>
																						<children>
																							<template subtype="element" match="PhoneExt">
																								<editorproperties adding="mandatory"/>
																								<children>
																									<content>
																										<editorproperties editable="1"/>
																										<styles font-size="10pt"/>
																										<addvalidations>
																											<addvalidation usermsg="Telephone extensions must be 3 digits long." xpath="string-length(string(.) ) = 3"/>
																										</addvalidations>
																										<format basic-type="xsd" datatype="integer"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<children>
																							<template subtype="element" match="EMail">
																								<editorproperties adding="mandatory"/>
																								<children>
																									<link>
																										<children>
																											<content>
																												<styles font-size="10pt"/>
																												<format basic-type="xsd" datatype="string"/>
																											</content>
																										</children>
																										<action>
																											<none/>
																										</action>
																										<hyperlink>
																											<fixtext value="mailto:"/>
																											<xpath value="."/>
																										</hyperlink>
																									</link>
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
															<tgridfooter-rows>
																<children>
																	<tgridrow>
																		<properties bgcolor="#F2F0E6"/>
																		<children>
																			<tgridcell>
																				<properties align="left" valign="top"/>
																				<children>
																					<text fixtext="Employees:  ">
																						<styles color="#004080" font-family="Arial" font-size="8pt" font-weight="bold"/>
																					</text>
																					<autocalc xpath="count(  Person  )">
																						<styles color="#004080" font-family="Arial" font-size="8pt" font-weight="bold"/>
																					</autocalc>
																					<text fixtext=" ">
																						<styles font-size="8pt"/>
																					</text>
																					<text fixtext="(">
																						<styles color="#004080" font-family="Arial" font-size="8pt" font-weight="bold"/>
																					</text>
																					<autocalc xpath="round ((count(  Person  ) ) div ( count( ../Department/ Person  ) ) * 100)">
																						<styles color="#004080" font-family="Arial" font-size="8pt" font-weight="bold"/>
																					</autocalc>
																					<text fixtext="% of Office, ">
																						<styles color="#004080" font-family="Arial" font-size="8pt" font-weight="bold"/>
																					</text>
																					<autocalc xpath="round ((count(  Person  ) ) div ( count( ../../Office/Department/Person  ) ) * 100)">
																						<styles color="#004080" font-family="Arial" font-size="8pt" font-weight="bold"/>
																					</autocalc>
																					<text fixtext="% of Company)">
																						<styles color="#004080" font-family="Arial" font-size="8pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell joinleft="1">
																				<properties align="left" valign="top"/>
																			</tgridcell>
																			<tgridcell joinleft="1">
																				<properties align="left" valign="top"/>
																			</tgridcell>
																			<tgridcell joinleft="1">
																				<properties align="left" valign="top"/>
																			</tgridcell>
																			<tgridcell joinleft="1">
																				<properties align="left" valign="top"/>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridfooter-rows>
														</children>
													</tgrid>
													<newline/>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
									<newline/>
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
	<globalparts/>
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons>
		<textstateicon match="ts:bold" iconfile="bold.bmp"/>
		<textstateicon match="ts:italic" iconfile="italic.bmp"/>
	</authentic-custom-toolbar-buttons>
</structure>
