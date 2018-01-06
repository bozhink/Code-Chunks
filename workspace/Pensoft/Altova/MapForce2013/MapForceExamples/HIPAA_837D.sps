<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE7" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="837-Q2.xsd"/>
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
					<tgrid>
						<properties border="1" width="100%"/>
						<styles border-style="none"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol>
										<styles width="9.86in"/>
									</tgridcol>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<styles background-color="aqua" border-style="none"/>
												<children>
													<paragraph paragraphtag="h2">
														<children>
															<text fixtext="Health Care Claim">
																<styles font-family="Arial" font-weight="bold"/>
															</text>
															<text fixtext=": Dental"/>
														</children>
													</paragraph>
													<text fixtext="Claim Number: ">
														<styles font-family="Arial"/>
													</text>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="DentalClaim">
																<children>
																	<template subtype="element" match="ElectronicPath">
																		<children>
																			<template subtype="element" match="ClaimNumber">
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
														<variables/>
													</template>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles background-color="aqua" border-style="none"/>
												<children>
													<image>
														<target>
															<fixtext value="nanonull.gif"/>
														</target>
													</image>
													<newline/>
													<text fixtext="Nanonull Dental Services">
														<styles font-family="Arial Narrow" font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<newline/>
					<template subtype="source" match="XML">
						<children>
							<template subtype="element" match="DentalClaim">
								<children>
									<newline/>
									<newline/>
									<tgrid>
										<properties border="1" width="100%"/>
										<styles border-style="none"/>
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
																<styles background-color="#e0e0e0" border-style="none"/>
																<children>
																	<paragraph paragraphtag="h3">
																		<children>
																			<text fixtext="To: ">
																				<styles font-family="consolas"/>
																			</text>
																		</children>
																	</paragraph>
																	<text fixtext="         ">
																		<styles font-family="consolas"/>
																	</text>
																	<template subtype="element" match="Receiver">
																		<children>
																			<template subtype="element" match="Organization">
																				<children>
																					<template subtype="element" match="OrganizationName">
																						<children>
																							<content>
																								<styles font-family="consolas"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																					<newline/>
																					<text fixtext="         TIN#: ">
																						<styles font-family="consolas"/>
																					</text>
																					<template subtype="element" match="ID">
																						<children>
																							<content>
																								<styles font-family="consolas"/>
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
									<tgrid>
										<properties border="1" width="100%"/>
										<styles border-style="none"/>
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
																<styles background-color="#e0e0e0" border-style="none"/>
																<children>
																	<paragraph paragraphtag="h3">
																		<children>
																			<text fixtext="Submitter:">
																				<styles font-family="consolas"/>
																			</text>
																		</children>
																	</paragraph>
																	<text fixtext="         ">
																		<styles font-family="consolas"/>
																	</text>
																	<template subtype="element" match="Submitter">
																		<children>
																			<template subtype="element" match="Organization">
																				<children>
																					<template subtype="element" match="OrganizationName">
																						<children>
																							<content>
																								<styles font-family="consolas"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																					<newline/>
																					<text fixtext="         ETIN#: ">
																						<styles font-family="consolas"/>
																					</text>
																					<template subtype="element" match="ID">
																						<children>
																							<content>
																								<styles font-family="consolas"/>
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
																	<text fixtext="         ">
																		<styles font-family="consolas"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<newline/>
									<template subtype="element" match="BillingProvider">
										<children>
											<tgrid>
												<properties border="1" width="100%"/>
												<styles border-style="none"/>
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
																		<styles background-color="#e0e0e0" border-style="none"/>
																		<children>
																			<paragraph paragraphtag="h3">
																				<children>
																					<text fixtext="From:">
																						<styles font-family="consolas"/>
																					</text>
																				</children>
																			</paragraph>
																			<text fixtext="         ">
																				<styles font-family="consolas"/>
																			</text>
																			<template subtype="element" match="Name">
																				<children>
																					<template subtype="element" match="First">
																						<children>
																							<content>
																								<styles font-family="consolas"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																					<text fixtext=" ">
																						<styles font-family="consolas"/>
																					</text>
																					<template subtype="element" match="Last">
																						<children>
																							<content>
																								<styles font-family="consolas"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																					<newline/>
																					<text fixtext="         ">
																						<styles font-family="consolas"/>
																					</text>
																					<template subtype="element" match="Address">
																						<children>
																							<template subtype="element" match="Street">
																								<children>
																									<content>
																										<styles font-family="consolas"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																						<variables/>
																					</template>
																					<newline/>
																					<text fixtext="         ">
																						<styles font-family="consolas"/>
																					</text>
																					<template subtype="element" match="Address">
																						<children>
																							<template subtype="element" match="Zip">
																								<children>
																									<content>
																										<styles font-family="consolas"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																							<text fixtext=" ">
																								<styles font-family="consolas"/>
																							</text>
																							<template subtype="element" match="City">
																								<children>
																									<content>
																										<styles font-family="consolas"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																							<text fixtext=", ">
																								<styles font-family="consolas"/>
																							</text>
																							<template subtype="element" match="State">
																								<children>
																									<content>
																										<styles font-family="consolas"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																						<variables/>
																					</template>
																					<newline/>
																					<text fixtext="         UPIN:  ">
																						<styles font-family="consolas"/>
																					</text>
																					<template subtype="element" match="UIN">
																						<children>
																							<content>
																								<styles font-family="consolas"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																				<variables/>
																			</template>
																			<text fixtext="         ">
																				<styles font-family="consolas"/>
																			</text>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
											<newline/>
											<template subtype="element" match="Subscriber">
												<children>
													<tgrid>
														<properties border="1" width="100%"/>
														<styles border-style="none"/>
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
																				<styles background-color="#e0e0e0" border-style="none"/>
																				<children>
																					<paragraph paragraphtag="h3">
																						<children>
																							<text fixtext="Subscriber:">
																								<styles font-family="consolas"/>
																							</text>
																						</children>
																					</paragraph>
																					<text fixtext="         ">
																						<styles font-family="consolas"/>
																					</text>
																					<template subtype="element" match="Name">
																						<children>
																							<template subtype="element" match="First">
																								<children>
																									<content>
																										<styles font-family="consolas"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																							<text fixtext=" ">
																								<styles font-family="consolas"/>
																							</text>
																							<template subtype="element" match="Last">
																								<children>
																									<content>
																										<styles font-family="consolas"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																							<newline/>
																							<text fixtext="         ">
																								<styles font-family="consolas"/>
																							</text>
																							<template subtype="element" match="Address">
																								<children>
																									<template subtype="element" match="Street">
																										<children>
																											<content>
																												<styles font-family="consolas"/>
																											</content>
																										</children>
																										<variables/>
																									</template>
																									<newline/>
																									<text fixtext="         ">
																										<styles font-family="consolas"/>
																									</text>
																									<template subtype="element" match="Zip">
																										<children>
																											<content>
																												<styles font-family="consolas"/>
																											</content>
																										</children>
																										<variables/>
																									</template>
																									<text fixtext=" ">
																										<styles font-family="consolas"/>
																									</text>
																									<template subtype="element" match="City">
																										<children>
																											<content>
																												<styles font-family="consolas"/>
																											</content>
																										</children>
																										<variables/>
																									</template>
																									<text fixtext=", ">
																										<styles font-family="consolas"/>
																									</text>
																									<template subtype="element" match="State">
																										<children>
																											<content>
																												<styles font-family="consolas"/>
																											</content>
																										</children>
																										<variables/>
																									</template>
																								</children>
																								<variables/>
																							</template>
																							<newline/>
																							<text fixtext="         SSN: ">
																								<styles font-family="consolas"/>
																							</text>
																							<template subtype="element" match="PayerID">
																								<children>
																									<content>
																										<styles font-family="consolas"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																							<newline/>
																							<text fixtext="         Date of birth: ">
																								<styles font-family="consolas"/>
																							</text>
																							<template subtype="element" match="DateOfBirth">
																								<children>
																									<content>
																										<styles font-family="consolas"/>
																										<format basic-type="xsd" datatype="date"/>
																									</content>
																									<button>
																										<action>
																											<datepicker/>
																										</action>
																									</button>
																								</children>
																								<variables/>
																							</template>
																							<newline/>
																							<text fixtext="         Sex: ">
																								<styles font-family="consolas"/>
																							</text>
																							<template subtype="element" match="Sex">
																								<children>
																									<content>
																										<styles font-family="consolas"/>
																									</content>
																								</children>
																								<variables/>
																							</template>
																						</children>
																						<variables/>
																					</template>
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
														<properties border="1" width="100%"/>
														<styles border-left-width="thick" border-style="none"/>
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
																				<styles background-color="#e0e0e0" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="justify"/>
																				<children>
																					<template subtype="element" match="Patient">
																						<children>
																							<tgrid>
																								<properties border="1"/>
																								<styles background-color="#e0e0e0" border-color="black" border-style="none"/>
																								<children>
																									<tgridbody-cols>
																										<children>
																											<tgridcol/>
																											<tgridcol/>
																											<tgridcol/>
																											<tgridcol/>
																											<tgridcol>
																												<styles width="1.76in"/>
																											</tgridcol>
																										</children>
																									</tgridbody-cols>
																									<tgridheader-rows>
																										<children>
																											<tgridrow>
																												<styles border-style="none"/>
																												<children>
																													<tgridcell>
																														<styles border-color="black" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="left"/>
																														<children>
																															<text fixtext="Item">
																																<styles font-family="consolas"/>
																															</text>
																														</children>
																													</tgridcell>
																													<tgridcell>
																														<styles border-color="black" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="left"/>
																														<children>
																															<text fixtext="Procedure ID">
																																<styles font-family="consolas"/>
																															</text>
																														</children>
																													</tgridcell>
																													<tgridcell>
																														<styles border-color="black" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="left"/>
																														<children>
																															<text fixtext="Description">
																																<styles font-family="consolas"/>
																															</text>
																														</children>
																													</tgridcell>
																													<tgridcell>
																														<styles border-color="black" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="left"/>
																														<children>
																															<text fixtext="Tooth code">
																																<styles font-family="consolas"/>
																															</text>
																														</children>
																													</tgridcell>
																													<tgridcell>
																														<styles border-color="black" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="left"/>
																														<children>
																															<text fixtext="Amount">
																																<styles font-family="consolas"/>
																															</text>
																														</children>
																													</tgridcell>
																												</children>
																											</tgridrow>
																										</children>
																									</tgridheader-rows>
																									<tgridbody-rows>
																										<children>
																											<template subtype="element" match="Services">
																												<children>
																													<template subtype="element" match="Service">
																														<children>
																															<tgridrow>
																																<styles background-repeat="repeat-y" border-style="none"/>
																																<children>
																																	<tgridcell>
																																		<styles border-color="black" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="left"/>
																																		<children>
																																			<template subtype="attribute" match="number">
																																				<children>
																																					<content>
																																						<styles font-family="consolas"/>
																																					</content>
																																				</children>
																																				<variables/>
																																			</template>
																																		</children>
																																	</tgridcell>
																																	<tgridcell>
																																		<styles border-color="black" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="left"/>
																																		<children>
																																			<template subtype="element" match="ProcedureID">
																																				<children>
																																					<content>
																																						<styles font-family="consolas"/>
																																					</content>
																																				</children>
																																				<variables/>
																																			</template>
																																		</children>
																																	</tgridcell>
																																	<tgridcell>
																																		<styles border-color="black" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="left"/>
																																		<children>
																																			<template subtype="element" match="Description">
																																				<children>
																																					<content>
																																						<styles font-family="consolas"/>
																																					</content>
																																				</children>
																																				<variables/>
																																			</template>
																																		</children>
																																	</tgridcell>
																																	<tgridcell>
																																		<styles border-color="black" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="left"/>
																																		<children>
																																			<tgrid>
																																				<properties border="1"/>
																																				<styles border-bottom-style="none" border-left-style="none" border-right-style="none" border-style="none" border-top-style="none"/>
																																				<children>
																																					<tgridbody-cols>
																																						<children>
																																							<tgridcol>
																																								<styles border-bottom-style="none" border-left-style="none" border-right-style="none" border-style="none" border-top-style="none" empty-cells="hide"/>
																																							</tgridcol>
																																						</children>
																																					</tgridbody-cols>
																																					<tgridbody-rows>
																																						<styles border-style="none" empty-cells="hide"/>
																																						<children>
																																							<template subtype="element" match="Tooth">
																																								<children>
																																									<tgridrow>
																																										<styles border-bottom-style="none" border-left-style="none" border-right-style="none" border-style="none" border-top-style="none" empty-cells="hide"/>
																																										<children>
																																											<tgridcell>
																																												<styles border-bottom-style="none" border-color="black" border-left-color="black" border-left-style="none" border-right-color="black" border-right-style="none" border-style="none" border-top-color="black" border-top-style="none" empty-cells="hide" text-align="left"/>
																																												<children>
																																													<template subtype="element" match="Code">
																																														<children>
																																															<content>
																																																<styles border-bottom-style="none" border-left-style="none" border-right-style="none" border-style="none" border-top-style="none" empty-cells="hide" font-family="consolas"/>
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
																																					</tgridbody-rows>
																																				</children>
																																			</tgrid>
																																		</children>
																																	</tgridcell>
																																	<tgridcell>
																																		<styles border-color="black" border-left-color="black" border-right-color="black" border-style="none" border-top-color="black" text-align="left"/>
																																		<children>
																																			<template subtype="element" match="Amount">
																																				<children>
																																					<content>
																																						<styles font-family="consolas"/>
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
					<newline/>
					<text fixtext="         "/>
					<newline/>
					<newline/>
					<newline/>
					<newline/>
					<newline/>
					<newline/>
					<newline/>
					<newline/>
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
