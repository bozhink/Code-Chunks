<?xml version="1.0" encoding="UTF-8"?>
<mapping xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="8">
	<component name="defaultmap2" blackbox="0" uid="65048328" editable="1">
		<properties XSLTTargetEncoding="UTF-8" SelectedLanguage="xslt"/>
		<structure>
			<children>
				<component name="equal" library="core" uid="65483336" kind="5">
					<sources>
						<datapoint pos="0" key="51538448"/>
						<datapoint pos="1" key="51500688"/>
					</sources>
					<targets>
						<datapoint pos="0" key="51500528"/>
					</targets>
					<view ltx="231" lty="399" rbx="13" rby="-56"/>
				</component>
				<component name="constant" library="core" uid="65677320" kind="2">
					<targets>
						<datapoint pos="0" key="51425040"/>
					</targets>
					<view ltx="172" lty="496" rbx="-316" rby="65"/>
					<data>
						<constant value="Travel" datatype="string"/>
					</data>
				</component>
				<component name="expense-item" library="core" uid="65061952" kind="3">
					<sources>
						<datapoint pos="0" key="51422560"/>
						<datapoint pos="1" key="51422128"/>
					</sources>
					<targets>
						<datapoint pos="0" key="51348656"/>
						<datapoint/>
					</targets>
					<view ltx="242" lty="271" rbx="-246" rby="-89"/>
				</component>
				<component name="constant" library="core" uid="65912600" kind="2">
					<targets>
						<datapoint pos="0" key="51327856"/>
					</targets>
					<view ltx="185" lty="149" rbx="-303" rby="-44"/>
					<data>
						<constant value=" " datatype="string"/>
					</data>
				</component>
				<component name="concat" library="core" uid="40328600" kind="5" growable="1" growablebasename="value">
					<sources>
						<datapoint pos="0" key="51327696"/>
						<datapoint pos="1" key="51249736"/>
						<datapoint pos="2" key="51249648"/>
					</sources>
					<targets>
						<datapoint pos="0" key="51249560"/>
					</targets>
					<view ltx="238" lty="49" rbx="-10" rby="-33"/>
				</component>
				<component name="document" library="xml" uid="50115216" kind="14">
					<properties XSLTDefaultOutput="1"/>
					<view ltx="369" rbx="573" rby="437"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace uid="http://my-company.com/namespace"/>
									<namespace/>
								</namespaces>
							</header>
							<entry name="0:Company" expanded="1" inpkey="51494952">
								<entry name="0:Employee" expanded="1" inpkey="50860120">
									<entry name="0:Title" expanded="1" inpkey="50860280"/>
									<entry name="0:Name" expanded="1" inpkey="51089904"/>
									<entry name="0:Tel." expanded="1" inpkey="50859640"/>
									<entry name="0:Email" expanded="1" inpkey="50859800"/>
									<entry name="0:DomesticDailyRate" expanded="1"/>
									<entry name="0:ForeignDailyRate" expanded="1"/>
									<entry name="0:Expense-detail" expanded="1"/>
									<entry name="0:expense-item" expanded="1" inpkey="50859480">
										<entry name="1:@Currency" expanded="1" inpkey="50828608"/>
										<entry name="1:@Bill-to" expanded="1" inpkey="51494360"/>
										<entry name="0:Date" expanded="1" inpkey="50859160"/>
										<entry name="0:Travel" expanded="1" inpkey="50859960">
											<entry name="1:@Travel-Cost" expanded="1" inpkey="50859320"/>
											<entry name="0:Destination" expanded="1"/>
											<entry name="0:Car-Rental" expanded="1"/>
											<entry name="0:Air-Travel" expanded="1"/>
											<entry name="0:Misc-Travel" expanded="1"/>
										</entry>
										<entry name="0:Accommodation" expanded="1">
											<entry name="0:DomesticAcc" expanded="1">
												<entry name="1:@DomesticAcc-Cost" expanded="1"/>
												<entry name="0:Location" expanded="1"/>
												<entry name="0:Hotel" expanded="1"/>
											</entry>
											<entry name="0:ForeignAcc" expanded="1">
												<entry name="1:@ForeignAcc-Cost" expanded="1"/>
												<entry name="0:Location" expanded="1"/>
												<entry name="0:Hotel" expanded="1"/>
											</entry>
										</entry>
										<entry name="0:Entertainment" expanded="1">
											<entry name="1:@Entertainment-Cost" expanded="1"/>
											<entry name="0:Client-Name" expanded="1"/>
											<entry name="0:Restaurant" expanded="1"/>
											<entry name="0:Gifts" expanded="1"/>
										</entry>
										<entry name="0:Misc" expanded="1">
											<entry name="1:@MiscExpense-Cost" expanded="1"/>
										</entry>
										<entry name="0:description" expanded="1">
											<entry name="0:strong" expanded="1">
												<entry name="0:italic" expanded="1"/>
											</entry>
											<entry name="0:italic" expanded="1">
												<entry name="0:strong" expanded="1"/>
											</entry>
										</entry>
									</entry>
									<entry name="0:CashAdvance" expanded="1">
										<entry name="1:@CashAdvance-Domestic" expanded="1"/>
										<entry name="1:@CashAdvance-Foreign" expanded="1"/>
									</entry>
								</entry>
								<entry name="0:Exec" expanded="1">
									<entry name="0:Title" expanded="1"/>
									<entry name="0:Name" expanded="1"/>
									<entry name="0:Tel." expanded="1"/>
									<entry name="0:Email" expanded="1"/>
									<entry name="0:DomesticDailyRate" expanded="1"/>
									<entry name="0:ForeignDailyRate" expanded="1"/>
									<entry name="0:Expense-detail" expanded="1"/>
									<entry name="0:expense-item" expanded="1">
										<entry name="1:@Currency" expanded="1"/>
										<entry name="1:@Bill-to" expanded="1"/>
										<entry name="0:Date" expanded="1"/>
										<entry name="0:Travel" expanded="1">
											<entry name="1:@Travel-Cost" expanded="1"/>
											<entry name="0:Destination" expanded="1"/>
											<entry name="0:Car-Rental" expanded="1"/>
											<entry name="0:Air-Travel" expanded="1"/>
											<entry name="0:Misc-Travel" expanded="1"/>
										</entry>
										<entry name="0:Accommodation" expanded="1">
											<entry name="0:DomesticAcc" expanded="1">
												<entry name="1:@DomesticAcc-Cost" expanded="1"/>
												<entry name="0:Location" expanded="1"/>
												<entry name="0:Hotel" expanded="1"/>
											</entry>
											<entry name="0:ForeignAcc" expanded="1">
												<entry name="1:@ForeignAcc-Cost" expanded="1"/>
												<entry name="0:Location" expanded="1"/>
												<entry name="0:Hotel" expanded="1"/>
											</entry>
										</entry>
										<entry name="0:Entertainment" expanded="1">
											<entry name="1:@Entertainment-Cost" expanded="1"/>
											<entry name="0:Client-Name" expanded="1"/>
											<entry name="0:Restaurant" expanded="1"/>
											<entry name="0:Gifts" expanded="1"/>
										</entry>
										<entry name="0:Misc" expanded="1">
											<entry name="1:@MiscExpense-Cost" expanded="1"/>
										</entry>
										<entry name="0:description" expanded="1">
											<entry name="0:strong" expanded="1">
												<entry name="0:italic" expanded="1"/>
											</entry>
											<entry name="0:italic" expanded="1">
												<entry name="0:strong" expanded="1"/>
											</entry>
										</entry>
									</entry>
									<entry name="0:CashAdvance" expanded="1">
										<entry name="1:@CashAdvance-Domestic" expanded="1"/>
										<entry name="1:@CashAdvance-Foreign" expanded="1"/>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="ExpReport-Target.xsd" instanceroot="{http://my-company.com/namespace}Company"/>
					</data>
				</component>
				<component name="document" library="xml" uid="50114920" kind="14">
					<properties/>
					<view ltx="9" rbx="162" rby="441"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace/>
								</namespaces>
							</header>
							<entry name="0:expense-report" expanded="1" outkey="50917416">
								<entry name="0:@detailed" expanded="1"/>
								<entry name="0:@currency" expanded="1" outkey="50912800"/>
								<entry name="0:Person" expanded="1" outkey="50917216">
									<entry name="0:First" expanded="1" outkey="50915816"/>
									<entry name="0:Last" expanded="1" outkey="50915536"/>
									<entry name="0:Title" expanded="1" outkey="50916096"/>
									<entry name="0:Phone" expanded="1" outkey="50916376"/>
									<entry name="0:Email" expanded="1" outkey="50917696"/>
								</entry>
								<entry name="0:expense-item" expanded="1" outkey="50916656">
									<entry name="0:@type" expanded="1" outkey="50911376"/>
									<entry name="0:@expto" expanded="1" outkey="50912712"/>
									<entry name="0:Date" expanded="1" outkey="50917976"/>
									<entry name="0:Meal" expanded="1">
										<entry name="0:@mealtype" expanded="1"/>
										<entry name="0:Name" expanded="1"/>
										<entry name="0:Location" expanded="1"/>
									</entry>
									<entry name="0:Lodging" expanded="1">
										<entry name="0:@Lodge-cost" expanded="1"/>
										<entry name="0:Name" expanded="1"/>
										<entry name="0:Location" expanded="1"/>
									</entry>
									<entry name="0:Travel" expanded="1" outkey="50916936">
										<entry name="0:@means" expanded="1"/>
										<entry name="0:@Trav-cost" expanded="1" outkey="50914000"/>
										<entry name="0:Destination" expanded="1"/>
										<entry name="0:Mileage" expanded="1"/>
									</entry>
									<entry name="0:Parking" expanded="1">
										<entry name="0:Location" expanded="1"/>
									</entry>
									<entry name="0:Entertainment" expanded="1">
										<entry name="0:Client-name" expanded="1"/>
									</entry>
									<entry name="0:Misc" expanded="1">
										<entry name="0:@misctype" expanded="1"/>
									</entry>
									<entry name="0:description" expanded="1">
										<entry name="0:strong" expanded="1">
											<entry name="0:italic" expanded="1"/>
										</entry>
										<entry name="0:italic" expanded="1">
											<entry name="0:strong" expanded="1"/>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="mf-ExpReport.xsd" inputinstance="mf-ExpReport.xml" outputinstance="mf-ExpReport.xml" instanceroot="{}expense-report"/>
					</data>
				</component>
			</children>
			<graph directed="1">
				<edges>
					<edge edgekey="50938072"/>
					<edge edgekey="50938320"/>
					<edge edgekey="50938472"/>
					<edge edgekey="50938624"/>
					<edge edgekey="50938776"/>
					<edge edgekey="50938928"/>
					<edge edgekey="50939080"/>
					<edge edgekey="50939232"/>
					<edge edgekey="50939384"/>
					<edge edgekey="50939536"/>
					<edge edgekey="50939688"/>
					<edge edgekey="50939840"/>
					<edge edgekey="50939992"/>
					<edge edgekey="50940144"/>
					<edge edgekey="50940296"/>
					<edge edgekey="50940448"/>
					<edge edgekey="50940600"/>
					<edge edgekey="50940752"/>
					<edge edgekey="50940904"/>
				</edges>
				<vertices>
					<vertex vertexkey="50911376">
						<edges>
							<edge vertexkey="51538448" edgekey="50940448"/>
						</edges>
					</vertex>
					<vertex vertexkey="50912712">
						<edges>
							<edge vertexkey="51494360" edgekey="50938472"/>
						</edges>
					</vertex>
					<vertex vertexkey="50912800">
						<edges>
							<edge vertexkey="50828608" edgekey="50939992"/>
						</edges>
					</vertex>
					<vertex vertexkey="50914000">
						<edges>
							<edge vertexkey="50859320" edgekey="50940904"/>
						</edges>
					</vertex>
					<vertex vertexkey="50915536">
						<edges>
							<edge vertexkey="51249648" edgekey="50938072"/>
						</edges>
					</vertex>
					<vertex vertexkey="50915816">
						<edges>
							<edge vertexkey="51327696" edgekey="50938776"/>
						</edges>
					</vertex>
					<vertex vertexkey="50916096">
						<edges>
							<edge vertexkey="50860280" edgekey="50939536"/>
						</edges>
					</vertex>
					<vertex vertexkey="50916376">
						<edges>
							<edge vertexkey="50859640" edgekey="50939080"/>
						</edges>
					</vertex>
					<vertex vertexkey="50916656">
						<edges>
							<edge vertexkey="51422560" edgekey="50940600"/>
						</edges>
					</vertex>
					<vertex vertexkey="50916936">
						<edges>
							<edge vertexkey="50859960" edgekey="50940752"/>
						</edges>
					</vertex>
					<vertex vertexkey="50917216">
						<edges>
							<edge vertexkey="50860120" edgekey="50938928"/>
						</edges>
					</vertex>
					<vertex vertexkey="50917416">
						<edges>
							<edge vertexkey="51494952" edgekey="50939840"/>
						</edges>
					</vertex>
					<vertex vertexkey="50917696">
						<edges>
							<edge vertexkey="50859800" edgekey="50938320"/>
						</edges>
					</vertex>
					<vertex vertexkey="50917976">
						<edges>
							<edge vertexkey="50859160" edgekey="50939384"/>
						</edges>
					</vertex>
					<vertex vertexkey="51249560">
						<edges>
							<edge vertexkey="51089904" edgekey="50939232"/>
						</edges>
					</vertex>
					<vertex vertexkey="51327856">
						<edges>
							<edge vertexkey="51249736" edgekey="50938624"/>
						</edges>
					</vertex>
					<vertex vertexkey="51348656">
						<edges>
							<edge vertexkey="50859480" edgekey="50940296"/>
						</edges>
					</vertex>
					<vertex vertexkey="51425040">
						<edges>
							<edge vertexkey="51500688" edgekey="50940144"/>
						</edges>
					</vertex>
					<vertex vertexkey="51500528">
						<edges>
							<edge vertexkey="51422128" edgekey="50939688"/>
						</edges>
					</vertex>
				</vertices>
			</graph>
		</structure>
	</component>
</mapping>
