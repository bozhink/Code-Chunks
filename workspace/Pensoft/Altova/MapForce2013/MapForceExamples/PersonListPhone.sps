<?xml version="1.0" encoding="UTF-8"?>
<structure version="15" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="PersonList.xsd"/>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<mainparts/>
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
	<globalstyles>
		<rules selector=".info">
			<media>
				<media value="all"/>
			</media>
			<rule background-color="#c0ffa0" border="1px solid navy" font-size="x-large" font-style="normal" font-weight="bold"/>
		</rules>
	</globalstyles>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<document-properties/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="variable" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11.69in" papermarginbottom="0.79in" papermarginfooter="0.0in" papermarginheader="0.0in" papermarginleft="0.6in" papermarginright="0.6in" papermargintop="0.79in" paperwidth="8.27in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
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
															<image>
																<target>
																	<fixtext value="nanonull.gif"/>
																</target>
															</image>
														</children>
													</tgridcell>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
													</tgridcell>
												</children>
											</tgridrow>
											<tgridrow>
												<children>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
														<children>
															<newline/>
															<text fixtext="Nanonull, Inc.">
																<styles font-size="14pt" font-style="italic" font-weight="bold"/>
															</text>
															<newline/>
															<text fixtext="119 Oakstreet, Suite 4876, Vereno, CA 29213">
																<styles font-size="10pt" font-style="italic"/>
															</text>
															<newline/>
															<text fixtext="+1 (321) 555 5155">
																<styles font-size="10pt" font-style="italic"/>
															</text>
															<newline/>
															<text fixtext="Fax +1 (321) 555 5155 - 9">
																<styles font-size="10pt" font-style="italic"/>
															</text>
															<newline/>
															<text fixtext="office@nanonull.com">
																<styles font-size="10pt" font-style="italic"/>
															</text>
															<newline/>
															<text fixtext="www.nanonull.com">
																<styles font-size="10pt" font-style="italic"/>
															</text>
														</children>
													</tgridcell>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
														<children>
															<newline/>
															<newline/>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
											<tgridrow>
												<children>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
														<children>
															<newline/>
															<line/>
															<newline/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
														<children>
															<newline/>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
											<tgridrow>
												<children>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
														<children>
															<text fixtext="Filtered Phone List">
																<styles font-size="20pt" font-style="normal" font-weight="bold"/>
															</text>
															<newline/>
															<newline/>
															<text fixtext="sorted by Last">
																<styles font-size="14pt"/>
															</text>
														</children>
													</tgridcell>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
														<children>
															<newline/>
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
								<properties border="1" cellpadding="4" cellspacing="0"/>
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
												<properties align="left"/>
												<styles background-color="#a0c0ff" font-family="Arial"/>
												<children>
													<tgridcell>
														<children>
															<text fixtext="Last">
																<styles font-family="Verdana"/>
															</text>
														</children>
													</tgridcell>
													<tgridcell>
														<children>
															<text fixtext="First">
																<styles font-family="Verdana"/>
															</text>
														</children>
													</tgridcell>
													<tgridcell>
														<children>
															<text fixtext="Department">
																<styles font-family="Verdana"/>
															</text>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
									</tgridheader-rows>
									<tgridbody-rows>
										<children>
											<template subtype="element" match="PersonList">
												<children>
													<template subtype="element" match="Person">
														<children>
															<tgridrow>
																<children>
																	<tgridcell>
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
																	<tgridcell>
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
																		<children>
																			<template subtype="element" match="Details">
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
							<tgrid>
								<properties border="1" width="100%"/>
								<styles border="none" border-style="none" font-family="Verdana" font-size="10pt" text-align="right"/>
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
												<styles font-size="12pt"/>
												<children>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
														<children>
															<autocalc xpath="count( PersonList/Person )"/>
															<text fixtext=" employees found."/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
														<children>
															<newline/>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
											<tgridrow>
												<children>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
														<children>
															<newline/>
															<line/>
															<text fixtext="Note: All data is classified. This list is for internal use only.">
																<styles font-size="10pt" font-style="italic"/>
															</text>
															<newline/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles border-style="none" text-align="left"/>
														<children>
															<newline/>
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
					<newline/>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>
