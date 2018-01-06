<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="Contacts.xsd"/>
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
							<paragraph paragraphtag="h2">
								<styles border-bottom="2px solid navy" color="navy"/>
								<children>
									<text fixtext="Contacts including Addresses"/>
								</children>
							</paragraph>
							<tgrid>
								<properties border="1"/>
								<styles border="1px solid black" border-collapse="collapse" width="50%"/>
								<children>
									<tgridbody-cols>
										<children>
											<tgridcol>
												<styles width="20%"/>
											</tgridcol>
											<tgridcol>
												<styles width="20%"/>
											</tgridcol>
											<tgridcol>
												<styles width="1.65in"/>
											</tgridcol>
										</children>
									</tgridbody-cols>
									<tgridheader-rows>
										<children>
											<tgridrow>
												<styles background-color="#f6f6ff"/>
												<children>
													<tgridcell>
														<styles border="1px solid black" text-align="center"/>
														<children>
															<text fixtext="First Name"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles border="1px solid black" text-align="center"/>
														<children>
															<text fixtext="Last Name"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles text-align="left"/>
														<children>
															<text fixtext="Address"/>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
									</tgridheader-rows>
									<tgridbody-rows>
										<children>
											<template subtype="element" match="ContactsWithAddress">
												<children>
													<template subtype="element" match="Contact">
														<children>
															<tgridrow>
																<properties _xbgcolor="if ( $personnumber mod 2 = 0 ) then &apos;#ffe9e9&apos; else &apos;#ffa0a0&apos;"/>
																<styles height="0.64in"/>
																<children>
																	<tgridcell>
																		<styles border="1px solid black" text-align="center"/>
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
																		<styles border="1px solid black" text-align="center"/>
																		<children>
																			<template subtype="element" match="Last">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles border="1px solid black" text-align="left"/>
																		<children>
																			<template subtype="element" match="Address">
																				<children>
																					<template subtype="element" match="line">
																						<children>
																							<content/>
																							<text fixtext=" "/>
																						</children>
																						<variables>
																							<variable name="AddressLineNumber" value="position()" valuetype="&lt;auto&gt;"/>
																						</variables>
																					</template>
																					<text fixtext=" "/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
														<variables>
															<variable name="personnumber" value="position()" valuetype="&lt;auto&gt;"/>
														</variables>
													</template>
												</children>
												<variables/>
											</template>
										</children>
									</tgridbody-rows>
								</children>
							</tgrid>
							<newline/>
							<text fixtext="Note: Names and addresses are classified data. This list is strictly for internal use.">
								<styles font-size="10pt"/>
							</text>
							<newline/>
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
