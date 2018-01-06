<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="UTF-8" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="VaccinationQueryReport.xsd"/>
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
						<properties columncount="1" columngap="0.50in" headerfooterheight="variable" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="1" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.0in" papermarginheader="0.0in" papermarginleft="0.6in" papermarginright="0.6in" papermargintop="0.79in" paperwidth="8.5in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<template subtype="element" match="VaccinationQueryReport">
								<children>
									<newline/>
									<tgrid>
										<properties border="0" cellspacing="0" width="100%"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<properties width="85%"/>
													</tgridcol>
												</children>
											</tgridbody-cols>
											<tgridbody-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<properties align="left" valign="top"/>
																<styles background-color="#c6c5ff"/>
																<children>
																	<text fixtext="Vaccination Query Report">
																		<styles font-size="20pt" font-weight="bold" margin-top="3pt"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
													<tgridrow>
														<children>
															<tgridcell/>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<template subtype="element" match="VaccinationQuery">
										<children>
											<tgrid>
												<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
												<styles border-collapse="collapse" table-layout="fixed"/>
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
																		<properties bgcolor="#D2FFFF"/>
																		<styles background-color="#e9e9ff" border-bottom-color="black" border-bottom-style="solid" border-bottom-width="1pt"/>
																		<children>
																			<text fixtext="VXQ_V01 - Query for vaccination record">
																				<styles font-family="Verdana" font-size="14pt"/>
																			</text>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
															<tgridrow>
																<children>
																	<tgridcell/>
																</children>
															</tgridrow>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
											<tgrid>
												<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
												<styles border-collapse="collapse"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<properties width="2%"/>
															</tgridcol>
															<tgridcol>
																<properties width="48%"/>
															</tgridcol>
															<tgridcol>
																<properties width="48%"/>
															</tgridcol>
														</children>
													</tgridbody-cols>
													<tgridbody-rows>
														<children>
															<tgridrow>
																<children>
																	<tgridcell/>
																	<tgridcell>
																		<children>
																			<tgrid>
																				<properties border="0" width="100%"/>
																				<children>
																					<tgridbody-cols>
																						<children>
																							<tgridcol>
																								<properties width="50%"/>
																								<styles width="auto"/>
																							</tgridcol>
																						</children>
																					</tgridbody-cols>
																					<tgridbody-rows>
																						<children>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Requested from:">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties bgcolor="#F3F3F3"/>
																										<styles background-color="#e9e9ff" border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<template subtype="attribute" match="QueryUser">
																												<children>
																													<content/>
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
																	</tgridcell>
																	<tgridcell>
																		<children>
																			<tgrid>
																				<properties border="0" width="100%"/>
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
																										<children>
																											<text fixtext="Requested Information:">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties bgcolor="#F3F3F3"/>
																										<styles background-color="#e9e9ff" border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<template subtype="element" match="WhatSubject">
																												<children>
																													<content/>
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
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
											<newline/>
											<tgrid>
												<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
												<styles border-collapse="collapse"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<properties width="2%"/>
															</tgridcol>
															<tgridcol>
																<properties width="48%"/>
															</tgridcol>
															<tgridcol>
																<properties width="48%"/>
															</tgridcol>
														</children>
													</tgridbody-cols>
													<tgridbody-rows>
														<children>
															<tgridrow>
																<children>
																	<tgridcell/>
																	<tgridcell>
																		<children>
																			<tgrid>
																				<properties border="0" width="100%"/>
																				<children>
																					<tgridbody-cols>
																						<children>
																							<tgridcol>
																								<properties width="50%"/>
																								<styles width="auto"/>
																							</tgridcol>
																						</children>
																					</tgridbody-cols>
																					<tgridbody-rows>
																						<children>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Vaccination Identifier:">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties bgcolor="#F3F3F3"/>
																										<styles background-color="#e9e9ff" border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																										<children>
																											<template subtype="attribute" match="Vaccid">
																												<children>
																													<content/>
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
																	</tgridcell>
																	<tgridcell>
																		<children>
																			<tgrid>
																				<properties border="0" width="100%"/>
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
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties bgcolor="#F3F3F3"/>
																										<styles background-color="white"/>
																									</tgridcell>
																								</children>
																							</tgridrow>
																						</children>
																					</tgridbody-rows>
																				</children>
																			</tgrid>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
											<template subtype="element" match="WhoSubject">
												<children>
													<tgrid>
														<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
														<styles border-collapse="collapse"/>
														<children>
															<tgridbody-cols>
																<children>
																	<tgridcol>
																		<properties width="2%"/>
																	</tgridcol>
																	<tgridcol>
																		<properties width="48%"/>
																	</tgridcol>
																	<tgridcol>
																		<properties width="48%"/>
																	</tgridcol>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell/>
																			<tgridcell>
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties width="50%"/>
																										<styles width="auto"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<children>
																													<text fixtext="Surname:">
																														<styles font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																										</children>
																									</tgridrow>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<properties bgcolor="#F3F3F3"/>
																												<styles background-color="#e9e9ff" border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																												<children>
																													<template subtype="attribute" match="surname">
																														<children>
																															<content/>
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
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<tgrid>
																						<properties border="0" width="100%"/>
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
																												<children>
																													<text fixtext="Given name:">
																														<styles font-weight="bold"/>
																													</text>
																												</children>
																											</tgridcell>
																										</children>
																									</tgridrow>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<properties bgcolor="#F3F3F3"/>
																												<styles background-color="#e9e9ff" border-color="#D3D3D3" border-style="solid" border-width="1pt"/>
																												<children>
																													<template subtype="attribute" match="givenname">
																														<children>
																															<content/>
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
											<line/>
										</children>
										<variables/>
									</template>
								</children>
								<variables/>
							</template>
						</children>
						<variables>
							<variable name="ShowExpenseSplit" value="true()" valuetype="xs:boolean" editable="1"/>
							<variable name="ExpenseSplitBy" value="&apos;type&apos;" valuetype="xs:string" editable="1"/>
						</variables>
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
