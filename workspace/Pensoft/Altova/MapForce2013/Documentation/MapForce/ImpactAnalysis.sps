<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*XML" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces>
			<nspair prefix="n1" uri="http://www.altova.com/documentation"/>
		</namespaces>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="MapForceDocumentation.xsd" workingxmlfile="SampleData\PersonListByBranchOffice.xml"/>
		</schemasources>
	</schemasources>
	<modules>
		<module spsfile="Modules\VerifySettings.sps"/>
	</modules>
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
				<document-properties _xtitle="$XML/n1:MapForceDocumentation/n1:Document/@title"/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<calltemplate subtype="named" match="EnsureAllIncludesAndDetails">
								<parameters/>
							</calltemplate>
							<paragraph paragraphtag="h3">
								<children>
									<text fixtext="This report lists every input and output node connection independently and is perfect for further impact analysis with modelling tools."/>
								</children>
							</paragraph>
							<tgrid>
								<properties border="1" cellspacing="0"/>
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
												<children>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="Input Node">
																<styles font-weight="bold"/>
															</text>
														</children>
													</tgridcell>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="Functions">
																<styles font-weight="bold"/>
															</text>
														</children>
													</tgridcell>
													<tgridcell>
														<styles text-align="center"/>
														<children>
															<text fixtext="Output Node">
																<styles font-weight="bold"/>
															</text>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
									</tgridheader-rows>
									<tgridbody-rows>
										<children>
											<template subtype="element" match="n1:MapForceDocumentation">
												<children>
													<template subtype="element" match="n1:Inputs">
														<children>
															<template subtype="userdefined" match="n1:Structure[@type=&apos;Input&apos;]//n1:Connection">
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<children>
																					<template subtype="userdefined" match="..">
																						<children>
																							<template subtype="userdefined" match="..">
																								<children>
																									<template subtype="attribute" match="name">
																										<children>
																											<content/>
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
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<autocalc xpath="string-join(./n1:Edges/n1:Edge/n1:Component[@ref],&apos;, &apos;)"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="element" match="n1:EndPoint">
																						<children>
																							<template subtype="element" match="n1:Component">
																								<children>
																									<content/>
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
																<variables/>
															</template>
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
