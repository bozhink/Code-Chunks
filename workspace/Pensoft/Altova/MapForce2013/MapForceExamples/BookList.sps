<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="BookList.xsd"/>
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
							<paragraph paragraphtag="h1">
								<children>
									<text fixtext="Book List"/>
								</children>
							</paragraph>
							<text fixtext="EAN/ISBN codes and the prices are as provided from the webservice provider http://www.booksprice.com"/>
							<newline/>
							<newline/>
							<tgrid>
								<properties border="1" width="100%"/>
								<styles border="solid" border-style="none" font-family="Verdana" font-size="10pt" font-style="italic" text-align="right"/>
								<children>
									<tgridbody-cols>
										<children>
											<tgridcol>
												<styles border-style="none" width="300px"/>
											</tgridcol>
											<tgridcol>
												<styles border-style="none" width="300px"/>
											</tgridcol>
											<tgridcol>
												<styles background-color="#ffe9e9" border-style="none"/>
											</tgridcol>
											<tgridcol>
												<styles background-color="#ffffe9" border-style="none" width="120px"/>
											</tgridcol>
											<tgridcol>
												<styles background-color="#ffffe9" border-style="none" width="120px"/>
											</tgridcol>
											<tgridcol>
												<styles background-color="#ffffe9" border-style="none" width="180px"/>
											</tgridcol>
											<tgridcol>
												<styles background-color="#ffa0a0" border-style="none" width="80px"/>
											</tgridcol>
										</children>
									</tgridbody-cols>
									<tgridheader-rows>
										<styles font-family="Verdana" font-size="10pt"/>
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<styles background-color="#ffe9e9" text-align="center"/>
														<children>
															<text fixtext="Title"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles background-color="#ffe9e9" text-align="center"/>
														<children>
															<text fixtext="Author"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="Year"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="EAN13"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="ISBN10"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="ISBN13"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="Price (US$)"/>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
									</tgridheader-rows>
									<tgridbody-rows>
										<children>
											<template subtype="element" match="BookList">
												<children>
													<template subtype="element" match="Book">
														<children>
															<tgridrow>
																<styles font-family="Courier New"/>
																<children>
																	<tgridcell>
																		<styles background-color="#ffe9e9" text-align="center"/>
																		<children>
																			<template subtype="attribute" match="Title">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles background-color="#ffe9e9" text-align="right"/>
																		<children>
																			<template subtype="element" match="Author">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles text-align="center"/>
																		<children>
																			<template subtype="attribute" match="Year">
																				<children>
																					<content>
																						<format basic-type="xsd" datatype="gYear"/>
																					</content>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles text-align="left"/>
																		<children>
																			<template subtype="attribute" match="EAN13">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles text-align="left"/>
																		<children>
																			<template subtype="attribute" match="ISBN10">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles text-align="left"/>
																		<children>
																			<template subtype="attribute" match="ISBN13">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles text-align="center"/>
																		<children>
																			<template subtype="attribute" match="Price">
																				<children>
																					<content>
																						<format basic-type="xsd" datatype="double"/>
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
							<text fixtext="Note that any price information is without any obligation.">
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
