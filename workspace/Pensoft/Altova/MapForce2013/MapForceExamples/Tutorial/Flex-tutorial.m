<FlexText>
	<Commands>
		<Project FileName="Flex-tutorial.txt">
			<Version/>
			<RootName Value="Root"/>
			<Connections>
				<Connection>
					<SplitSingle Mode="DynL" Behavior="LineBased">
						<Version/>
						<Separator Value="General"/>
						<Name Value="Split%20once"/>
						<Connections>
							<Connection>
								<SplitMultiple Mode="Fix" Offset="1">
									<Version/>
									<Name Value="Repeated%20split"/>
									<Connections>
										<Connection>
											<Switch>
												<Version/>
												<Conditions>
													<Condition>
														<Version/>
														<Value Value="111"/>
														<Connections>
															<Connection>
																<Store Type="string" TrimCharSet="%20">
																	<Version/>
																	<Name Value="Key%20111"/>
																</Store>
															</Connection>
														</Connections>
														<XData>
															<Dimension/>
															<OpenState Property="1" Preview="1" Connector="1"/>
														</XData>
													</Condition>
													<Condition>
														<Version/>
														<Value Value="222"/>
														<Connections>
															<Connection>
																<Store Type="string" TrimCharSet="%20">
																	<Version/>
																	<Name Value="Key%20222"/>
																</Store>
															</Connection>
														</Connections>
														<XData>
															<Dimension/>
															<OpenState Property="1" Preview="1" Connector="1"/>
														</XData>
													</Condition>
													<Condition Mode="Default">
														<Version/>
														<Value/>
														<Connections>
															<Connection>
																<Ignore>
																	<Connections>
																		<Connection/>
																	</Connections>
																	<XData>
																		<Dimension FullWidth="142" FullHeight="220" TextHeight="193"/>
																		<OpenState Property="1" Preview="1" Connector="1"/>
																	</XData>
																</Ignore>
															</Connection>
														</Connections>
														<XData>
															<Dimension/>
															<OpenState Property="1" Preview="1" Connector="1"/>
														</XData>
													</Condition>
												</Conditions>
												<Connections>
													<Connection/>
												</Connections>
												<XData>
													<Dimension FullWidth="199" FullHeight="223" TextHeight="158"/>
													<OpenState Property="1" Preview="1" Connector="1"/>
												</XData>
											</Switch>
										</Connection>
									</Connections>
									<XData>
										<Dimension FullWidth="148" FullHeight="224" TextHeight="147"/>
										<OpenState Property="1" Preview="1" Connector="1"/>
									</XData>
								</SplitMultiple>
							</Connection>
							<Connection>
								<SplitSingle>
									<Version/>
									<Upper Offset="1"/>
									<Lower/>
									<Name Value="Split%20once"/>
									<Connections>
										<Connection>
											<Ignore>
												<Connections>
													<Connection/>
												</Connections>
												<XData>
													<Dimension FullWidth="158" FullHeight="220" TextHeight="71"/>
													<OpenState Property="1" Preview="1" Connector="1"/>
												</XData>
											</Ignore>
										</Connection>
										<Connection>
											<CSV QuoteCharacter='"'>
												<Version/>
												<RecordSeparator Value="%0D%0A"/>
												<FieldSeparator Value=","/>
												<RecordName Value="CSV"/>
												<Fields>
													<Field Type="string">
														<Name Value="Field"/>
													</Field>
													<Field Type="string">
														<Name Value="Field%20(1)"/>
													</Field>
													<Field Type="string">
														<Name Value="Field%20(2)"/>
													</Field>
													<Field Type="string">
														<Name Value="Field%20(3)"/>
													</Field>
													<Field Type="string">
														<Name Value="Field%20(4)"/>
													</Field>
												</Fields>
												<Connections>
													<Connection/>
												</Connections>
												<XData>
													<Dimension FullWidth="219" FullHeight="220" TextHeight="162"/>
													<OpenState Property="1" Preview="1" Connector="1"/>
													<FieldWidths Item="50" Item1="53" Item2="54" Item3="54" Item4="56"/>
												</XData>
											</CSV>
										</Connection>
									</Connections>
									<XData>
										<Dimension FullWidth="190" FullHeight="224" TextHeight="189"/>
										<OpenState Property="1" Preview="1" Connector="1"/>
									</XData>
								</SplitSingle>
							</Connection>
						</Connections>
						<XData>
							<Dimension FullWidth="282" FullHeight="400" TextHeight="193"/>
							<OpenState Property="1" Preview="1" Connector="1"/>
						</XData>
					</SplitSingle>
				</Connection>
			</Connections>
			<XData>
				<Dimension/>
				<OpenState Property="1" Preview="1" Connector="1"/>
			</XData>
		</Project>
	</Commands>
	<Functions/>
</FlexText>