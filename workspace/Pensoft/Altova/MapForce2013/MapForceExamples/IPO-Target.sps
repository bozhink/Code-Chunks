<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="IPO-Target.xsd" workingxmlfile="out.xml"/>
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
							<newline/>
							<template subtype="element" match="PurchaseOrders">
								<children>
									<template subtype="element" match="purchaseOrder">
										<children>
											<newline/>
											<paragraph>
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
																				<styles border-style="none"/>
																			</tgridcell>
																			<tgridcell>
																				<styles border-style="none" text-align="right"/>
																				<children>
																					<text fixtext="PURCHASE ORDER">
																						<styles font-size="20pt" font-style="normal" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border-style="none"/>
																			</tgridcell>
																			<tgridcell>
																				<styles border-style="none" text-align="right"/>
																				<children>
																					<template subtype="element" match="Suppliers">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="Address">
																										<children>
																											<template subtype="element" match="Address">
																												<children>
																													<content/>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																							<newline/>
																							<condition>
																								<children>
																									<conditionbranch xpath="City">
																										<children>
																											<template subtype="element" match="City">
																												<children>
																													<content/>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																							<newline/>
																							<condition>
																								<children>
																									<conditionbranch xpath="PostalCode">
																										<children>
																											<template subtype="element" match="PostalCode">
																												<children>
																													<content/>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																							<newline/>
																							<condition>
																								<children>
																									<conditionbranch xpath="Phone">
																										<children>
																											<template subtype="element" match="Phone">
																												<children>
																													<content/>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																							<newline/>
																							<condition>
																								<children>
																									<conditionbranch xpath="Fax">
																										<children>
																											<template subtype="element" match="Fax">
																												<children>
																													<content/>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																						<variables/>
																					</template>
																					<newline/>
																					<newline/>
																					<newline/>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
													<tgrid>
														<properties border="1" width="100%"/>
														<styles border="none"/>
														<children>
															<tgridbody-cols>
																<children>
																	<tgridcol>
																		<styles border="none" width="1.23in"/>
																	</tgridcol>
																	<tgridcol>
																		<styles border="none" width="3.07in"/>
																	</tgridcol>
																</children>
															</tgridbody-cols>
															<tgridheader-rows>
																<styles text-align="left"/>
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="none" font-family="Courier New"/>
																				<children>
																					<text fixtext="TO:">
																						<styles font-family="Verdana" font-size="14pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="none" font-family="Courier New"/>
																				<children>
																					<text fixtext="Mrs./Mr. "/>
																					<template subtype="userdefined" match=".">
																						<children>
																							<template subtype="element" match="shipTo">
																								<children>
																									<template subtype="element" match="name">
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
																					<text fixtext=" "/>
																					<template subtype="userdefined" match=".">
																						<children>
																							<template subtype="element" match="shipTo">
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
															</tgridheader-rows>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="none" font-family="Courier New"/>
																			</tgridcell>
																			<tgridcell>
																				<styles border="none" font-family="Courier New"/>
																				<children>
																					<template subtype="userdefined" match=".">
																						<children>
																							<template subtype="element" match="shipTo">
																								<children>
																									<template subtype="element" match="street">
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
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="none" font-family="Courier New"/>
																			</tgridcell>
																			<tgridcell>
																				<styles border="none" font-family="Courier New"/>
																				<children>
																					<template subtype="userdefined" match=".">
																						<children>
																							<template subtype="element" match="shipTo">
																								<children>
																									<template subtype="element" match="city">
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
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="none" font-family="Courier New"/>
																			</tgridcell>
																			<tgridcell>
																				<styles border="none" font-family="Courier New"/>
																				<children>
																					<template subtype="userdefined" match=".">
																						<children>
																							<template subtype="element" match="shipTo">
																								<children>
																									<template subtype="element" match="state">
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
																					<text fixtext=" "/>
																					<template subtype="userdefined" match=".">
																						<children>
																							<template subtype="element" match="shipTo">
																								<children>
																									<template subtype="element" match="zip">
																										<children>
																											<content>
																												<format basic-type="xsd" datatype="positiveInteger"/>
																											</content>
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
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
													<newline/>
													<newline/>
													<tgrid>
														<properties border="1" width="100%"/>
														<styles border="none" border-style="none"/>
														<children>
															<tgridbody-cols>
																<children>
																	<tgridcol>
																		<styles border="none" width="1.19in"/>
																	</tgridcol>
																	<tgridcol>
																		<styles border="none" width="3.07in"/>
																	</tgridcol>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="none" border-style="none" font-family="Courier New"/>
																				<children>
																					<text fixtext="Order Date:">
																						<styles font-family="Verdana" font-size="10pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="none" border-style="none" font-family="Courier New"/>
																				<children>
																					<text fixtext="_____________________"/>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="none" border-style="none" font-family="Courier New"/>
																				<children>
																					<text fixtext="Shipping Date:">
																						<styles font-family="Verdana" font-size="10pt" font-weight="bold"/>
																					</text>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="none" border-style="none" font-family="Courier New"/>
																				<children>
																					<text fixtext="_____________________"/>
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
																	<tgridcol>
																		<styles width="2.68in"/>
																	</tgridcol>
																	<tgridcol>
																		<styles width="1.26in"/>
																	</tgridcol>
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
																					<text fixtext="Name"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles text-align="center"/>
																				<children>
																					<text fixtext="Quantity"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles text-align="center"/>
																				<children>
																					<text fixtext="Unit Price (USD)"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles text-align="center"/>
																				<children>
																					<text fixtext="Total (USD)"/>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridheader-rows>
															<tgridbody-rows>
																<children>
																	<template subtype="element" match="Suppliers">
																		<children>
																			<template subtype="element" match="Items">
																				<children>
																					<template subtype="element" match="item">
																						<children>
																							<tgridrow>
																								<styles font-family="Courier New"/>
																								<children>
																									<tgridcell>
																										<styles text-align="left"/>
																										<children>
																											<template subtype="element" match="productName">
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
																											<template subtype="element" match="quantity">
																												<children>
																													<content>
																														<format basic-type="xsd" datatype="positiveInteger"/>
																													</content>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<styles text-align="right"/>
																										<children>
																											<template subtype="element" match="price">
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
																											<autocalc xpath="xs:decimal(quantity)*xs:decimal(price)"/>
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
																	<tgridrow>
																		<styles font-family="Courier New"/>
																		<children>
																			<tgridcell>
																				<styles text-align="left"/>
																			</tgridcell>
																			<tgridcell>
																				<styles text-align="center"/>
																			</tgridcell>
																			<tgridcell>
																				<styles text-align="right"/>
																			</tgridcell>
																			<tgridcell>
																				<styles border="solid" border-color="black" border-width="thin" font-weight="bold" text-align="right"/>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
													<newline/>
													<newline/>
													<text fixtext="Other Comments:">
														<styles font-family="Verdana" font-size="10pt" font-weight="bold"/>
													</text>
													<text fixtext=" ____________________________________"/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<tgrid>
														<properties border="1" width="100%"/>
														<styles border="none" border-style="none" font-size="8pt"/>
														<children>
															<tgridbody-cols>
																<children>
																	<tgridcol>
																		<styles border="none" width="1.98in"/>
																	</tgridcol>
																	<tgridcol>
																		<styles border="none" width="3.07in"/>
																	</tgridcol>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="none" border-style="none"/>
																				<children>
																					<text fixtext="_____________________"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="none" border-style="none"/>
																				<children>
																					<text fixtext="____________"/>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<styles border="none" border-style="none"/>
																				<children>
																					<text fixtext="Authorized Signature"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<styles border="none" border-style="none"/>
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
													<newline/>
													<text fixtext="If you have any questions about this purchase order, please contact us.">
														<styles font-size="8pt"/>
													</text>
												</children>
											</paragraph>
											<condition>
												<children>
													<conditionbranch xpath="$SV_OutputFormat = &apos;RTF&apos; or $SV_OutputFormat = &apos;Word2007&apos; or $SV_OutputFormat = &apos;PDF&apos;">
														<children>
															<newline/>
															<newline break="page"/>
														</children>
													</conditionbranch>
													<conditionbranch>
														<children>
															<line/>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
										<variables/>
									</template>
									<newline/>
								</children>
								<variables/>
							</template>
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
