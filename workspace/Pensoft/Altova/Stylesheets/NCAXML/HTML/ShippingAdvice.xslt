<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:template match="/">
		<html>
			<head/>
			<body>
				<xsl:for-each select="ShippingAdvice">
					<table width="100%">
						<tbody>
							<tr>
								<td valign="top">
									<span style="font-size:large; font-weight:bold">NCA Shipping Advice</span>
								</td>
								<td align="right">
									<xsl:for-each select="Header">
										<table width="100%">
											<tbody>
												<tr>
													<td align="right">
														<xsl:for-each select="documentID">Document ID: <xsl:apply-templates/>
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
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:for-each select="Body">
						<table width="100%">
							<tbody>
								<tr>
									<td width="37"/>
									<td>
										<xsl:for-each select="GeneralInformation">
											<table width="100%">
												<tbody>
													<tr>
														<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin">
															<span style="border-bottom-color:black; font-size:smaller; font-weight:bold">General Information:</span>
														</td>
														<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin" align="right">
															<xsl:for-each select="dateOfIssue">
																<span style="font-size:smaller">Date Of Issue: </span>
																<span style="font-size:smaller">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<table border="1" width="100%">
																<tbody>
																	<tr>
																		<td>
																			<xsl:for-each select="contractType">
																				<span style="font-size:smaller">Contract Type: </span>
																				<span style="font-size:smaller">
																					<xsl:apply-templates/>
																				</span>
																				<br/>
																			</xsl:for-each>
																			<xsl:for-each select="e-TransactionNumber">
																				<span style="font-size:smaller">E-transaction Number: </span>
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
																			</xsl:for-each>
																		</td>
																		<td valign="top">
																			<xsl:for-each select="ContractIdentifier">
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
																	</tr>
																</tbody>
															</table>
														</td>
													</tr>
												</tbody>
											</table>
										</xsl:for-each>
										<xsl:for-each select="Parties">
											<table width="100%">
												<tbody>
													<tr>
														<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin" colspan="2">
															<span style="font-size:smaller; font-weight:bold">Parties</span>
														</td>
													</tr>
												</tbody>
											</table>
											<table width="100%">
												<tbody>
													<tr>
														<td>
															<xsl:for-each select="Buyer">
																<span style="font-size:smaller">Buyer:</span>
																<table width="100%">
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
																			<td align="left">
																				<xsl:for-each select="OrganizationIdentification">
																					<span style="font-size:smaller">Identification: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
																				</xsl:for-each>
																			</td>
																		</tr>
																	</tbody>
																</table>
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
															</xsl:for-each>
															<xsl:for-each select="Seller">
																<table border="1">
																	<tbody>
																		<tr>
																			<td>
																				<span style="font-size:smaller">Seller: </span>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<table width="100%">
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
																							<td>
																								<xsl:for-each select="OrganizationIdentification">
																									<span style="font-size:smaller">Identification: </span>
																									<span style="font-size:smaller">
																										<xsl:apply-templates/>
																									</span>
																								</xsl:for-each>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																				<table width="100%">
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
																<table border="1">
																	<tbody>
																		<tr>
																			<td>
																				<span style="font-size:smaller">Broker:</span>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<table width="100%">
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
																							<td>
																								<xsl:for-each select="OrganizationIdentification">
																									<span style="font-size:smaller">Identification: </span>
																									<span style="font-size:smaller">
																										<xsl:apply-templates/>
																									</span>
																								</xsl:for-each>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																				<table width="100%">
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
															<xsl:for-each select="NotifyParty">
																<table border="1" width="100%">
																	<tbody>
																		<tr>
																			<td>
																				<span style="font-size:smaller">Notify Party:</span>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<table width="100%">
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
																							<td>
																								<xsl:for-each select="OrganizationIdentification">
																									<span style="font-size:smaller">Identification: </span>
																									<span style="font-size:smaller">
																										<xsl:apply-templates/>
																									</span>
																								</xsl:for-each>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																				<table width="100%">
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
														</td>
													</tr>
												</tbody>
											</table>
										</xsl:for-each>
										<xsl:for-each select="RoutingSummary">
											<table width="100%">
												<tbody>
													<tr>
														<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin">
															<span style="font-size:smaller">Routing Summary</span>
														</td>
													</tr>
												</tbody>
											</table>
											<xsl:for-each select="estimatedDateOfAvailability">
												<span style="font-size:smaller">Estimiated Date of Availability: </span>
												<span style="font-size:smaller">
													<xsl:apply-templates/>
												</span>
												<br/>
											</xsl:for-each>
											<xsl:for-each select="estimatedDateOfArrivalAtDestination">
												<span style="font-size:smaller">Estimated Date of Arrival at Dest.:</span>
												<span style="font-size:smaller">
													<xsl:apply-templates/>
												</span>
												<br/>
											</xsl:for-each>
											<xsl:for-each select="PlaceOfDelivery">
												<span style="font-size:smaller">Place of Delivery: </span>
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
										<table width="100%">
											<tbody>
												<tr>
													<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin">
														<span style="font-size:smaller">Consignment:</span>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:for-each select="Consignment">
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
																<xsl:for-each select="GrossWeight">
																	<span style="font-size:smaller">Gross Weight: </span>
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
																	<span style="font-size:smaller">Net Weight: </span>
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
																<xsl:for-each select="ContainerAndMarksDetail">
																	<span style="font-size:smaller">Container And Marks Detail: </span>
																	<table border="1">
																		<tbody>
																			<tr>
																				<td>
																					<xsl:for-each select="Container">
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																					</xsl:for-each>
																					<xsl:for-each select="seal">
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																					</xsl:for-each>
																					<xsl:for-each select="ShipmentMark">
																						<span style="font-size:smaller">
																							<xsl:apply-templates/>
																						</span>
																					</xsl:for-each>
																					<xsl:for-each select="ContainerUnits">
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
										<xsl:for-each select="Consignment">
											<span style="font-size:smaller">
												<xsl:apply-templates/>
											</span>
											<br/>
										</xsl:for-each>
										<xsl:for-each select="InstructionalInformation">
											<table width="100%">
												<tbody>
													<tr>
														<td style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:thin">
															<span style="font-size:smaller">Instructional Information: </span>
														</td>
													</tr>
													<tr>
														<td>
															<xsl:for-each select="MoveOrDeliverPeriod">
																<table border="1">
																	<tbody>
																		<tr>
																			<td valign="top">
																				<span style="font-size:smaller">Move or Deliver Period&#160;&#160; </span>
																			</td>
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
																					<span style="font-size:smaller">Position of Sale: </span>
																					<span style="font-size:smaller">
																						<xsl:apply-templates/>
																					</span>
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
														</td>
													</tr>
												</tbody>
											</table>
											<br/>
										</xsl:for-each>
										<xsl:for-each select="AdditionalInformation">
											<table border="1" width="100%">
												<tbody>
													<tr>
														<td align="center" colspan="3">
															<span style="font-size:smaller">Addtional Information</span>
														</td>
													</tr>
													<tr>
														<td height="37"/>
														<td align="center" height="37" valign="center">
															<span style="font-size:smaller">
																<xsl:apply-templates/>
															</span>
														</td>
														<td height="37"/>
													</tr>
													<tr>
														<td/>
														<td/>
														<td/>
													</tr>
												</tbody>
											</table>
											<br/>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
