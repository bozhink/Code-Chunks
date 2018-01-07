<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:template match="/">
		<html>
			<head/>
			<body>
				<xsl:for-each select="Invoice">
					<xsl:for-each select="Header">
						<table width="100%">
							<tbody>
								<tr>
									<td valign="top">
										<span style="font-size:large; font-weight:bold">NCA INVOICE</span>
									</td>
									<td align="right">
										<table width="100%">
											<tbody>
												<tr>
													<td align="right">
														<xsl:for-each select="documentID">Document ID<xsl:apply-templates/>
														</xsl:for-each>
													</td>
												</tr>
												<tr>
													<td align="right">
														<xsl:for-each select="invoiceType">Invoice Type: <xsl:apply-templates/>
														</xsl:for-each>
													</td>
												</tr>
												<tr>
													<td align="right">
														<xsl:for-each select="status">Status: <xsl:apply-templates/>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<table width="100%">
						<tbody>
							<tr>
								<td width="57"/>
								<td>
									<xsl:for-each select="Body">
										<table width="100%">
											<tbody>
												<tr>
													<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin">
														<span style="font-size:smaller">General Information</span>
													</td>
													<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin" align="right">
														<xsl:for-each select="GeneralInformation">
															<xsl:for-each select="dateOfIssue">
																<span style="font-size:smaller">Date of Issue: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</xsl:for-each>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<xsl:for-each select="GeneralInformation">
															<xsl:for-each select="contractType">
																<span style="font-size:smaller">Contract Type: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="e-TransactionNumber">
																<span style="font-size:smaller">E-Transaction Number: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="buyerContractIdentifier">
																<span style="font-size:smaller">Buyer Contract Identifer: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="sellerContractIdentifier">
																<span style="font-size:smaller">Seller Contract Identifer: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="brokerContractIdentifier">
																<span style="font-size:smaller">Broker Contract Identifer: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<table border="1" width="100%">
																<tbody>
																	<tr>
																		<td align="center">
																			<span style="font-size:smaller">Contract Identifer</span>
																		</td>
																		<td align="center">
																			<span style="font-size:smaller">Invoice Number</span>
																		</td>
																	</tr>
																	<tr>
																		<td valign="top">
																			<xsl:for-each select="ContractIdentifier">
																				<xsl:for-each select="documentCreatorIdentifier">
																					<span style="font-size:smaller">Document Creator Identifier: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="documentNumber">
																					<span style="font-size:smaller">Document Number: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="documentVersion">
																					<span style="font-size:smaller">Document Version: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="contractExtension">
																					<span style="font-size:smaller">Contract Extention: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																				</xsl:for-each>
																			</xsl:for-each>
																		</td>
																		<td valign="top">
																			<xsl:for-each select="InvoiceNumber">
																				<xsl:for-each select="documentCreatorIdentifier">
																					<span style="font-size:smaller">Document Creator Identifer: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="documentNumber">
																					<span style="font-size:smaller">Document Number: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="documentVersion">
																					<span style="font-size:smaller">Document Version: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																				</xsl:for-each>
																			</xsl:for-each>
																		</td>
																	</tr>
																</tbody>
															</table>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<table width="100%">
											<tbody>
												<tr>
													<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin">
														<span style="font-size:smaller">Parties</span>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:for-each select="Parties">
															<xsl:for-each select="Buyer">
																<table width="100%">
																	<tbody>
																		<tr>
																			<td colspan="2">
																				<span style="font-size:smaller">Buyer:</span>
																			</td>
																		</tr>
																		<tr>
																			<td colspan="2">
																				<br/>
																				<xsl:for-each select="organizationName">
																					<span style="font-size:smaller">Name: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="OrganizationIdentification">
																					<span style="font-size:smaller">Identification: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																				</xsl:for-each>
																				<table border="1" width="100%">
																					<tbody>
																						<tr>
																							<td>
																								<xsl:for-each select="AddressInformation">
																									<span style="font-size:smaller">Address: </span>
																									<br/>
																									<xsl:for-each select="FormattedAddress">
																										<xsl:for-each select="line">
																											<span style="font-size:smaller">
																												<xsl:apply-templates/>
																											</span>
																											<br/>
																										</xsl:for-each>
																									</xsl:for-each>
																									<xsl:for-each select="NormalisedAddress">
																										<xsl:for-each select="StreetAddress">
																											<span style="font-size:smaller">
																												<xsl:apply-templates select="text()"/>
																											</span>
																											<br/>
																											<xsl:for-each select="line">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<br/>
																											</xsl:for-each>
																										</xsl:for-each>
																										<table>
																											<tbody>
																												<tr>
																													<td>
																														<xsl:for-each select="city">
																															<span style="font-size:smaller">
																																<xsl:apply-templates/>
																															</span>
																														</xsl:for-each>
																													</td>
																													<td>
																														<xsl:for-each select="StateOrProvince">
																															<xsl:for-each select="stateOrProvinceName">
																																<span style="font-size:smaller">
																																	<xsl:apply-templates/>
																																</span>
																															</xsl:for-each>
																															<xsl:for-each select="stateOrProvinceCode">
																																<span style="font-size:smaller">(</span>
																																<span style="font-size:smaller">
																																	<xsl:apply-templates/>
																																</span>
																																<span style="font-size:smaller">)</span>
																															</xsl:for-each>
																														</xsl:for-each>
																													</td>
																												</tr>
																											</tbody>
																										</table>
																										<xsl:for-each select="Country">
																											<xsl:for-each select="countryName">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<xsl:for-each select="countryCode">
																												<span style="font-size:smaller">(</span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<span style="font-size:smaller">)</span>
																											</xsl:for-each>
																										</xsl:for-each>
																									</xsl:for-each>
																									<br/>
																									<span style="font-size:smaller">&#160;</span>
																								</xsl:for-each>
																							</td>
																							<td>
																								<xsl:for-each select="ContactDetails">
																									<span style="font-size:smaller">Contact:</span>
																									<br/>
																									<xsl:for-each select="personName">
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="departmentName">
																										<span style="font-size:smaller">dept: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="telephoneNumber">
																										<span style="font-size:smaller">Telephone: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="faxNumber">
																										<span style="font-size:smaller">Fax: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="e-MailAddress">
																										<span style="font-size:smaller">E-mail: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																									</xsl:for-each>
																									<br/>
																								</xsl:for-each>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</xsl:for-each>
															<xsl:for-each select="Seller">
																<table width="100%">
																	<tbody>
																		<tr>
																			<td>
																				<span style="font-size:smaller">Seller</span>
																			</td>
																			<td/>
																		</tr>
																		<tr>
																			<td colspan="2">
																				<xsl:for-each select="organizationName">
																					<span style="font-size:smaller">Name: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="OrganizationIdentification">
																					<span style="font-size:smaller">Identification: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																				</xsl:for-each>
																				<table border="1" width="100%">
																					<tbody>
																						<tr>
																							<td>
																								<xsl:for-each select="AddressInformation">
																									<span style="font-size:smaller">Address: </span>
																									<br/>
																									<xsl:for-each select="FormattedAddress">
																										<xsl:for-each select="line">
																											<span style="font-size:smaller">
																												<xsl:apply-templates/>
																											</span>
																											<br/>
																										</xsl:for-each>
																									</xsl:for-each>
																									<xsl:for-each select="NormalisedAddress">
																										<xsl:for-each select="StreetAddress">
																											<span style="font-size:smaller">
																												<xsl:apply-templates select="text()"/>
																											</span>
																											<br/>
																											<xsl:for-each select="line">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<br/>
																											</xsl:for-each>
																										</xsl:for-each>
																										<table>
																											<tbody>
																												<tr>
																													<td>
																														<xsl:for-each select="city">
																															<span style="font-size:smaller">
																																<xsl:apply-templates/>
																															</span>
																														</xsl:for-each>
																													</td>
																													<td>
																														<xsl:for-each select="StateOrProvince">
																															<xsl:for-each select="stateOrProvinceName">
																																<span style="font-size:smaller">
																																	<xsl:apply-templates/>
																																</span>
																															</xsl:for-each>
																															<xsl:for-each select="stateOrProvinceCode">
																																<span style="font-size:smaller">(</span>
																																<span style="font-size:smaller">
																																	<xsl:apply-templates/>
																																</span>
																																<span style="font-size:smaller">)</span>
																															</xsl:for-each>
																														</xsl:for-each>
																													</td>
																												</tr>
																											</tbody>
																										</table>
																										<xsl:for-each select="Country">
																											<xsl:for-each select="countryName">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<xsl:for-each select="countryCode">
																												<span style="font-size:smaller">(</span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<span style="font-size:smaller">)</span>
																											</xsl:for-each>
																										</xsl:for-each>
																									</xsl:for-each>
																									<br/>
																									<span style="font-size:smaller">&#160;</span>
																								</xsl:for-each>
																							</td>
																							<td>
																								<xsl:for-each select="ContactDetails">
																									<span style="font-size:smaller">Contact:</span>
																									<br/>
																									<xsl:for-each select="personName">
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="departmentName">
																										<span style="font-size:smaller">dept: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="telephoneNumber">
																										<span style="font-size:smaller">Telephone: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="faxNumber">
																										<span style="font-size:smaller">Fax: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="e-MailAddress">
																										<span style="font-size:smaller">E-mail: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																									</xsl:for-each>
																									<br/>
																								</xsl:for-each>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</xsl:for-each>
															<xsl:for-each select="Broker">
																<table width="100%">
																	<tbody>
																		<tr>
																			<td>
																				<span style="font-size:smaller">Broker</span>
																			</td>
																			<td/>
																		</tr>
																		<tr>
																			<td colspan="2">
																				<xsl:for-each select="organizationName">
																					<span style="font-size:smaller">Name: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="OrganizationIdentification">
																					<span style="font-size:smaller">Identification: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																				</xsl:for-each>
																				<table border="1" width="100%">
																					<tbody>
																						<tr>
																							<td>
																								<xsl:for-each select="AddressInformation">
																									<span style="font-size:smaller">Address: </span>
																									<br/>
																									<xsl:for-each select="FormattedAddress">
																										<xsl:for-each select="line">
																											<span style="font-size:smaller">
																												<xsl:apply-templates/>
																											</span>
																											<br/>
																										</xsl:for-each>
																									</xsl:for-each>
																									<xsl:for-each select="NormalisedAddress">
																										<xsl:for-each select="StreetAddress">
																											<span style="font-size:smaller">
																												<xsl:apply-templates select="text()"/>
																											</span>
																											<br/>
																											<xsl:for-each select="line">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<br/>
																											</xsl:for-each>
																										</xsl:for-each>
																										<table>
																											<tbody>
																												<tr>
																													<td>
																														<xsl:for-each select="city">
																															<span style="font-size:smaller">
																																<xsl:apply-templates/>
																															</span>
																														</xsl:for-each>
																													</td>
																													<td>
																														<xsl:for-each select="StateOrProvince">
																															<xsl:for-each select="stateOrProvinceName">
																																<span style="font-size:smaller">
																																	<xsl:apply-templates/>
																																</span>
																															</xsl:for-each>
																															<xsl:for-each select="stateOrProvinceCode">
																																<span style="font-size:smaller">(</span>
																																<span style="font-size:smaller">
																																	<xsl:apply-templates/>
																																</span>
																																<span style="font-size:smaller">)</span>
																															</xsl:for-each>
																														</xsl:for-each>
																													</td>
																												</tr>
																											</tbody>
																										</table>
																										<xsl:for-each select="Country">
																											<xsl:for-each select="countryName">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<xsl:for-each select="countryCode">
																												<span style="font-size:smaller">(</span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<span style="font-size:smaller">)</span>
																											</xsl:for-each>
																										</xsl:for-each>
																									</xsl:for-each>
																									<br/>
																									<span style="font-size:smaller">&#160;</span>
																								</xsl:for-each>
																							</td>
																							<td>
																								<xsl:for-each select="ContactDetails">
																									<span style="font-size:smaller">Contact:</span>
																									<br/>
																									<xsl:for-each select="personName">
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="departmentName">
																										<span style="font-size:smaller">dept: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="telephoneNumber">
																										<span style="font-size:smaller">Telephone: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="faxNumber">
																										<span style="font-size:smaller">Fax: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																										<br/>
																									</xsl:for-each>
																									<xsl:for-each select="e-MailAddress">
																										<span style="font-size:smaller">E-mail: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																									</xsl:for-each>
																									<br/>
																								</xsl:for-each>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</xsl:for-each>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<table width="100%">
											<tbody>
												<tr>
													<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin">
														<span style="font-size:smaller">Routing Summary</span>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:for-each select="RoutingSummary">
															<xsl:for-each select="estimatedDateOfAvailability">
																<span style="font-size:smaller">Estimiated Date of Availability: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="dateOfArrivalAtDestination">
																<span style="font-size:smaller">Date of Arrival at Destination: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="CountryOfDestination">
																<span style="font-size:smaller">Country of Destination: </span>
																<xsl:for-each select="countryName">
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">&#160;</span>
																</xsl:for-each>
																<xsl:for-each select="locationCode">
																	<span style="font-size:smaller">(</span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">)</span>
																</xsl:for-each>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="BillOfLadingIdentifier">
																<table width="100%">
																	<tbody>
																		<tr>
																			<td colspan="3">
																				<span style="font-size:smaller">Bill of Lading</span>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<xsl:for-each select="documentNumber">
																					<span style="font-size:smaller">Document Number: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																				</xsl:for-each>
																			</td>
																			<td>
																				<xsl:for-each select="documentVersion">
																					<span style="font-size:smaller">Document Version: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																				</xsl:for-each>
																			</td>
																			<td>
																				<xsl:for-each select="documentCreatorIdentifier">
																					<span style="font-size:smaller">Document Creator Identifer: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																				</xsl:for-each>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</xsl:for-each>
															<xsl:for-each select="billOfLadingDate">
																<span style="font-size:smaller">Bill of Lading Date: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="PlaceOfOrigin">
																<span style="font-size:smaller">Place of Origin: </span>
																<xsl:for-each select="locationName">
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
																<xsl:for-each select="locationCode">
																	<span style="font-size:smaller">(</span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">)</span>
																</xsl:for-each>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="PlaceOfLoading">
																<span style="font-size:smaller">Place of Loading: </span>
																<xsl:for-each select="locationName">
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
																<xsl:for-each select="locationCode">
																	<span style="font-size:smaller">(</span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">)</span>
																</xsl:for-each>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="PlaceOfDischarge">
																<span style="font-size:smaller">Place of Discharge: </span>
																<xsl:for-each select="locationName">
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
																<xsl:for-each select="locationCode">
																	<span style="font-size:smaller">(</span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">)</span>
																</xsl:for-each>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="LocationOfStock">
																<span style="font-size:smaller">Location of Stock: </span>
																<xsl:for-each select="locationName">
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
																<xsl:for-each select="storeNo">
																	<span style="font-size:smaller">(Store #: </span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">)</span>
																</xsl:for-each>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="MeansOfTransport">
																<table border="1" width="100%">
																	<tbody>
																		<tr>
																			<td align="center" colspan="3">
																				<span style="font-size:smaller">Means Of Transport</span>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<span style="font-size:smaller">Sea Transportation</span>
																			</td>
																			<td>
																				<span style="font-size:smaller">Rail Transportation</span>
																			</td>
																			<td>
																				<span style="font-size:smaller">Road Transportation</span>
																			</td>
																		</tr>
																		<tr>
																			<td valign="top">
																				<xsl:for-each select="SeaTransportIdentification">
																					<xsl:for-each select="Voyage">
																						<span style="font-size:smaller">Voyage:</span>
																						<br/>
																						<xsl:for-each select="voyageNumber">
																							<span style="font-size:smaller">Voyage Number: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																							<br/>
																						</xsl:for-each>
																						<span style="font-size:smaller">&#160;</span>
																						<xsl:for-each select="estimatedDateOfArrivalAtDestination">
																							<span style="font-size:smaller">Estimated Date of Arival at Destination: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																						</xsl:for-each>
																						<xsl:for-each select="Vessel">
																							<table border="1" width="100%">
																								<tbody>
																									<tr>
																										<td colspan="3">
																											<span style="font-size:smaller">Vessel</span>
																										</td>
																									</tr>
																									<tr>
																										<td colspan="3">
																											<xsl:for-each select="vesselName">
																												<span style="font-size:smaller">Name: </span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																										</td>
																									</tr>
																									<tr>
																										<td colspan="3">
																											<xsl:for-each select="carrier">
																												<span style="font-size:smaller">Carrier: </span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																										</td>
																									</tr>
																									<tr>
																										<td colspan="3">
																											<xsl:for-each select="vesselFunction">
																												<span style="font-size:smaller">Function: </span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																										</td>
																									</tr>
																								</tbody>
																							</table>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																						</xsl:for-each>
																						<br/>
																					</xsl:for-each>
																				</xsl:for-each>
																			</td>
																			<td valign="top">
																				<xsl:for-each select="RailTransportIdentification">
																					<table border="1" width="100%">
																						<tbody>
																							<tr>
																								<td>
																									<xsl:for-each select="carrier">
																										<span style="font-size:smaller">Carrier: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																									</xsl:for-each>
																								</td>
																							</tr>
																							<tr>
																								<td>
																									<xsl:for-each select="locomotiveNumber">
																										<span style="font-size:smaller">Location Number: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																									</xsl:for-each>
																								</td>
																							</tr>
																							<tr>
																								<td>
																									<xsl:for-each select="railCarNumber">
																										<span style="font-size:smaller">Rail Car Number: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																									</xsl:for-each>
																								</td>
																							</tr>
																						</tbody>
																					</table>
																				</xsl:for-each>
																			</td>
																			<td valign="top">
																				<xsl:for-each select="RoadTransportIdentification">
																					<table border="1" width="100%">
																						<tbody>
																							<tr>
																								<td>
																									<xsl:for-each select="carrier">
																										<span style="font-size:smaller">Carrier: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																									</xsl:for-each>
																								</td>
																							</tr>
																							<tr>
																								<td>
																									<xsl:for-each select="licensePlateNumber">
																										<span style="font-size:smaller">Licence Plate Number: </span>
																										<span style="font-size:smaller">
																											<xsl:apply-templates/>
																										</span>
																									</xsl:for-each>
																								</td>
																							</tr>
																						</tbody>
																					</table>
																				</xsl:for-each>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</xsl:for-each>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<table width="100%">
											<tbody>
												<tr>
													<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin">
														<span style="font-size:smaller">Consignment</span>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:for-each select="Consignment">
															<xsl:for-each select="approvalDate">
																<span style="font-size:smaller">Approval Date: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="fdaReleaseDate">
																<span style="font-size:smaller">FDA Release Date: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="customsReleaseDate">
																<span style="font-size:smaller">Customs Release Date: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="Quantity">
																<span style="font-size:smaller">Quantity: </span>
																<xsl:for-each select="quantityValue">
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
																<xsl:for-each select="quantityUnits">
																	<span style="font-size:smaller"> (</span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">)</span>
																</xsl:for-each>
																<xsl:for-each select="packagingType">
																	<span style="font-size:smaller">(packaged:</span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">)</span>
																</xsl:for-each>
															</xsl:for-each>
															<xsl:for-each select="ProductQuality">
																<br/>
																<span style="font-size:smaller">Product:</span>
																<table border="1" width="100%">
																	<tbody>
																		<tr>
																			<td>
																				<xsl:for-each select="product">
																					<span style="font-size:smaller">Name: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="CountryOfOrigin">
																					<span style="font-size:smaller">Country of Orgin: </span>
																					<xsl:for-each select="locationName">
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																					</xsl:for-each>
																					<xsl:for-each select="locationCode">
																						<span style="font-size:smaller">(</span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																						<span style="font-size:smaller">)</span>
																					</xsl:for-each>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="cropYear">
																					<span style="font-size:smaller">Crop Year: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="ProductDescription">
																					<span style="font-size:smaller">Description:</span>
																					<br/>
																					<xsl:for-each select="ProductDescriptionCode">
																						<xsl:for-each select="codeValue">
																							<span style="font-size:smaller">Code: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																						</xsl:for-each>
																						<xsl:for-each select="codeReferenceType">
																							<span style="font-size:smaller">Code reference Type: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																						</xsl:for-each>
																					</xsl:for-each>
																					<xsl:for-each select="productDescriptionText">
																						<p style="margin:1cm">
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																						</p>
																					</xsl:for-each>
																				</xsl:for-each>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</xsl:for-each>
															<xsl:for-each select="ConsignmentDetails">
																<xsl:for-each select="freightType">
																	<span style="font-size:smaller">Freight Type: </span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<br/>
																</xsl:for-each>
																<xsl:for-each select="ConsignmentIdentifiers">
																	<span style="font-size:smaller">Identifiers: </span>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					<xsl:for-each select="Container">
																						<span style="font-size:smaller">Container </span>
																						<xsl:for-each select="containerIdentification">
																							<span style="font-size:smaller">Identification: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																							<br/>
																						</xsl:for-each>
																						<xsl:for-each select="containerType">
																							<span style="font-size:smaller">Type: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																						</xsl:for-each>
																					</xsl:for-each>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<xsl:for-each select="seal">
																						<span style="font-size:smaller">Seal: </span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																					</xsl:for-each>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<xsl:for-each select="ShipmentMark">
																						<xsl:for-each select="icoMark">
																							<span style="font-size:smaller">ICO Mark: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																							<br/>
																						</xsl:for-each>
																						<xsl:for-each select="additionalMark">
																							<span style="font-size:smaller">Additional Mark: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																							<br/>
																						</xsl:for-each>
																						<xsl:for-each select="numberOfBags">
																							<span style="font-size:smaller">Number of Bags: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																						</xsl:for-each>
																					</xsl:for-each>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<xsl:for-each select="ContainerUnits">
																						<span style="font-size:smaller">Container Units: </span>
																						<xsl:for-each select="quantityValue">
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																						</xsl:for-each>
																						<xsl:for-each select="quantityUnits">
																							<span style="font-size:smaller">(units: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																							<span style="font-size:smaller">)</span>
																						</xsl:for-each>
																					</xsl:for-each>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<xsl:for-each select="warehouseReceipt">
																						<span style="font-size:smaller">Warehouse Receipt: </span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																					</xsl:for-each>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<xsl:for-each select="cargoNo">
																						<span style="font-size:smaller">Cargo Number: </span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																					</xsl:for-each>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<xsl:for-each select="exchangeIdNo">
																						<span style="font-size:smaller">Exchange ID Number: </span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																					</xsl:for-each>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</xsl:for-each>
															</xsl:for-each>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<table width="100%">
											<tbody>
												<tr>
													<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin">
														<span style="font-size:smaller">Invoice Details</span>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:for-each select="InvoiceDetails">
															<xsl:for-each select="InvoiceWeightInformtion">
																<span style="font-size:smaller">Weight Information: </span>
																<br/>
																<xsl:for-each select="GrossWeight">
																	<span style="font-size:smaller">Gross: </span>
																	<xsl:for-each select="value">
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																	</xsl:for-each>
																	<xsl:for-each select="weightUnitCode">
																		<span style="font-size:smaller">(</span>
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																		<span style="font-size:smaller">)</span>
																	</xsl:for-each>
																	<br/>
																</xsl:for-each>
																<xsl:for-each select="NetWeight">
																	<span style="font-size:smaller">Net: </span>
																	<xsl:for-each select="value">
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																	</xsl:for-each>
																	<xsl:for-each select="weightUnitCode">
																		<span style="font-size:smaller">(</span>
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																		<span style="font-size:smaller">)</span>
																	</xsl:for-each>
																	<br/>
																</xsl:for-each>
																<xsl:for-each select="TareWeight">
																	<span style="font-size:smaller">Tare: </span>
																	<xsl:for-each select="value">
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																	</xsl:for-each>
																	<xsl:for-each select="weightUnitCode">
																		<span style="font-size:smaller">(</span>
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																		<span style="font-size:smaller">)</span>
																	</xsl:for-each>
																	<br/>
																</xsl:for-each>
																<xsl:for-each select="SampleWeights">
																	<span style="font-size:smaller">Sample: </span>
																	<xsl:for-each select="value">
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																	</xsl:for-each>
																	<xsl:for-each select="weightUnitCode">
																		<span style="font-size:smaller">(</span>
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																		<span style="font-size:smaller">)</span>
																	</xsl:for-each>
																</xsl:for-each>
																<br/>
															</xsl:for-each>
															<br/>
															<xsl:for-each select="InvoicePriceInformation">
																<span style="font-size:smaller">Price Information:</span>
																<br/>
																<xsl:for-each select="UnitPrice">
																	<span style="font-size:smaller">Unit Price:</span>
																	<br/>
																	<table border="1">
																		<tbody>
																			<tr>
																				<td>
																					<xsl:for-each select="UnitPriceFixedForDifferential">
																						<span style="font-size:smaller">Unit Price Fixed for Differential: </span>
																						<table border="1" width="100%">
																							<tbody>
																								<tr>
																									<td>
																										<xsl:for-each select="Differential">
																											<span style="font-size:smaller">Differential: </span>
																											<xsl:for-each select="value">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<xsl:for-each select="currencyUnit">
																												<span style="font-size:smaller">(</span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<span style="font-size:smaller">)</span>
																											</xsl:for-each>
																											<xsl:for-each select="priceUnits">
																												<span style="font-size:smaller"> Price Units: </span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<br/>
																										</xsl:for-each>
																										<xsl:for-each select="AverageFuturesPrice">
																											<span style="font-size:smaller">Average Futures Price: </span>
																											<xsl:for-each select="value">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<xsl:for-each select="futuresCurrencyUnit">
																												<span style="font-size:smaller">(</span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<span style="font-size:smaller">)</span>
																											</xsl:for-each>
																											<span style="font-size:smaller">&#160;</span>
																											<xsl:for-each select="futuresPriceUnits">
																												<span style="font-size:smaller">Price Units: </span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<br/>
																										</xsl:for-each>
																										<xsl:for-each select="assumedFuturesPrice">
																											<span style="font-size:smaller">Assumed Future Prices: </span>
																											<xsl:for-each select="value">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<xsl:for-each select="futuresCurrencyUnit">
																												<span style="font-size:smaller">(</span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<span style="font-size:smaller">)</span>
																											</xsl:for-each>
																											<xsl:for-each select="futuresPriceUnits">
																												<span style="font-size:smaller">Price Units: </span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<br/>
																										</xsl:for-each>
																										<xsl:for-each select="lotsFixed">
																											<span style="font-size:smaller">Lot Fixed: </span>
																											<span style="font-size:smaller">
																												<xsl:apply-templates/>
																											</span>
																											<br/>
																										</xsl:for-each>
																										<xsl:for-each select="lotsToBeFixed">
																											<span style="font-size:smaller">Lots to be Fixed: </span>
																											<span style="font-size:smaller">
																												<xsl:apply-templates/>
																											</span>
																											<br/>
																										</xsl:for-each>
																										<xsl:for-each select="netFixedPrice">
																											<span style="font-size:smaller">Net Fixed Price: </span>
																											<xsl:for-each select="value">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<xsl:for-each select="currencyUnit">
																												<span style="font-size:smaller">(</span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<span style="font-size:smaller">)</span>
																											</xsl:for-each>
																											<xsl:for-each select="priceUnits">
																												<span style="font-size:smaller">Price Units :</span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<br/>
																										</xsl:for-each>
																										<xsl:for-each select="PriceFixDetails">
																											<span style="font-size:smaller">Price Fix Details:</span>
																											<br/>
																											<xsl:for-each select="FuturesDeal">
																												<table border="1">
																													<tbody>
																														<tr>
																															<td>
																																<span style="font-size:smaller">Deal:</span>
																																<br/>
																																<xsl:for-each select="FuturesMarket">
																																	<span style="font-size:smaller">Market: </span>
																																	<xsl:for-each select="futuresExchangeName">
																																		<span style="font-size:smaller">
																																			<xsl:apply-templates/>
																																		</span>
																																	</xsl:for-each>
																																	<xsl:for-each select="futuresExchangeCode">
																																		<span style="font-size:smaller">(</span>
																																		<span style="font-size:smaller">
																																			<xsl:apply-templates/>
																																		</span>
																																		<span style="font-size:smaller">)</span>
																																	</xsl:for-each>
																																	<br/>
																																</xsl:for-each>
																																<xsl:for-each select="FuturesMonth">
																																	<span style="font-size:smaller">Futures Month: </span>
																																	<xsl:for-each select="futuresMonthName">
																																		<span style="font-size:smaller">
																																			<xsl:apply-templates/>
																																		</span>
																																	</xsl:for-each>
																																	<xsl:for-each select="futuresMonthCode">
																																		<span style="font-size:smaller">(</span>
																																		<span style="font-size:smaller">
																																			<xsl:apply-templates/>
																																		</span>
																																		<span style="font-size:smaller">)</span>
																																	</xsl:for-each>
																																	<br/>
																																</xsl:for-each>
																																<xsl:for-each select="futuresYear">
																																	<span style="font-size:smaller">Future Years: </span>
																																	<span style="font-size:smaller">
																																		<xsl:apply-templates/>
																																	</span>
																																	<br/>
																																</xsl:for-each>
																																<br/>
																																<xsl:for-each select="FixedFuturesPriceLevel">
																																	<span style="font-size:smaller">Fixed Future Price Level: </span>
																																	<xsl:for-each select="value">
																																		<span style="font-size:smaller">
																																			<xsl:apply-templates/>
																																		</span>
																																	</xsl:for-each>
																																	<xsl:for-each select="futuresCurrencyUnit">
																																		<span style="font-size:smaller">(</span>
																																		<span style="font-size:smaller">
																																			<xsl:apply-templates/>
																																		</span>
																																		<span style="font-size:smaller">)</span>
																																	</xsl:for-each>
																																	<xsl:for-each select="futuresPriceUnits">
																																		<span style="font-size:smaller"> Price Units: </span>
																																		<span style="font-size:smaller">
																																			<xsl:apply-templates/>
																																		</span>
																																	</xsl:for-each>
																																	<br/>
																																</xsl:for-each>
																																<xsl:for-each select="FixedFuturesPriceInContractEquivalentUnits">
																																	<span style="font-size:smaller">Fixed Futures Price in Contract Equilivant Units: </span>
																																	<xsl:for-each select="value">
																																		<span style="font-size:smaller">
																																			<xsl:apply-templates/>
																																		</span>
																																	</xsl:for-each>
																																	<xsl:for-each select="priceUnits">
																																		<span style="font-size:smaller">Price Units: </span>
																																		<span style="font-size:smaller">
																																			<xsl:apply-templates/>
																																		</span>
																																	</xsl:for-each>
																																	<br/>
																																</xsl:for-each>
																																<xsl:for-each select="futuresSettlementDate">
																																	<span style="font-size:smaller">Futures Settlement Date: </span>
																																	<span style="font-size:smaller">
																																		<xsl:apply-templates/>
																																	</span>
																																	<br/>
																																</xsl:for-each>
																																<xsl:for-each select="numberOfLots">
																																	<span style="font-size:smaller">Number of Lots: </span>
																																	<span style="font-size:smaller">
																																		<xsl:apply-templates/>
																																	</span>
																																	<br/>
																																</xsl:for-each>
																															</td>
																														</tr>
																													</tbody>
																												</table>
																											</xsl:for-each>
																										</xsl:for-each>
																									</td>
																								</tr>
																							</tbody>
																						</table>
																					</xsl:for-each>
																					<xsl:for-each select="UnitPriceFixedForOutright">
																						<span style="font-size:smaller">Unit Price Fixed For Outright:</span>
																						<br/>
																						<table border="1" width="100%">
																							<tbody>
																								<tr>
																									<td>
																										<span style="font-size:smaller">Price: </span>
																										<xsl:for-each select="value">
																											<span style="font-size:smaller">
																												<xsl:apply-templates/>
																											</span>
																										</xsl:for-each>
																										<xsl:for-each select="currencyUnit">
																											<span style="font-size:smaller">(</span>
																											<span style="font-size:smaller">
																												<xsl:apply-templates/>
																											</span>
																											<span style="font-size:smaller">)</span>
																										</xsl:for-each>
																										<br/>
																										<xsl:for-each select="priceUnits">
																											<span style="font-size:smaller">Price Units: </span>
																											<span style="font-size:smaller">
																												<xsl:apply-templates/>
																											</span>
																										</xsl:for-each>
																									</td>
																								</tr>
																							</tbody>
																						</table>
																					</xsl:for-each>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																	<br/>
																</xsl:for-each>
																<xsl:for-each select="Allowance">
																	<span style="font-size:smaller">Allowance: </span>
																	<xsl:for-each select="value">
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																	</xsl:for-each>
																	<xsl:for-each select="currencyUnit">
																		<span style="font-size:smaller">(</span>
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																		<span style="font-size:smaller">)</span>
																	</xsl:for-each>
																	<br/>
																	<span style="font-size:smaller">&#160;&#160;&#160; </span>
																	<xsl:for-each select="priceUnits">
																		<span style="font-size:smaller">Allowance Unit Price: </span>
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																	</xsl:for-each>
																	<br/>
																</xsl:for-each>
																<xsl:for-each select="InvoiceUnitPrice">
																	<span style="font-size:smaller">Unit Price: </span>
																	<xsl:for-each select="value">
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																	</xsl:for-each>
																	<xsl:for-each select="currencyUnit">
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																		<br/>
																	</xsl:for-each>
																	<xsl:for-each select="priceUnits">
																		<span style="font-size:smaller">Invoice Price Units: </span>
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																	</xsl:for-each>
																	<br/>
																</xsl:for-each>
															</xsl:for-each>
															<br/>
															<br/>
															<xsl:for-each select="NetAmount">
																<span style="font-size:smaller">Net Ammount: </span>
																<xsl:for-each select="value">
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
																<xsl:for-each select="currencyUnit">
																	<span style="font-size:smaller">(</span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">)</span>
																</xsl:for-each>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="Adjustments">
																<span style="font-size:smaller">Adjustments:</span>
																<br/>
																<xsl:for-each select="AdjustmentItem">
																	<table border="1">
																		<tbody>
																			<tr>
																				<td>
																					<xsl:for-each select="description">
																						<span style="font-size:smaller">Description: </span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																						<br/>
																					</xsl:for-each>
																				</td>
																				<td colspan="2">
																					<xsl:for-each select="value">
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																					</xsl:for-each>
																					<xsl:for-each select="currencyUnit">
																						<span style="font-size:smaller">(</span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																						<span style="font-size:smaller">)</span>
																					</xsl:for-each>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</xsl:for-each>
																<span style="font-size:smaller">&#160;</span>
															</xsl:for-each>
															<xsl:for-each select="TotalAmount">
																<span style="font-size:smaller">Total Amount: </span>
																<xsl:for-each select="value">
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
																<xsl:for-each select="currencyUnit">
																	<span style="font-size:smaller">(</span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">)</span>
																</xsl:for-each>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="PreviousInvoices">
																<span style="font-size:smaller">Previous Invoices: </span>
																<br/>
																<xsl:for-each select="InvoiceDetails">
																	<table border="1">
																		<tbody>
																			<tr>
																				<td colspan="2" height="169" width="292">
																					<xsl:for-each select="InvoiceNumber">
																						<xsl:for-each select="documentCreatorIdentifier">
																							<span style="font-size:smaller">Creator Idenitifier: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																							<br/>
																						</xsl:for-each>
																						<xsl:for-each select="documentNumber">
																							<span style="font-size:smaller">Document Number: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																							<br/>
																						</xsl:for-each>
																						<xsl:for-each select="documentVersion">
																							<span style="font-size:smaller">Document Version: </span>
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																						</xsl:for-each>
																					</xsl:for-each>
																				</td>
																				<td height="169" valign="center">
																					<span style="font-size:smaller"> Amount: </span>
																					<xsl:for-each select="value">
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																						<span style="font-size:smaller">&#160;</span>
																					</xsl:for-each>
																					<xsl:for-each select="currencyUnit">
																						<span style="font-size:smaller">(</span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																						<span style="font-size:smaller">)</span>
																					</xsl:for-each>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</xsl:for-each>
															</xsl:for-each>
															<br/>
															<br/>
															<xsl:for-each select="percentAmountPayable">
																<span style="font-size:smaller">Percent Amount Payable: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="PaymentReceived">
																<span style="font-size:smaller">Payment Received:&#160; </span>
																<xsl:for-each select="value">
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
																<xsl:for-each select="currencyUnit">
																	<span style="font-size:smaller"> (</span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																	<span style="font-size:smaller">)</span>
																</xsl:for-each>
																<br/>
															</xsl:for-each>
															<table>
																<tbody>
																	<tr>
																		<td width="435">
																			<xsl:for-each select="AmountDue">
																				<table bgcolor="silver" width="100%">
																					<tbody>
																						<tr>
																							<td valign="top">
																								<span style="font-size:smaller">AMOUNT DUE: </span>
																							</td>
																							<td>
																								<xsl:for-each select="value">
																									<span style="font-size:smaller">
																										<xsl:apply-templates/>
																									</span>
																								</xsl:for-each>
																								<xsl:for-each select="currencyUnit">
																									<span style="font-size:smaller">(</span>
																									<span style="font-size:smaller">
																										<xsl:apply-templates/>
																									</span>
																									<span style="font-size:smaller">)</span>
																								</xsl:for-each>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</xsl:for-each>
																		</td>
																		<td align="right">
																			<xsl:for-each select="dueDate">
																				<span style="font-size:smaller">Due Date: </span>
																				<span style="font-size:smaller">
																					<xsl:apply-templates/>
																				</span>
																			</xsl:for-each>
																		</td>
																	</tr>
																</tbody>
															</table>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<table width="100%">
											<tbody>
												<tr>
													<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin">
														<span style="font-size:smaller">Instructional Information</span>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:for-each select="InstructionalInformation">
															<xsl:for-each select="deliveryDate">
																<span style="font-size:smaller">Delivery Date: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="MoveOrDeliverPeriod">
																<table border="1">
																	<tbody>
																		<tr>
																			<td>
																				<span style="font-size:smaller">Move or Deliver Period: </span>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<xsl:for-each select="startDate">
																					<span style="font-size:smaller">Start Date: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="endDate">
																					<span style="font-size:smaller">End Date: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																					<br/>
																				</xsl:for-each>
																				<xsl:for-each select="positionOfSale">
																					<span style="font-size:smaller">Position od Sale: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																				</xsl:for-each>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</xsl:for-each>
															<xsl:for-each select="DeliveryLocation">
																<table border="1">
																	<tbody>
																		<tr>
																			<td valign="top">
																				<span style="font-size:smaller">Delivery Location: </span>
																			</td>
																			<td>
																				<table border="1" width="100%">
																					<tbody>
																						<tr>
																							<td>
																								<xsl:for-each select="organizationName">
																									<span style="font-size:smaller">Name: </span>
																									<span style="font-size:smaller">
																										<xsl:apply-templates/>
																									</span>
																								</xsl:for-each>
																							</td>
																						</tr>
																						<tr>
																							<td>
																								<xsl:for-each select="OrganizationIdentification">
																									<span style="font-size:smaller">Identfication: </span>
																									<span style="font-size:smaller">
																										<xsl:apply-templates/>
																									</span>
																								</xsl:for-each>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<xsl:for-each select="AddressInformation">
																					<span style="font-size:smaller">Address: </span>
																					<br/>
																					<xsl:for-each select="FormattedAddress">
																						<xsl:for-each select="line">
																							<span style="font-size:smaller">
																								<xsl:apply-templates/>
																							</span>
																							<br/>
																						</xsl:for-each>
																					</xsl:for-each>
																					<xsl:for-each select="NormalisedAddress">
																						<xsl:for-each select="StreetAddress">
																							<span style="font-size:smaller">
																								<xsl:apply-templates select="text()"/>
																							</span>
																							<br/>
																							<xsl:for-each select="line">
																								<span style="font-size:smaller">
																									<xsl:apply-templates/>
																								</span>
																								<br/>
																							</xsl:for-each>
																						</xsl:for-each>
																						<table>
																							<tbody>
																								<tr>
																									<td>
																										<xsl:for-each select="city">
																											<span style="font-size:smaller">
																												<xsl:apply-templates/>
																											</span>
																										</xsl:for-each>
																									</td>
																									<td>
																										<xsl:for-each select="StateOrProvince">
																											<xsl:for-each select="stateOrProvinceName">
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																											</xsl:for-each>
																											<xsl:for-each select="stateOrProvinceCode">
																												<span style="font-size:smaller">(</span>
																												<span style="font-size:smaller">
																													<xsl:apply-templates/>
																												</span>
																												<span style="font-size:smaller">)</span>
																											</xsl:for-each>
																										</xsl:for-each>
																									</td>
																								</tr>
																							</tbody>
																						</table>
																						<xsl:for-each select="Country">
																							<xsl:for-each select="countryName">
																								<span style="font-size:smaller">
																									<xsl:apply-templates/>
																								</span>
																							</xsl:for-each>
																							<xsl:for-each select="countryCode">
																								<span style="font-size:smaller">(</span>
																								<span style="font-size:smaller">
																									<xsl:apply-templates/>
																								</span>
																								<span style="font-size:smaller">)</span>
																							</xsl:for-each>
																						</xsl:for-each>
																					</xsl:for-each>
																					<br/>
																					<span style="font-size:smaller">&#160;</span>
																				</xsl:for-each>
																			</td>
																			<td>
																				<xsl:for-each select="ContactDetails">
																					<span style="font-size:smaller">Contact:</span>
																					<br/>
																					<xsl:for-each select="personName">
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																						<br/>
																					</xsl:for-each>
																					<xsl:for-each select="departmentName">
																						<span style="font-size:smaller">dept: </span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																						<br/>
																					</xsl:for-each>
																					<xsl:for-each select="telephoneNumber">
																						<span style="font-size:smaller">Telephone: </span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																						<br/>
																					</xsl:for-each>
																					<xsl:for-each select="faxNumber">
																						<span style="font-size:smaller">Fax: </span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																						<br/>
																					</xsl:for-each>
																					<xsl:for-each select="e-MailAddress">
																						<span style="font-size:smaller">E-mail: </span>
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																					</xsl:for-each>
																					<br/>
																				</xsl:for-each>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</xsl:for-each>
															<xsl:for-each select="responsibilityOfWeighing">
																<span style="font-size:smaller">Responsibility of Weighing: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
																<br/>
															</xsl:for-each>
															<xsl:for-each select="WeighingMethod">
																<span style="font-size:smaller">Weighing Method: </span>
																<xsl:for-each select="weighingMethodCode">
																	<span style="font-size:smaller">Code: </span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
																<br/>
																<xsl:for-each select="weighingMethodDescription">
																	<span style="font-size:smaller">Description:</span>
																	<p style="margin-left:1cm">
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																	</p>
																</xsl:for-each>
															</xsl:for-each>
															<xsl:for-each select="PaymentTerms">
																<span style="font-size:smaller">Payment Terms: </span>
																<xsl:for-each select="paymentTermsCode">
																	<span style="font-size:smaller">Code: </span>
																	<span style="font-size:smaller">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
																<br/>
																<xsl:for-each select="paymentTermsDescription">
																	<span style="font-size:smaller">Description: </span>
																	<p style="margin-left:1cm">
																		<span style="font-size:smaller">
																			<xsl:apply-templates/>
																		</span>
																	</p>
																</xsl:for-each>
															</xsl:for-each>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<table border="1" width="100%">
											<tbody>
												<tr>
													<td align="center" colspan="3">
														<span style="font-size:smaller">Additional Information</span>
													</td>
												</tr>
												<tr>
													<td height="42"/>
													<td align="center" height="42" valign="center">
														<xsl:for-each select="AdditionalInformation">
															<span style="font-size:smaller">
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
													<td height="42"/>
												</tr>
												<tr>
													<td height="13"/>
													<td height="13"/>
													<td height="13"/>
												</tr>
											</tbody>
										</table>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
