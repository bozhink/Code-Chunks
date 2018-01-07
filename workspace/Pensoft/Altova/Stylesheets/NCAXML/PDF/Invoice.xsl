<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:variable name="fo:layout-master-set">
		<fo:layout-master-set>
			<fo:simple-page-master master-name="default-page-master" page-height="11in" page-width="8.5in" margin-top="0.79in" margin-bottom="0.79in" margin-left="0.6in" margin-right="0.6in">
				<fo:region-before margin-right="0.6in" extent="0cm"/>
				<fo:region-body margin-top="0cm" margin-bottom="0cm" font-family="Helvetica,Times,Courier" font-size="14pt" line-height="14pt"/>
				<fo:region-after extent="0cm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:variable>
	<xsl:template match="/">
		<fo:root>
			<xsl:copy-of select="$fo:layout-master-set"/>
			<fo:page-sequence master-reference="default-page-master">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block/>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-after">
					<fo:block/>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<xsl:for-each select="Invoice">
							<xsl:for-each select="Header">
								<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
									<fo:table-column/>
									<fo:table-column/>
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
												<fo:block>
													<fo:inline font-size="20pt" font-weight="bold">NCA INVOICE</fo:inline>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell text-align="right" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
												<fo:block>
													<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
														<fo:table-column/>
														<fo:table-body>
															<fo:table-row>
																<fo:table-cell text-align="right" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="documentID">Document ID<xsl:apply-templates/>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
															<fo:table-row>
																<fo:table-cell text-align="right" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="invoiceType">Invoice Type: <xsl:apply-templates/>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
															<fo:table-row>
																<fo:table-cell text-align="right" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="status">Status: <xsl:apply-templates/>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</xsl:for-each>
							<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
								<fo:table-column column-width="57pt"/>
								<fo:table-column/>
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell width="57pt" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
											<fo:block/>
										</fo:table-cell>
										<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
											<fo:block>
												<xsl:for-each select="Body">
													<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
														<fo:table-column/>
														<fo:table-column/>
														<fo:table-body>
															<fo:table-row>
																<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">General Information</fo:inline>
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" text-align="right" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="GeneralInformation">
																			<xsl:for-each select="dateOfIssue">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Date of Issue: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																			</xsl:for-each>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
															<fo:table-row>
																<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="GeneralInformation">
																			<xsl:for-each select="contractType">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Contract Type: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="e-TransactionNumber">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">E-Transaction Number: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="buyerContractIdentifier">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Buyer Contract Identifer: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="sellerContractIdentifier">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Seller Contract Identifer: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="brokerContractIdentifier">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Broker Contract Identifer: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<xsl:text>&#xA;</xsl:text>
																				</fo:block>
																			</xsl:for-each>
																			<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																				<fo:table-column/>
																				<fo:table-column/>
																				<fo:table-body>
																					<fo:table-row>
																						<fo:table-cell text-align="center" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																							<fo:block>
																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Contract Identifer</fo:inline>
																							</fo:block>
																						</fo:table-cell>
																						<fo:table-cell text-align="center" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																							<fo:block>
																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Invoice Number</fo:inline>
																							</fo:block>
																						</fo:table-cell>
																					</fo:table-row>
																					<fo:table-row>
																						<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																							<fo:block>
																								<xsl:for-each select="ContractIdentifier">
																									<xsl:for-each select="documentCreatorIdentifier">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Creator Identifier: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="documentNumber">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Number: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="documentVersion">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Version: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="contractExtension">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Contract Extention: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																								</xsl:for-each>
																							</fo:block>
																						</fo:table-cell>
																						<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																							<fo:block>
																								<xsl:for-each select="InvoiceNumber">
																									<xsl:for-each select="documentCreatorIdentifier">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Creator Identifer: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="documentNumber">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Number: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="documentVersion">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Version: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																								</xsl:for-each>
																							</fo:block>
																						</fo:table-cell>
																					</fo:table-row>
																				</fo:table-body>
																			</fo:table>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
													<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
														<fo:table-column/>
														<fo:table-body>
															<fo:table-row>
																<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Parties</fo:inline>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
															<fo:table-row>
																<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="Parties">
																			<xsl:for-each select="Buyer">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Buyer:</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<fo:block>
																										<fo:leader leader-pattern="space"/>
																									</fo:block>
																									<xsl:for-each select="organizationName">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Name: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="OrganizationIdentification">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identification: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																													<fo:block>
																														<xsl:for-each select="AddressInformation">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Address: </fo:inline>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																															<xsl:for-each select="FormattedAddress">
																																<xsl:for-each select="line">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates/>
																																	</fo:inline>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																</xsl:for-each>
																															</xsl:for-each>
																															<xsl:for-each select="NormalisedAddress">
																																<xsl:for-each select="StreetAddress">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates select="text()"/>
																																	</fo:inline>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																	<xsl:for-each select="line">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:block>
																																			<xsl:text>&#xA;</xsl:text>
																																		</fo:block>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																																	<fo:table-column/>
																																	<fo:table-column/>
																																	<fo:table-body>
																																		<fo:table-row>
																																			<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																																				<fo:block>
																																					<xsl:for-each select="city">
																																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																							<xsl:apply-templates/>
																																						</fo:inline>
																																					</xsl:for-each>
																																				</fo:block>
																																			</fo:table-cell>
																																			<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																																				<fo:block>
																																					<xsl:for-each select="StateOrProvince">
																																						<xsl:for-each select="stateOrProvinceName">
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																								<xsl:apply-templates/>
																																							</fo:inline>
																																						</xsl:for-each>
																																						<xsl:for-each select="stateOrProvinceCode">
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																								<xsl:apply-templates/>
																																							</fo:inline>
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																						</xsl:for-each>
																																					</xsl:for-each>
																																				</fo:block>
																																			</fo:table-cell>
																																		</fo:table-row>
																																	</fo:table-body>
																																</fo:table>
																																<xsl:for-each select="Country">
																																	<xsl:for-each select="countryName">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="countryCode">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																	</xsl:for-each>
																																</xsl:for-each>
																															</xsl:for-each>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																													<fo:block>
																														<xsl:for-each select="ContactDetails">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Contact:</fo:inline>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																															<xsl:for-each select="personName">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="departmentName">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">dept: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="telephoneNumber">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Telephone: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="faxNumber">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Fax: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="e-MailAddress">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">E-mail: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																															</xsl:for-each>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																					</fo:table-body>
																				</fo:table>
																			</xsl:for-each>
																			<xsl:for-each select="Seller">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Seller</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block/>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<xsl:for-each select="organizationName">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Name: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="OrganizationIdentification">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identification: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																													<fo:block>
																														<xsl:for-each select="AddressInformation">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Address: </fo:inline>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																															<xsl:for-each select="FormattedAddress">
																																<xsl:for-each select="line">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates/>
																																	</fo:inline>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																</xsl:for-each>
																															</xsl:for-each>
																															<xsl:for-each select="NormalisedAddress">
																																<xsl:for-each select="StreetAddress">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates select="text()"/>
																																	</fo:inline>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																	<xsl:for-each select="line">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:block>
																																			<xsl:text>&#xA;</xsl:text>
																																		</fo:block>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																																	<fo:table-column/>
																																	<fo:table-column/>
																																	<fo:table-body>
																																		<fo:table-row>
																																			<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																																				<fo:block>
																																					<xsl:for-each select="city">
																																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																							<xsl:apply-templates/>
																																						</fo:inline>
																																					</xsl:for-each>
																																				</fo:block>
																																			</fo:table-cell>
																																			<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																																				<fo:block>
																																					<xsl:for-each select="StateOrProvince">
																																						<xsl:for-each select="stateOrProvinceName">
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																								<xsl:apply-templates/>
																																							</fo:inline>
																																						</xsl:for-each>
																																						<xsl:for-each select="stateOrProvinceCode">
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																								<xsl:apply-templates/>
																																							</fo:inline>
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																						</xsl:for-each>
																																					</xsl:for-each>
																																				</fo:block>
																																			</fo:table-cell>
																																		</fo:table-row>
																																	</fo:table-body>
																																</fo:table>
																																<xsl:for-each select="Country">
																																	<xsl:for-each select="countryName">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="countryCode">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																	</xsl:for-each>
																																</xsl:for-each>
																															</xsl:for-each>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																													<fo:block>
																														<xsl:for-each select="ContactDetails">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Contact:</fo:inline>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																															<xsl:for-each select="personName">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="departmentName">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">dept: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="telephoneNumber">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Telephone: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="faxNumber">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Fax: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="e-MailAddress">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">E-mail: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																															</xsl:for-each>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																					</fo:table-body>
																				</fo:table>
																			</xsl:for-each>
																			<xsl:for-each select="Broker">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Broker</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block/>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<xsl:for-each select="organizationName">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Name: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="OrganizationIdentification">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identification: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																													<fo:block>
																														<xsl:for-each select="AddressInformation">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Address: </fo:inline>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																															<xsl:for-each select="FormattedAddress">
																																<xsl:for-each select="line">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates/>
																																	</fo:inline>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																</xsl:for-each>
																															</xsl:for-each>
																															<xsl:for-each select="NormalisedAddress">
																																<xsl:for-each select="StreetAddress">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates select="text()"/>
																																	</fo:inline>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																	<xsl:for-each select="line">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:block>
																																			<xsl:text>&#xA;</xsl:text>
																																		</fo:block>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																																	<fo:table-column/>
																																	<fo:table-column/>
																																	<fo:table-body>
																																		<fo:table-row>
																																			<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																																				<fo:block>
																																					<xsl:for-each select="city">
																																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																							<xsl:apply-templates/>
																																						</fo:inline>
																																					</xsl:for-each>
																																				</fo:block>
																																			</fo:table-cell>
																																			<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																																				<fo:block>
																																					<xsl:for-each select="StateOrProvince">
																																						<xsl:for-each select="stateOrProvinceName">
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																								<xsl:apply-templates/>
																																							</fo:inline>
																																						</xsl:for-each>
																																						<xsl:for-each select="stateOrProvinceCode">
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																								<xsl:apply-templates/>
																																							</fo:inline>
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																						</xsl:for-each>
																																					</xsl:for-each>
																																				</fo:block>
																																			</fo:table-cell>
																																		</fo:table-row>
																																	</fo:table-body>
																																</fo:table>
																																<xsl:for-each select="Country">
																																	<xsl:for-each select="countryName">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="countryCode">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																	</xsl:for-each>
																																</xsl:for-each>
																															</xsl:for-each>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																													<fo:block>
																														<xsl:for-each select="ContactDetails">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Contact:</fo:inline>
																															<fo:block>
																																<fo:leader leader-pattern="space"/>
																															</fo:block>
																															<xsl:for-each select="personName">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="departmentName">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">dept: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="telephoneNumber">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Telephone: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="faxNumber">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Fax: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																															</xsl:for-each>
																															<xsl:for-each select="e-MailAddress">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">E-mail: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																															</xsl:for-each>
																															<fo:block>
																																<xsl:text>&#xA;</xsl:text>
																															</fo:block>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																					</fo:table-body>
																				</fo:table>
																			</xsl:for-each>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
													<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
														<fo:table-column/>
														<fo:table-body>
															<fo:table-row>
																<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Routing Summary</fo:inline>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
															<fo:table-row>
																<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="RoutingSummary">
																			<xsl:for-each select="estimatedDateOfAvailability">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Estimiated Date of Availability: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="dateOfArrivalAtDestination">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Date of Arrival at Destination: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="CountryOfDestination">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Country of Destination: </fo:inline>
																				<xsl:for-each select="countryName">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
																				</xsl:for-each>
																				<xsl:for-each select="locationCode">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																				</xsl:for-each>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="BillOfLadingIdentifier">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Bill of Lading</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<xsl:for-each select="documentNumber">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Number: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<xsl:for-each select="documentVersion">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Version: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<xsl:for-each select="documentCreatorIdentifier">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Creator Identifer: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																					</fo:table-body>
																				</fo:table>
																			</xsl:for-each>
																			<xsl:for-each select="billOfLadingDate">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Bill of Lading Date: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="PlaceOfOrigin">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Place of Origin: </fo:inline>
																				<xsl:for-each select="locationName">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																				</xsl:for-each>
																				<xsl:for-each select="locationCode">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																				</xsl:for-each>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="PlaceOfLoading">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Place of Loading: </fo:inline>
																				<xsl:for-each select="locationName">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																				</xsl:for-each>
																				<xsl:for-each select="locationCode">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																				</xsl:for-each>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="PlaceOfDischarge">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Place of Discharge: </fo:inline>
																				<xsl:for-each select="locationName">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																				</xsl:for-each>
																				<xsl:for-each select="locationCode">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																				</xsl:for-each>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="LocationOfStock">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Location of Stock: </fo:inline>
																				<xsl:for-each select="locationName">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																				</xsl:for-each>
																				<xsl:for-each select="storeNo">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(Store #: </fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																				</xsl:for-each>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="MeansOfTransport">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell text-align="center" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Means Of Transport</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Sea Transportation</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Rail Transportation</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Road Transportation</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<xsl:for-each select="SeaTransportIdentification">
																										<xsl:for-each select="Voyage">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Voyage:</fo:inline>
																											<fo:block>
																												<fo:leader leader-pattern="space"/>
																											</fo:block>
																											<xsl:for-each select="voyageNumber">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Voyage Number: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																												<fo:block>
																													<fo:leader leader-pattern="space"/>
																												</fo:block>
																											</xsl:for-each>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
																											<xsl:for-each select="estimatedDateOfArrivalAtDestination">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Estimated Date of Arival at Destination: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																											</xsl:for-each>
																											<xsl:for-each select="Vessel">
																												<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																													<fo:table-column/>
																													<fo:table-body>
																														<fo:table-row>
																															<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																																<fo:block>
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Vessel</fo:inline>
																																</fo:block>
																															</fo:table-cell>
																														</fo:table-row>
																														<fo:table-row>
																															<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																																<fo:block>
																																	<xsl:for-each select="vesselName">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Name: </fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																</fo:block>
																															</fo:table-cell>
																														</fo:table-row>
																														<fo:table-row>
																															<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																																<fo:block>
																																	<xsl:for-each select="carrier">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Carrier: </fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																</fo:block>
																															</fo:table-cell>
																														</fo:table-row>
																														<fo:table-row>
																															<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																																<fo:block>
																																	<xsl:for-each select="vesselFunction">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Function: </fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																</fo:block>
																															</fo:table-cell>
																														</fo:table-row>
																													</fo:table-body>
																												</fo:table>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																											</xsl:for-each>
																											<fo:block>
																												<fo:leader leader-pattern="space"/>
																											</fo:block>
																										</xsl:for-each>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<xsl:for-each select="RailTransportIdentification">
																										<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																											<fo:table-column/>
																											<fo:table-body>
																												<fo:table-row>
																													<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																														<fo:block>
																															<xsl:for-each select="carrier">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Carrier: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																															</xsl:for-each>
																														</fo:block>
																													</fo:table-cell>
																												</fo:table-row>
																												<fo:table-row>
																													<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																														<fo:block>
																															<xsl:for-each select="locomotiveNumber">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Location Number: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																															</xsl:for-each>
																														</fo:block>
																													</fo:table-cell>
																												</fo:table-row>
																												<fo:table-row>
																													<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																														<fo:block>
																															<xsl:for-each select="railCarNumber">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Rail Car Number: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																															</xsl:for-each>
																														</fo:block>
																													</fo:table-cell>
																												</fo:table-row>
																											</fo:table-body>
																										</fo:table>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<xsl:for-each select="RoadTransportIdentification">
																										<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																											<fo:table-column/>
																											<fo:table-body>
																												<fo:table-row>
																													<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																														<fo:block>
																															<xsl:for-each select="carrier">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Carrier: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																															</xsl:for-each>
																														</fo:block>
																													</fo:table-cell>
																												</fo:table-row>
																												<fo:table-row>
																													<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																														<fo:block>
																															<xsl:for-each select="licensePlateNumber">
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Licence Plate Number: </fo:inline>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																	<xsl:apply-templates/>
																																</fo:inline>
																															</xsl:for-each>
																														</fo:block>
																													</fo:table-cell>
																												</fo:table-row>
																											</fo:table-body>
																										</fo:table>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																					</fo:table-body>
																				</fo:table>
																			</xsl:for-each>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
													<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
														<fo:table-column/>
														<fo:table-body>
															<fo:table-row>
																<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Consignment</fo:inline>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
															<fo:table-row>
																<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="Consignment">
																			<xsl:for-each select="approvalDate">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Approval Date: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="fdaReleaseDate">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">FDA Release Date: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="customsReleaseDate">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Customs Release Date: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="Quantity">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Quantity: </fo:inline>
																				<xsl:for-each select="quantityValue">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																				</xsl:for-each>
																				<xsl:for-each select="quantityUnits">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt"> (</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																				</xsl:for-each>
																				<xsl:for-each select="packagingType">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(packaged:</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																				</xsl:for-each>
																			</xsl:for-each>
																			<xsl:for-each select="ProductQuality">
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Product:</fo:inline>
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<xsl:for-each select="product">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Name: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="CountryOfOrigin">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Country of Orgin: </fo:inline>
																										<xsl:for-each select="locationName">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																										</xsl:for-each>
																										<xsl:for-each select="locationCode">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																										</xsl:for-each>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="cropYear">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Crop Year: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="ProductDescription">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Description:</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																										<xsl:for-each select="ProductDescriptionCode">
																											<xsl:for-each select="codeValue">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Code: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																											</xsl:for-each>
																											<xsl:for-each select="codeReferenceType">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Code reference Type: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="productDescriptionText">
																											<fo:block space-before.optimum="4pt" space-after.optimum="4pt">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																											</fo:block>
																										</xsl:for-each>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																					</fo:table-body>
																				</fo:table>
																			</xsl:for-each>
																			<xsl:for-each select="ConsignmentDetails">
																				<xsl:for-each select="freightType">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Freight Type: </fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																				</xsl:for-each>
																				<xsl:for-each select="ConsignmentIdentifiers">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identifiers: </fo:inline>
																					<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																						<fo:table-column/>
																						<fo:table-body>
																							<fo:table-row>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																									<fo:block>
																										<xsl:for-each select="Container">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Container </fo:inline>
																											<xsl:for-each select="containerIdentification">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identification: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																												<fo:block>
																													<fo:leader leader-pattern="space"/>
																												</fo:block>
																											</xsl:for-each>
																											<xsl:for-each select="containerType">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Type: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																											</xsl:for-each>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																							</fo:table-row>
																							<fo:table-row>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																									<fo:block>
																										<xsl:for-each select="seal">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Seal: </fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																							</fo:table-row>
																							<fo:table-row>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																									<fo:block>
																										<xsl:for-each select="ShipmentMark">
																											<xsl:for-each select="icoMark">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">ICO Mark: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																												<fo:block>
																													<fo:leader leader-pattern="space"/>
																												</fo:block>
																											</xsl:for-each>
																											<xsl:for-each select="additionalMark">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Additional Mark: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																												<fo:block>
																													<fo:leader leader-pattern="space"/>
																												</fo:block>
																											</xsl:for-each>
																											<xsl:for-each select="numberOfBags">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Number of Bags: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																											</xsl:for-each>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																							</fo:table-row>
																							<fo:table-row>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																									<fo:block>
																										<xsl:for-each select="ContainerUnits">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Container Units: </fo:inline>
																											<xsl:for-each select="quantityValue">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																											</xsl:for-each>
																											<xsl:for-each select="quantityUnits">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(units: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																											</xsl:for-each>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																							</fo:table-row>
																							<fo:table-row>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																									<fo:block>
																										<xsl:for-each select="warehouseReceipt">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Warehouse Receipt: </fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																							</fo:table-row>
																							<fo:table-row>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																									<fo:block>
																										<xsl:for-each select="cargoNo">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Cargo Number: </fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																							</fo:table-row>
																							<fo:table-row>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																									<fo:block>
																										<xsl:for-each select="exchangeIdNo">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Exchange ID Number: </fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																							</fo:table-row>
																						</fo:table-body>
																					</fo:table>
																				</xsl:for-each>
																			</xsl:for-each>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
													<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
														<fo:table-column/>
														<fo:table-body>
															<fo:table-row>
																<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Invoice Details</fo:inline>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
															<fo:table-row>
																<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="InvoiceDetails">
																			<xsl:for-each select="InvoiceWeightInformtion">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Weight Information: </fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																				<xsl:for-each select="GrossWeight">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Gross: </fo:inline>
																					<xsl:for-each select="value">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</xsl:for-each>
																					<xsl:for-each select="weightUnitCode">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																					</xsl:for-each>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																				</xsl:for-each>
																				<xsl:for-each select="NetWeight">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Net: </fo:inline>
																					<xsl:for-each select="value">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</xsl:for-each>
																					<xsl:for-each select="weightUnitCode">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																					</xsl:for-each>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																				</xsl:for-each>
																				<xsl:for-each select="TareWeight">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Tare: </fo:inline>
																					<xsl:for-each select="value">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</xsl:for-each>
																					<xsl:for-each select="weightUnitCode">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																					</xsl:for-each>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																				</xsl:for-each>
																				<xsl:for-each select="SampleWeights">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Sample: </fo:inline>
																					<xsl:for-each select="value">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</xsl:for-each>
																					<xsl:for-each select="weightUnitCode">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																					</xsl:for-each>
																				</xsl:for-each>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<fo:block>
																				<fo:leader leader-pattern="space"/>
																			</fo:block>
																			<xsl:for-each select="InvoicePriceInformation">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Price Information:</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																				<xsl:for-each select="UnitPrice">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Unit Price:</fo:inline>
																					<fo:block>
																						<xsl:text>&#xA;</xsl:text>
																					</fo:block>
																					<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																						<fo:table-column/>
																						<fo:table-body>
																							<fo:table-row>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																									<fo:block>
																										<xsl:for-each select="UnitPriceFixedForDifferential">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Unit Price Fixed for Differential: </fo:inline>
																											<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																												<fo:table-column/>
																												<fo:table-body>
																													<fo:table-row>
																														<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																															<fo:block>
																																<xsl:for-each select="Differential">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Differential: </fo:inline>
																																	<xsl:for-each select="value">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="currencyUnit">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="priceUnits">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt"> Price Units: </fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																</xsl:for-each>
																																<xsl:for-each select="AverageFuturesPrice">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Average Futures Price: </fo:inline>
																																	<xsl:for-each select="value">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="futuresCurrencyUnit">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																	</xsl:for-each>
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
																																	<xsl:for-each select="futuresPriceUnits">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Price Units: </fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																</xsl:for-each>
																																<xsl:for-each select="assumedFuturesPrice">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Assumed Future Prices: </fo:inline>
																																	<xsl:for-each select="value">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="futuresCurrencyUnit">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="futuresPriceUnits">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Price Units: </fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																</xsl:for-each>
																																<xsl:for-each select="lotsFixed">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Lot Fixed: </fo:inline>
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates/>
																																	</fo:inline>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																</xsl:for-each>
																																<xsl:for-each select="lotsToBeFixed">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Lots to be Fixed: </fo:inline>
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates/>
																																	</fo:inline>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																</xsl:for-each>
																																<xsl:for-each select="netFixedPrice">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Net Fixed Price: </fo:inline>
																																	<xsl:for-each select="value">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="currencyUnit">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="priceUnits">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Price Units :</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																</xsl:for-each>
																																<xsl:for-each select="PriceFixDetails">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Price Fix Details:</fo:inline>
																																	<fo:block>
																																		<fo:leader leader-pattern="space"/>
																																	</fo:block>
																																	<xsl:for-each select="FuturesDeal">
																																		<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																																			<fo:table-column/>
																																			<fo:table-body>
																																				<fo:table-row>
																																					<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																																						<fo:block>
																																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Deal:</fo:inline>
																																							<fo:block>
																																								<fo:leader leader-pattern="space"/>
																																							</fo:block>
																																							<xsl:for-each select="FuturesMarket">
																																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Market: </fo:inline>
																																								<xsl:for-each select="futuresExchangeName">
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																										<xsl:apply-templates/>
																																									</fo:inline>
																																								</xsl:for-each>
																																								<xsl:for-each select="futuresExchangeCode">
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																										<xsl:apply-templates/>
																																									</fo:inline>
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																								</xsl:for-each>
																																								<fo:block>
																																									<fo:leader leader-pattern="space"/>
																																								</fo:block>
																																							</xsl:for-each>
																																							<xsl:for-each select="FuturesMonth">
																																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Futures Month: </fo:inline>
																																								<xsl:for-each select="futuresMonthName">
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																										<xsl:apply-templates/>
																																									</fo:inline>
																																								</xsl:for-each>
																																								<xsl:for-each select="futuresMonthCode">
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																										<xsl:apply-templates/>
																																									</fo:inline>
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																								</xsl:for-each>
																																								<fo:block>
																																									<fo:leader leader-pattern="space"/>
																																								</fo:block>
																																							</xsl:for-each>
																																							<xsl:for-each select="futuresYear">
																																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Future Years: </fo:inline>
																																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																									<xsl:apply-templates/>
																																								</fo:inline>
																																								<fo:block>
																																									<fo:leader leader-pattern="space"/>
																																								</fo:block>
																																							</xsl:for-each>
																																							<fo:block>
																																								<fo:leader leader-pattern="space"/>
																																							</fo:block>
																																							<xsl:for-each select="FixedFuturesPriceLevel">
																																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Fixed Future Price Level: </fo:inline>
																																								<xsl:for-each select="value">
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																										<xsl:apply-templates/>
																																									</fo:inline>
																																								</xsl:for-each>
																																								<xsl:for-each select="futuresCurrencyUnit">
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																										<xsl:apply-templates/>
																																									</fo:inline>
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																								</xsl:for-each>
																																								<xsl:for-each select="futuresPriceUnits">
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt"> Price Units: </fo:inline>
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																										<xsl:apply-templates/>
																																									</fo:inline>
																																								</xsl:for-each>
																																								<fo:block>
																																									<fo:leader leader-pattern="space"/>
																																								</fo:block>
																																							</xsl:for-each>
																																							<xsl:for-each select="FixedFuturesPriceInContractEquivalentUnits">
																																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Fixed Futures Price in Contract Equilivant Units: </fo:inline>
																																								<xsl:for-each select="value">
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																										<xsl:apply-templates/>
																																									</fo:inline>
																																								</xsl:for-each>
																																								<xsl:for-each select="priceUnits">
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Price Units: </fo:inline>
																																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																										<xsl:apply-templates/>
																																									</fo:inline>
																																								</xsl:for-each>
																																								<fo:block>
																																									<fo:leader leader-pattern="space"/>
																																								</fo:block>
																																							</xsl:for-each>
																																							<xsl:for-each select="futuresSettlementDate">
																																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Futures Settlement Date: </fo:inline>
																																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																									<xsl:apply-templates/>
																																								</fo:inline>
																																								<fo:block>
																																									<fo:leader leader-pattern="space"/>
																																								</fo:block>
																																							</xsl:for-each>
																																							<xsl:for-each select="numberOfLots">
																																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Number of Lots: </fo:inline>
																																								<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																									<xsl:apply-templates/>
																																								</fo:inline>
																																								<fo:block>
																																									<fo:leader leader-pattern="space"/>
																																								</fo:block>
																																							</xsl:for-each>
																																						</fo:block>
																																					</fo:table-cell>
																																				</fo:table-row>
																																			</fo:table-body>
																																		</fo:table>
																																	</xsl:for-each>
																																</xsl:for-each>
																															</fo:block>
																														</fo:table-cell>
																													</fo:table-row>
																												</fo:table-body>
																											</fo:table>
																										</xsl:for-each>
																										<xsl:for-each select="UnitPriceFixedForOutright">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Unit Price Fixed For Outright:</fo:inline>
																											<fo:block>
																												<xsl:text>&#xA;</xsl:text>
																											</fo:block>
																											<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																												<fo:table-column/>
																												<fo:table-body>
																													<fo:table-row>
																														<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																															<fo:block>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Price: </fo:inline>
																																<xsl:for-each select="value">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates/>
																																	</fo:inline>
																																</xsl:for-each>
																																<xsl:for-each select="currencyUnit">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates/>
																																	</fo:inline>
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																</xsl:for-each>
																																<fo:block>
																																	<fo:leader leader-pattern="space"/>
																																</fo:block>
																																<xsl:for-each select="priceUnits">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Price Units: </fo:inline>
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates/>
																																	</fo:inline>
																																</xsl:for-each>
																															</fo:block>
																														</fo:table-cell>
																													</fo:table-row>
																												</fo:table-body>
																											</fo:table>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																							</fo:table-row>
																						</fo:table-body>
																					</fo:table>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																				</xsl:for-each>
																				<xsl:for-each select="Allowance">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Allowance: </fo:inline>
																					<xsl:for-each select="value">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</xsl:for-each>
																					<xsl:for-each select="currencyUnit">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																					</xsl:for-each>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;&#160;&#160; </fo:inline>
																					<xsl:for-each select="priceUnits">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Allowance Unit Price: </fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</xsl:for-each>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																				</xsl:for-each>
																				<xsl:for-each select="InvoiceUnitPrice">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Unit Price: </fo:inline>
																					<xsl:for-each select="value">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</xsl:for-each>
																					<xsl:for-each select="currencyUnit">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																						<fo:block>
																							<fo:leader leader-pattern="space"/>
																						</fo:block>
																					</xsl:for-each>
																					<xsl:for-each select="priceUnits">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Invoice Price Units: </fo:inline>
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</xsl:for-each>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																				</xsl:for-each>
																			</xsl:for-each>
																			<fo:block>
																				<fo:leader leader-pattern="space"/>
																			</fo:block>
																			<fo:block>
																				<fo:leader leader-pattern="space"/>
																			</fo:block>
																			<xsl:for-each select="NetAmount">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Net Ammount: </fo:inline>
																				<xsl:for-each select="value">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																				</xsl:for-each>
																				<xsl:for-each select="currencyUnit">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																				</xsl:for-each>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="Adjustments">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Adjustments:</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																				<xsl:for-each select="AdjustmentItem">
																					<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																						<fo:table-column/>
																						<fo:table-column/>
																						<fo:table-body>
																							<fo:table-row>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																									<fo:block>
																										<xsl:for-each select="description">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Description: </fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																											<fo:block>
																												<fo:leader leader-pattern="space"/>
																											</fo:block>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																									<fo:block>
																										<xsl:for-each select="value">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																										</xsl:for-each>
																										<xsl:for-each select="currencyUnit">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																							</fo:table-row>
																						</fo:table-body>
																					</fo:table>
																				</xsl:for-each>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
																			</xsl:for-each>
																			<xsl:for-each select="TotalAmount">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Total Amount: </fo:inline>
																				<xsl:for-each select="value">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																				</xsl:for-each>
																				<xsl:for-each select="currencyUnit">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																				</xsl:for-each>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="PreviousInvoices">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Previous Invoices: </fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																				<xsl:for-each select="InvoiceDetails">
																					<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																						<fo:table-column column-width="292pt"/>
																						<fo:table-column/>
																						<fo:table-body>
																							<fo:table-row>
																								<fo:table-cell height="169pt" width="292pt" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																									<fo:block>
																										<xsl:for-each select="InvoiceNumber">
																											<xsl:for-each select="documentCreatorIdentifier">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Creator Idenitifier: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																												<fo:block>
																													<fo:leader leader-pattern="space"/>
																												</fo:block>
																											</xsl:for-each>
																											<xsl:for-each select="documentNumber">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Number: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																												<fo:block>
																													<fo:leader leader-pattern="space"/>
																												</fo:block>
																											</xsl:for-each>
																											<xsl:for-each select="documentVersion">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Document Version: </fo:inline>
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																											</xsl:for-each>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																								<fo:table-cell height="169pt" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																									<fo:block>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt"> Amount: </fo:inline>
																										<xsl:for-each select="value">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
																										</xsl:for-each>
																										<xsl:for-each select="currencyUnit">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																										</xsl:for-each>
																									</fo:block>
																								</fo:table-cell>
																							</fo:table-row>
																						</fo:table-body>
																					</fo:table>
																				</xsl:for-each>
																			</xsl:for-each>
																			<fo:block>
																				<fo:leader leader-pattern="space"/>
																			</fo:block>
																			<fo:block>
																				<fo:leader leader-pattern="space"/>
																			</fo:block>
																			<xsl:for-each select="percentAmountPayable">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Percent Amount Payable: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="PaymentReceived">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Payment Received:&#160; </fo:inline>
																				<xsl:for-each select="value">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																				</xsl:for-each>
																				<xsl:for-each select="currencyUnit">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt"> (</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																				</xsl:for-each>
																				<fo:block>
																					<xsl:text>&#xA;</xsl:text>
																				</fo:block>
																			</xsl:for-each>
																			<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																				<fo:table-column column-width="435pt"/>
																				<fo:table-column/>
																				<fo:table-body>
																					<fo:table-row>
																						<fo:table-cell width="435pt" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																							<fo:block>
																								<xsl:for-each select="AmountDue">
																									<fo:table background-color="silver" width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																													<fo:block>
																														<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">AMOUNT DUE: </fo:inline>
																													</fo:block>
																												</fo:table-cell>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																													<fo:block>
																														<xsl:for-each select="value">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																														<xsl:for-each select="currencyUnit">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
																								</xsl:for-each>
																							</fo:block>
																						</fo:table-cell>
																						<fo:table-cell text-align="right" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																							<fo:block>
																								<xsl:for-each select="dueDate">
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Due Date: </fo:inline>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																										<xsl:apply-templates/>
																									</fo:inline>
																								</xsl:for-each>
																							</fo:block>
																						</fo:table-cell>
																					</fo:table-row>
																				</fo:table-body>
																			</fo:table>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
													<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
														<fo:table-column/>
														<fo:table-body>
															<fo:table-row>
																<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Instructional Information</fo:inline>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
															<fo:table-row>
																<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="InstructionalInformation">
																			<xsl:for-each select="deliveryDate">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Delivery Date: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="MoveOrDeliverPeriod">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Move or Deliver Period: </fo:inline>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<xsl:for-each select="startDate">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Start Date: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="endDate">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">End Date: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																									<xsl:for-each select="positionOfSale">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Position od Sale: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																					</fo:table-body>
																				</fo:table>
																			</xsl:for-each>
																			<xsl:for-each select="DeliveryLocation">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Delivery Location: </fo:inline>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																													<fo:block>
																														<xsl:for-each select="organizationName">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Name: </fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																													<fo:block>
																														<xsl:for-each select="OrganizationIdentification">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identfication: </fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<xsl:for-each select="AddressInformation">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Address: </fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																										<xsl:for-each select="FormattedAddress">
																											<xsl:for-each select="line">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates/>
																												</fo:inline>
																												<fo:block>
																													<fo:leader leader-pattern="space"/>
																												</fo:block>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="NormalisedAddress">
																											<xsl:for-each select="StreetAddress">
																												<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																													<xsl:apply-templates select="text()"/>
																												</fo:inline>
																												<fo:block>
																													<fo:leader leader-pattern="space"/>
																												</fo:block>
																												<xsl:for-each select="line">
																													<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																														<xsl:apply-templates/>
																													</fo:inline>
																													<fo:block>
																														<xsl:text>&#xA;</xsl:text>
																													</fo:block>
																												</xsl:for-each>
																											</xsl:for-each>
																											<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																												<fo:table-column/>
																												<fo:table-column/>
																												<fo:table-body>
																													<fo:table-row>
																														<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																															<fo:block>
																																<xsl:for-each select="city">
																																	<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																		<xsl:apply-templates/>
																																	</fo:inline>
																																</xsl:for-each>
																															</fo:block>
																														</fo:table-cell>
																														<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																															<fo:block>
																																<xsl:for-each select="StateOrProvince">
																																	<xsl:for-each select="stateOrProvinceName">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																	</xsl:for-each>
																																	<xsl:for-each select="stateOrProvinceCode">
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																			<xsl:apply-templates/>
																																		</fo:inline>
																																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																																	</xsl:for-each>
																																</xsl:for-each>
																															</fo:block>
																														</fo:table-cell>
																													</fo:table-row>
																												</fo:table-body>
																											</fo:table>
																											<xsl:for-each select="Country">
																												<xsl:for-each select="countryName">
																													<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																														<xsl:apply-templates/>
																													</fo:inline>
																												</xsl:for-each>
																												<xsl:for-each select="countryCode">
																													<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																													<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																														<xsl:apply-templates/>
																													</fo:inline>
																													<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																												</xsl:for-each>
																											</xsl:for-each>
																										</xsl:for-each>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<xsl:for-each select="ContactDetails">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Contact:</fo:inline>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																										<xsl:for-each select="personName">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																											<fo:block>
																												<fo:leader leader-pattern="space"/>
																											</fo:block>
																										</xsl:for-each>
																										<xsl:for-each select="departmentName">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">dept: </fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																											<fo:block>
																												<fo:leader leader-pattern="space"/>
																											</fo:block>
																										</xsl:for-each>
																										<xsl:for-each select="telephoneNumber">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Telephone: </fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																											<fo:block>
																												<fo:leader leader-pattern="space"/>
																											</fo:block>
																										</xsl:for-each>
																										<xsl:for-each select="faxNumber">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Fax: </fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																											<fo:block>
																												<fo:leader leader-pattern="space"/>
																											</fo:block>
																										</xsl:for-each>
																										<xsl:for-each select="e-MailAddress">
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">E-mail: </fo:inline>
																											<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																												<xsl:apply-templates/>
																											</fo:inline>
																										</xsl:for-each>
																										<fo:block>
																											<fo:leader leader-pattern="space"/>
																										</fo:block>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																					</fo:table-body>
																				</fo:table>
																			</xsl:for-each>
																			<xsl:for-each select="responsibilityOfWeighing">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Responsibility of Weighing: </fo:inline>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																					<xsl:apply-templates/>
																				</fo:inline>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																			</xsl:for-each>
																			<xsl:for-each select="WeighingMethod">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Weighing Method: </fo:inline>
																				<xsl:for-each select="weighingMethodCode">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Code: </fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																				</xsl:for-each>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																				<xsl:for-each select="weighingMethodDescription">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Description:</fo:inline>
																					<fo:block space-before.optimum="4pt" space-after.optimum="4pt">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</fo:block>
																				</xsl:for-each>
																			</xsl:for-each>
																			<xsl:for-each select="PaymentTerms">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Payment Terms: </fo:inline>
																				<xsl:for-each select="paymentTermsCode">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Code: </fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																				</xsl:for-each>
																				<fo:block>
																					<fo:leader leader-pattern="space"/>
																				</fo:block>
																				<xsl:for-each select="paymentTermsDescription">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Description: </fo:inline>
																					<fo:block space-before.optimum="4pt" space-after.optimum="4pt">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</fo:block>
																				</xsl:for-each>
																			</xsl:for-each>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
													<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
														<fo:table-column/>
														<fo:table-body>
															<fo:table-row>
																<fo:table-cell text-align="center" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																	<fo:block>
																		<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Additional Information</fo:inline>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
															<fo:table-row>
																<fo:table-cell height="42pt" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																	<fo:block/>
																</fo:table-cell>
																<fo:table-cell height="42pt" text-align="center" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																	<fo:block>
																		<xsl:for-each select="AdditionalInformation">
																			<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																				<xsl:apply-templates/>
																			</fo:inline>
																		</xsl:for-each>
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell height="42pt" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																	<fo:block/>
																</fo:table-cell>
															</fo:table-row>
															<fo:table-row>
																<fo:table-cell height="13pt" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																	<fo:block/>
																</fo:table-cell>
																<fo:table-cell height="13pt" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																	<fo:block/>
																</fo:table-cell>
																<fo:table-cell height="13pt" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																	<fo:block/>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</xsl:for-each>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</xsl:for-each>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
