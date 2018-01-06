<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="Order.xsd"/>
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
														<styles border-style="none"/>
														<children>
															<image>
																<target>
																	<fixtext value="nanonull.gif"/>
																</target>
															</image>
														</children>
													</tgridcell>
													<tgridcell>
														<styles border-style="none" text-align="right"/>
														<children>
															<text fixtext="INCOMING PURCHASE ORDER">
																<styles font-size="16pt" font-style="normal" font-weight="bold"/>
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
													</tgridcell>
												</children>
											</tgridrow>
										</children>
									</tgridbody-rows>
								</children>
							</tgrid>
							<newline/>
							<newline/>
							<text fixtext="Purchase Order Number: "/>
							<text fixtext="PO - ">
								<styles font-weight="bold"/>
							</text>
							<template subtype="element" match="Order">
								<children>
									<template subtype="element" match="Header">
										<children>
											<template subtype="element" match="Number">
												<children>
													<content>
														<styles font-weight="bold"/>
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
							<newline/>
							<newline/>
							<newline/>
							<template subtype="element" match="Order">
								<children>
									<template subtype="element" match="Customer">
										<children>
											<tgrid>
												<properties border="1" width="100%"/>
												<styles border="none"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<styles border="none" width="1.40in"/>
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
																			<text fixtext="Customer:">
																				<styles font-family="Verdana" font-size="10pt" font-weight="bold"/>
																			</text>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles border="none" font-family="Courier New"/>
																		<children>
																			<template subtype="element" match="CompanyName">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																			<newline/>
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
																		<styles font-family="Courier New"/>
																		<children>
																			<text fixtext="Customer identifier:">
																				<styles font-family="Verdana" font-size="10pt"/>
																			</text>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles font-family="Courier New"/>
																		<children>
																			<text fixtext="ID-">
																				<styles font-weight="bold"/>
																			</text>
																			<template subtype="element" match="Number">
																				<children>
																					<content>
																						<styles font-weight="bold"/>
																						<format basic-type="xsd" datatype="integer"/>
																					</content>
																				</children>
																				<variables/>
																			</template>
																			<newline/>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
															<tgridrow>
																<children>
																	<tgridcell>
																		<styles font-family="Courier New"/>
																		<children>
																			<text fixtext="Contact:">
																				<styles font-family="Verdana" font-size="10pt"/>
																			</text>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles font-family="Courier New"/>
																		<children>
																			<text fixtext="Mrs./Mr. "/>
																			<template subtype="element" match="ContactName">
																				<children>
																					<content/>
																				</children>
																				<variables/>
																			</template>
																			<text fixtext=" "/>
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
																			<template subtype="element" match="Address">
																				<children>
																					<template subtype="element" match="Street">
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
															<tgridrow>
																<children>
																	<tgridcell>
																		<styles border="none" font-family="Courier New"/>
																	</tgridcell>
																	<tgridcell>
																		<styles border="none" font-family="Courier New"/>
																		<children>
																			<template subtype="element" match="Address">
																				<children>
																					<template subtype="element" match="City">
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
															<tgridrow>
																<children>
																	<tgridcell>
																		<styles border="none" font-family="Courier New"/>
																	</tgridcell>
																	<tgridcell>
																		<styles border="none" font-family="Courier New"/>
																		<children>
																			<template subtype="element" match="Address">
																				<children>
																					<template subtype="element" match="State">
																						<children>
																							<content/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																				<variables/>
																			</template>
																			<text fixtext=" "/>
																			<template subtype="element" match="Address">
																				<children>
																					<template subtype="element" match="ZIP">
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
													</tgridbody-rows>
												</children>
											</tgrid>
										</children>
										<variables/>
									</template>
								</children>
								<variables/>
							</template>
							<newline/>
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
															<template subtype="element" match="Order">
																<children>
																	<template subtype="element" match="Header">
																		<children>
																			<template subtype="element" match="Received">
																				<children>
																					<content>
																						<format basic-type="xsd" datatype="dateTime"/>
																					</content>
																					<button>
																						<action>
																							<datepicker/>
																						</action>
																					</button>
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
												<styles height="0.29in"/>
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
								<styles border="solid" border-color="black" border-width="thin" table-layout="fixed"/>
								<children>
									<tgridbody-cols>
										<children>
											<tgridcol/>
											<tgridcol/>
											<tgridcol/>
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
															<text fixtext="Quantity"/>
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
													<tgridcell>
														<children>
															<text fixtext="Total ($)"/>
														</children>
													</tgridcell>
													<tgridcell>
														<children>
															<text fixtext="Tax ($)"/>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
									</tgridheader-rows>
									<tgridbody-rows>
										<styles border="solid" border-color="black" border-width="thin"/>
										<children>
											<template subtype="element" match="Order">
												<children>
													<template subtype="element" match="LineItems">
														<children>
															<template subtype="element" match="LineItem">
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
																						<styles text-align="center"/>
																						<children>
																							<template subtype="element" match="Amount">
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
																					<tgridcell>
																						<styles text-align="right"/>
																						<children>
																							<template subtype="element" match="Price">
																								<children>
																									<text fixtext=" "/>
																									<content>
																										<format basic-type="xsd" datatype="decimal"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles text-align="right"/>
																						<children>
																							<template subtype="element" match="Tax">
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
														<variables/>
													</template>
												</children>
												<variables/>
											</template>
											<tgridrow>
												<styles border="solid" border-color="black" border-width="thin" font-family="Courier New"/>
												<children>
													<tgridcell>
														<styles text-align="center"/>
													</tgridcell>
													<tgridcell>
														<styles text-align="center"/>
													</tgridcell>
													<tgridcell>
														<styles text-align="left"/>
													</tgridcell>
													<tgridcell>
														<styles text-align="right"/>
													</tgridcell>
													<tgridcell>
														<styles border="solid" border-color="black" border-width="thin" text-align="right"/>
														<children>
															<template subtype="element" match="Order">
																<children>
																	<autocalc xpath="sum(LineItems/LineItem/Article/Price)"/>
																</children>
																<variables/>
															</template>
														</children>
													</tgridcell>
													<tgridcell/>
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
