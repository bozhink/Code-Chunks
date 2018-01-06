<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="Articles.xsd"/>
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
				<styles font-family="Verdana"/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<newline/>
							<tgrid>
								<properties border="1" width="100%"/>
								<styles border="none" border-style="none" font-family="Verdana" font-size="10pt" font-style="italic" text-align="right"/>
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
														<styles border-style="none" text-align="left"/>
														<children>
															<text fixtext="RESULT OF ARTICLE SEARCH">
																<styles font-size="20pt" font-style="normal" font-weight="bold"/>
															</text>
														</children>
													</tgridcell>
													<tgridcell>
														<styles border-style="none" text-align="right"/>
														<children>
															<image>
																<target>
																	<fixtext value="nanonull.gif"/>
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
							<newline/>
							<newline/>
							<tgrid>
								<properties border="1"/>
								<styles table-layout="fixed"/>
								<children>
									<tgridbody-cols>
										<children>
											<tgridcol/>
											<tgridcol/>
											<tgridcol/>
										</children>
									</tgridbody-cols>
									<tgridheader-rows>
										<styles font-family="Verdana" font-size="10pt"/>
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="Item"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="Name"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="Unit Price ($)"/>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
									</tgridheader-rows>
									<tgridbody-rows>
										<children>
											<template subtype="element" match="Articles">
												<children>
													<template subtype="element" match="Article">
														<children>
															<tgridrow>
																<styles font-family="Courier New"/>
																<children>
																	<tgridcell>
																		<styles text-align="center"/>
																		<children>
																			<template subtype="element" match="Number">
																				<children>
																					<content>
																						<format basic-type="xsd" datatype="integer"/>
																					</content>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles text-align="left"/>
																		<children>
																			<template subtype="element" match="Name">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles text-align="right"/>
																		<children>
																			<template subtype="element" match="SinglePrice">
																				<children>
																					<content>
																						<format basic-type="xsd" datatype="decimal"/>
																					</content>
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
												<variables/>
											</template>
										</children>
									</tgridbody-rows>
								</children>
							</tgrid>
							<newline/>
							<newline/>
							<text fixtext="Purpose:">
								<styles font-family="Verdana" font-size="10pt" font-weight="bold"/>
							</text>
							<text fixtext=" ____________________________________"/>
							<newline/>
							<newline/>
							<text fixtext="Other Comments:">
								<styles font-family="Verdana" font-size="10pt" font-weight="bold"/>
							</text>
							<text fixtext=" _________________________________________________"/>
							<newline/>
							<newline/>
							<newline/>
							<text fixtext="Attention: this list is only intended for persons working for Nanonull Inc. It contains confidential and/or privileged data. It is strictly only for internal usage.">
								<styles font-size="8pt"/>
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
