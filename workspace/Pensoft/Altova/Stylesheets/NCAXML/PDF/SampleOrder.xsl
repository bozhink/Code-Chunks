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
						<xsl:for-each select="SampleOrder">
							<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
								<fo:table-column/>
								<fo:table-column/>
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
											<fo:block>
												<fo:inline font-size="20pt" font-weight="bold">NCA Sample Order:</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell text-align="right" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
											<fo:block>
												<xsl:for-each select="Header">
													<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
														<fo:table-column/>
														<fo:table-body>
															<fo:table-row>
																<fo:table-cell text-align="right" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																	<fo:block>
																		<xsl:for-each select="documentID">Document ID: <xsl:apply-templates/>
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
												</xsl:for-each>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
							<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
								<fo:table-column column-width="32pt"/>
								<fo:table-column/>
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell width="32pt" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
											<fo:block/>
										</fo:table-cell>
										<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
											<fo:block>
												<xsl:for-each select="Body">
													<xsl:for-each select="GeneralInformation">
														<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
															<fo:table-column/>
															<fo:table-column/>
															<fo:table-body>
																<fo:table-row>
																	<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																		<fo:block>
																			<fo:inline border-after-color="black" font-size="inherited-property-value(&apos;font-size&apos;) - 2pt" font-weight="bold">General Information:</fo:inline>
																		</fo:block>
																	</fo:table-cell>
																	<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" text-align="right" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																		<fo:block>
																			<xsl:for-each select="dateOfIssue">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Date Of Issue: </fo:inline>
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
																			<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																				<fo:table-column/>
																				<fo:table-column/>
																				<fo:table-body>
																					<fo:table-row>
																						<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																							<fo:block>
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
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">E-transaction Number: </fo:inline>
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
																								</xsl:for-each>
																							</fo:block>
																						</fo:table-cell>
																						<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																							<fo:block>
																								<xsl:for-each select="ContractIdentifier">
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
																					</fo:table-row>
																				</fo:table-body>
																			</fo:table>
																		</fo:block>
																	</fo:table-cell>
																</fo:table-row>
															</fo:table-body>
														</fo:table>
													</xsl:for-each>
													<xsl:for-each select="Parties">
														<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
															<fo:table-column/>
															<fo:table-body>
																<fo:table-row>
																	<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																		<fo:block>
																			<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt" font-weight="bold">Parties</fo:inline>
																		</fo:block>
																	</fo:table-cell>
																</fo:table-row>
															</fo:table-body>
														</fo:table>
														<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
															<fo:table-column/>
															<fo:table-body>
																<fo:table-row>
																	<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																		<fo:block>
																			<xsl:for-each select="Buyer">
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Buyer:</fo:inline>
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<xsl:for-each select="organizationName">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Name: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																							<fo:table-cell text-align="left" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																								<fo:block>
																									<xsl:for-each select="OrganizationIdentification">
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identification: </fo:inline>
																										<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																											<xsl:apply-templates/>
																										</fo:inline>
																									</xsl:for-each>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																					</fo:table-body>
																				</fo:table>
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
																			</xsl:for-each>
																			<xsl:for-each select="Seller">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Seller: </fo:inline>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																													<fo:block>
																														<xsl:for-each select="organizationName">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Name: </fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																													<fo:block>
																														<xsl:for-each select="OrganizationIdentification">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identification: </fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
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
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
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
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Broker:</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																													<fo:block>
																														<xsl:for-each select="organizationName">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Name: </fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																													<fo:block>
																														<xsl:for-each select="OrganizationIdentification">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identification: </fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
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
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
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
																			<xsl:for-each select="Sampler">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Sampler</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
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
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																													<fo:block>
																														<xsl:for-each select="OrganizationIdentification">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identification: </fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
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
																			<xsl:for-each select="DeliverSamplesTo">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Deliver Samples To: </fo:inline>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
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
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																													<fo:block>
																														<xsl:for-each select="OrganizationIdentification">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identification: </fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
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
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
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
													<xsl:for-each select="RoutingSummary">
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
															</fo:table-body>
														</fo:table>
														<xsl:for-each select="estimatedDateOfAvailability">
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Estimiated Date of Availability: </fo:inline>
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																<xsl:apply-templates/>
															</fo:inline>
															<fo:block>
																<fo:leader leader-pattern="space"/>
															</fo:block>
														</xsl:for-each>
														<xsl:for-each select="estimatedDateOfArrivalAtDestination">
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Estimated Date of Arrival at Dest.:</fo:inline>
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
													<xsl:for-each select="Consignment">
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
															</fo:table-body>
														</fo:table>
														<xsl:for-each select="CustomsReleaseDate">
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Customs Release Date: </fo:inline>
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																<xsl:apply-templates/>
															</fo:inline>
															<fo:block>
																<fo:leader leader-pattern="space"/>
															</fo:block>
														</xsl:for-each>
														<xsl:for-each select="FDAReleaseDate">
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">FDA Release Date: </fo:inline>
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																<xsl:apply-templates/>
															</fo:inline>
															<fo:block>
																<fo:leader leader-pattern="space"/>
															</fo:block>
														</xsl:for-each>
														<xsl:for-each select="ProductQuality">
															<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																<fo:table-column/>
																<fo:table-body>
																	<fo:table-row>
																		<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																			<fo:block>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Quality: </fo:inline>
																			</fo:block>
																		</fo:table-cell>
																	</fo:table-row>
																	<fo:table-row>
																		<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																			<fo:block>
																				<xsl:for-each select="product">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Product: </fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																				</xsl:for-each>
																				<xsl:for-each select="CountryOfOrigin">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Country Of Origin: </fo:inline>
																					<xsl:for-each select="locationName">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																							<xsl:apply-templates/>
																						</fo:inline>
																					</xsl:for-each>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
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
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Description Information:</fo:inline>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
																					<xsl:for-each select="ProductDescriptionCode">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Code: </fo:inline>
																						<xsl:for-each select="codeValue">
																							<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																								<xsl:apply-templates/>
																							</fo:inline>
																						</xsl:for-each>
																						<xsl:for-each select="codeReferenceType">
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
																					<xsl:for-each select="productDescriptionText">
																						<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Description:</fo:inline>
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
														<xsl:for-each select="QuantityAvailableForSampling">
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Quanity Available for Sampling: </fo:inline>
															<xsl:for-each select="quantityValue">
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																	<xsl:apply-templates/>
																</fo:inline>
															</xsl:for-each>
															<xsl:for-each select="quantityUnits">
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">(</fo:inline>
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																	<xsl:apply-templates/>
																</fo:inline>
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">)</fo:inline>
																<fo:block>
																	<fo:leader leader-pattern="space"/>
																</fo:block>
															</xsl:for-each>
															<xsl:for-each select="packagingType">
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Packaging: </fo:inline>
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																	<xsl:apply-templates/>
																</fo:inline>
															</xsl:for-each>
															<fo:block>
																<fo:leader leader-pattern="space"/>
															</fo:block>
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;</fo:inline>
														</xsl:for-each>
														<xsl:for-each select="SamplingLocation">
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Sampling Location: </fo:inline>
															<fo:block>
																<fo:leader leader-pattern="space"/>
															</fo:block>
															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;&#160;&#160; </fo:inline>
															<xsl:for-each select="placeName">
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Place Name: </fo:inline>
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																	<xsl:apply-templates/>
																</fo:inline>
																<fo:block>
																	<fo:leader leader-pattern="space"/>
																</fo:block>
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;&#160;&#160; </fo:inline>
															</xsl:for-each>
															<xsl:for-each select="placelocation">
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Place Location: </fo:inline>
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																	<xsl:apply-templates/>
																</fo:inline>
																<fo:block>
																	<fo:leader leader-pattern="space"/>
																</fo:block>
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">&#160;&#160;&#160; </fo:inline>
															</xsl:for-each>
															<xsl:for-each select="locationCode">
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Location Code: </fo:inline>
																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																	<xsl:apply-templates/>
																</fo:inline>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="ConsignmentDetails">
															<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																<fo:table-column/>
																<fo:table-body>
																	<fo:table-row>
																		<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																			<fo:block>
																				<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Details: </fo:inline>
																			</fo:block>
																		</fo:table-cell>
																	</fo:table-row>
																	<fo:table-row>
																		<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																			<fo:block>
																				<xsl:for-each select="freightType">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Freight Type: </fo:inline>
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																						<xsl:apply-templates/>
																					</fo:inline>
																					<fo:block>
																						<fo:leader leader-pattern="space"/>
																					</fo:block>
																				</xsl:for-each>
																				<xsl:for-each select="GrossWeight">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Gross Weight: </fo:inline>
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
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Net Weight: </fo:inline>
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
																				<xsl:for-each select="ConsignmentIdentifiers">
																					<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identifiers: </fo:inline>
																					<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																						<fo:table-column/>
																						<fo:table-body>
																							<fo:table-row>
																								<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																									<fo:block>
																										<xsl:for-each select="BillOfLadingIdentifier">
																											<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																												<fo:table-column/>
																												<fo:table-column/>
																												<fo:table-body>
																													<fo:table-row>
																														<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																															<fo:block>
																																<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Bill of Lading </fo:inline>
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
																													</fo:table-row>
																													<fo:table-row>
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
																													</fo:table-row>
																												</fo:table-body>
																											</fo:table>
																										</xsl:for-each>
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
																										<xsl:for-each select="WarehouseReceipt">
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
																			</fo:block>
																		</fo:table-cell>
																	</fo:table-row>
																</fo:table-body>
															</fo:table>
														</xsl:for-each>
													</xsl:for-each>
													<xsl:for-each select="InstructionalInformation">
														<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
															<fo:table-column/>
															<fo:table-body>
																<fo:table-row>
																	<fo:table-cell border-after-color="black" border-after-style="solid" border-after-width="thin" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																		<fo:block>
																			<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Instructional Infomation:</fo:inline>
																		</fo:block>
																	</fo:table-cell>
																</fo:table-row>
																<fo:table-row>
																	<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																		<fo:block>
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
																			<xsl:for-each select="SamplingOnAccountOf">
																				<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																					<fo:table-column/>
																					<fo:table-body>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Sampling on Account of:</fo:inline>
																								</fo:block>
																							</fo:table-cell>
																						</fo:table-row>
																						<fo:table-row>
																							<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
																								<fo:block>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																													<fo:block>
																														<xsl:for-each select="organizationName">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Name: </fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
																													<fo:block>
																														<xsl:for-each select="OrganizationIdentification">
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">Identification: </fo:inline>
																															<fo:inline font-size="inherited-property-value(&apos;font-size&apos;) - 2pt">
																																<xsl:apply-templates/>
																															</fo:inline>
																														</xsl:for-each>
																													</fo:block>
																												</fo:table-cell>
																											</fo:table-row>
																										</fo:table-body>
																									</fo:table>
																									<fo:table width="100%" space-before.optimum="4pt" space-after.optimum="4pt">
																										<fo:table-column/>
																										<fo:table-column/>
																										<fo:table-body>
																											<fo:table-row>
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
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
																												<fo:table-cell padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt">
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
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
