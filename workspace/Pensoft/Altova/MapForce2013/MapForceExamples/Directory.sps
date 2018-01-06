<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="Directory.xsd"/>
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
				<styles background-color="white" color="black" font-family="Segoe UI"/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<calltemplate subtype="element" match="directory"/>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts>
		<children>
			<globaltemplate subtype="element" match="directory" schema-tree-path="$XML/directory">
				<children>
					<template subtype="element" match="directory">
						<children>
							<newline/>
							<text fixtext="    ">
								<styles background-color="black" color="white" font-weight="bold"/>
							</text>
							<template subtype="attribute" match="name">
								<children>
									<content>
										<styles background-color="black" color="white" font-weight="bold"/>
									</content>
								</children>
								<variables/>
							</template>
							<text fixtext="    ">
								<styles background-color="black" color="white" font-weight="bold"/>
							</text>
							<newline/>
							<tgrid>
								<properties border="1" width="100%"/>
								<styles border-color="black" border-style="solid" border-width="medium"/>
								<children>
									<tgridbody-cols>
										<children>
											<tgridcol>
												<styles width="0.15in"/>
											</tgridcol>
											<tgridcol/>
										</children>
									</tgridbody-cols>
									<tgridbody-rows>
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<styles border="none"/>
													</tgridcell>
													<tgridcell>
														<styles border="none"/>
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="file">
																		<children>
																			<tgrid>
																				<properties border="1"/>
																				<styles border-style="none"/>
																				<children>
																					<tgridbody-cols>
																						<children>
																							<tgridcol>
																								<styles width="2.13in"/>
																							</tgridcol>
																							<tgridcol/>
																						</children>
																					</tgridbody-cols>
																					<tgridbody-rows>
																						<children>
																							<template subtype="element" match="file">
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles border-style="none" text-align="left"/>
																												<children>
																													<template subtype="attribute" match="name">
																														<children>
																															<content>
																																<styles font-weight="bold"/>
																															</content>
																														</children>
																														<variables/>
																													</template>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles border-style="none" text-align="right"/>
																												<children>
																													<condition>
																														<children>
																															<conditionbranch xpath="@size &gt; 0">
																																<children>
																																	<template subtype="attribute" match="size">
																																		<children>
																																			<content>
																																				<format basic-type="xsd" datatype="unsignedLong"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																	<text fixtext=" Bytes"/>
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
																					</tgridbody-rows>
																				</children>
																			</tgrid>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<calltemplate subtype="element" match="directory"/>
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
			</globaltemplate>
		</children>
	</globalparts>
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>
