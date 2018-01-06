<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="ini.xsd"/>
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
							<template subtype="element" match="Ini">
								<children>
									<template subtype="element" match="Section">
										<children>
											<paragraph>
												<styles background-color="#e8eeff" border-color="#002780" border-style="solid" border-width="1px" padding="3px"/>
												<children>
													<text fixtext="[">
														<styles font-family="Verdana" font-size="large" font-weight="bold"/>
													</text>
													<template subtype="attribute" match="Name">
														<children>
															<content>
																<styles color="#006980" font-family="Verdana" font-size="large" font-weight="bold"/>
															</content>
														</children>
														<variables/>
													</template>
													<text fixtext="] ">
														<styles font-family="Verdana" font-size="large" font-weight="bold"/>
													</text>
													<calltemplate subtype="named" match="Comment">
														<parameters/>
													</calltemplate>
													<newline/>
													<newline/>
													<tgrid>
														<properties border="0"/>
														<children>
															<tgridbody-cols>
																<children>
																	<tgridcol>
																		<styles width="10em"/>
																	</tgridcol>
																	<tgridcol/>
																	<tgridcol/>
																	<tgridcol/>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<template subtype="element" match="Parameter">
																		<children>
																			<tgridrow>
																				<children>
																					<tgridcell>
																						<children>
																							<template subtype="attribute" match="Name">
																								<children>
																									<content>
																										<styles font-family="Verdana"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<children>
																							<text fixtext="=">
																								<styles color="gray" font-family="Verdana"/>
																							</text>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<children>
																							<template subtype="attribute" match="Value">
																								<children>
																									<content>
																										<styles font-family="Verdana" font-weight="bold"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<children>
																							<calltemplate subtype="named" match="Comment">
																								<parameters/>
																							</calltemplate>
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
											</paragraph>
											<newline/>
										</children>
										<variables/>
									</template>
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
	<designfragments>
		<children>
			<globaltemplate subtype="named" match="Comment">
				<parameters/>
				<children>
					<template subtype="attribute" match="Comment">
						<children>
							<content>
								<styles color="gray" font-family="Verdana" font-size="small"/>
							</content>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</designfragments>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>
