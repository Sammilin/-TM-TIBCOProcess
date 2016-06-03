<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ns="http://www.trendmicro.com/ESB/schemas/MDM/EMEA_ERP/Customer" xmlns:ns0="http://www.trendmicro.com/ESB/schemas/SMF" xmlns:ns1="http://www.trendmicro.com/ESB/schemas/MDM/SFDC/Customer"  xmlns:ns2="http://www.trendmicro.com/ESB/schemas/MDM/MDMServer" xmlns:ns4="http://www.trendmicro.com/ESB/schemas/Common" xmlns:ns5="http://www.trendmicro.com/ESB/schemas/MDM/Rallying/Partner" xmlns:tib="http://www.tibco.com/bw/xslt/custom-functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/ns0:SMF" />
	</xsl:template>
	<xsl:template match="/ns0:SMF">
		<ns0:SMF>
			<ns0:SMFHeader>
				<ns4:MessageKey>
					<xsl:value-of select="ns0:SMFHeader/ns4:MessageKey"/>
				</ns4:MessageKey>
				<ns4:ServiceName>
					<xsl:value-of select="&quot;CreateSfCust&quot;"/>
				</ns4:ServiceName>
				<ns4:ServiceVersion>
					<xsl:value-of select="&quot;V1.0&quot;"/>
				</ns4:ServiceVersion>
				<ns4:SourceID>
					<xsl:value-of select="ns0:SMFHeader/ns4:SourceID"/>
				</ns4:SourceID>
				<xsl:if test="ns0:SMFHeader/ns4:SourceIP">
					<ns4:SourceIP>
						<xsl:value-of select="ns0:SMFHeader/ns4:SourceIP"/>
					</ns4:SourceIP>
				</xsl:if>
				<xsl:if test="ns0:SMFHeader/ns4:RqTimestamp">
					<ns4:RqTimestamp>
						<xsl:value-of select="ns0:SMFHeader/ns4:RqTimestamp"/>
					</ns4:RqTimestamp>
				</xsl:if>
				<xsl:if test="ns0:SMFHeader/ns4:RsTimestamp">
					<ns4:RsTimestamp>
						<xsl:value-of select="ns0:SMFHeader/ns4:RsTimestamp"/>
					</ns4:RsTimestamp>
				</xsl:if>
			</ns0:SMFHeader>
			<ns0:SMFBody>
				<xsl:choose>
					<xsl:when test="tib:trim(ns0:SMFHeader/ns4:ServiceName)!=&quot;CreateNavCust&quot;">
						<ns0:SFDC>
							<ns0:Customer>
								<ns1:SfdcPartnerId>
									<xsl:value-of select="&quot;&quot;"/>
								</ns1:SfdcPartnerId>
								<xsl:choose>
									<xsl:when test="tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id)!=&quot;&quot;">
										<xsl:if test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id">
											<ns1:MdmPartnerId>
												<xsl:copy-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id/@xsi:nil"/>
												<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id"/>
											</ns1:MdmPartnerId>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<ns1:MdmPartnerId>
											<xsl:choose>
												<xsl:when test="exists(ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:MDMCustID)">
													<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:MDMCustID"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="xsi:nil">true</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
										</ns1:MdmPartnerId>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Blocked='2' or ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Blocked='3'">
										<ns1:Active>
											<xsl:value-of select="&quot;false&quot;"/>
										</ns1:Active>
									</xsl:when>
									<xsl:otherwise>
										<ns1:Active>
											<xsl:value-of select="&quot;true&quot;"/>
										</ns1:Active>
									</xsl:otherwise>
								</xsl:choose>
								<ns1:AccountName>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:CustomerName"/>
								</ns1:AccountName>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:TransactionProfile='1' or ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:TransactionProfile='2'">
										<ns1:AccountType>
											<xsl:value-of select="&quot;Distributor&quot;"/>
										</ns1:AccountType>
									</xsl:when>
									<xsl:otherwise>
										<ns1:AccountType>
											<xsl:value-of select="&quot;Reseller&quot;"/>
										</ns1:AccountType>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:EndCustomer=&quot;false&quot; and ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Reseller=&quot;true&quot;">
										<ns1:AccountOtherType>
											<xsl:value-of select="&quot;Reseller&quot;"/>
										</ns1:AccountOtherType>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:TransactionProfile='0'">
												<!--AccountType=Reseller-->
												<xsl:choose>
													<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:EndCustomer=&quot;true&quot;  and ( ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment ='0' or ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment ='1')">
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;SMB End Customer&quot;"/>
														</ns1:AccountOtherType>
													</xsl:when>
													<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:EndCustomer=&quot;true&quot; and ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment ='2'">
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;Enterprise End Customer&quot;"/>
														</ns1:AccountOtherType>
													</xsl:when>
													<xsl:otherwise>
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;&quot;"/>
														</ns1:AccountOtherType>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<xsl:choose>
													<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:EndCustomer=&quot;true&quot; and ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Reseller=&quot;true&quot; and ( ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment ='0' or ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment ='1')">
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;Reseller;SMB End Customer&quot;"/>
														</ns1:AccountOtherType>
													</xsl:when>
													<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:EndCustomer=&quot;true&quot; and ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Reseller=&quot;true&quot; and ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment ='2'">
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;Reseller;Enterprise End Customer&quot;"/>
														</ns1:AccountOtherType>
													</xsl:when>
													<xsl:otherwise>
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;&quot;"/>
														</ns1:AccountOtherType>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Blocked='2' or ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Blocked='3'">
										<ns1:AccountStatus>
											<xsl:value-of select="&quot;Inactive&quot;"/>
										</ns1:AccountStatus>
									</xsl:when>
									<xsl:otherwise>
										<ns1:AccountStatus>
											<xsl:value-of select="&quot;Active&quot;"/>
										</ns1:AccountStatus>
									</xsl:otherwise>
								</xsl:choose>
								<ns1:VatNumber>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:VATRegNo"/>
								</ns1:VatNumber>
								<ns1:MainPhoneNumber>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Phone"/>
								</ns1:MainPhoneNumber>
								<ns1:Fax>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Fax"/>
								</ns1:Fax>
								<ns1:Country>
									<xsl:value-of select="$ExternalParam/root/Country"/>
								</ns1:Country>
								<ns1:EmailDomain>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Email"/>
								</ns1:EmailDomain>
								<ns1:NavisionID>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:NAVID"/>
								</ns1:NavisionID>
								<ns1:BillingCity>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:City"/>
								</ns1:BillingCity>
								<ns1:BillingCountry>
									<xsl:value-of select="$ExternalParam/root/Country"/>
								</ns1:BillingCountry>
								<ns1:BillingPostalCode>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:PostCode"/>
								</ns1:BillingPostalCode>
								<ns1:BillingState>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:County"/>
								</ns1:BillingState>
								<ns1:BillingStreet>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Address"/>
								</ns1:BillingStreet>
								<ns1:PartnerTier>
									<xsl:value-of select="$ExternalParam/root/Description"/>
								</ns1:PartnerTier>
								<ns1:MergedToSfdcPartnerId>
									<xsl:value-of select=""/>
								</ns1:MergedToSfdcPartnerId>
								<ns1:recordType>
									<xsl:value-of select="$AccountRecordType"/>
								</ns1:recordType>
							</ns0:Customer>
						</ns0:SFDC>
					</xsl:when>
					<xsl:otherwise>
						<ns0:SFDC>
							<ns0:Customer>
								<ns1:SfdcPartnerId>
									<xsl:value-of select="&quot;&quot;"/>
								</ns1:SfdcPartnerId>
								<ns1:MdmPartnerId>
									<xsl:copy-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id/@xsi:nil"/>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id"/>
								</ns1:MdmPartnerId>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status='2' or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status='3'">
										<ns1:Active>
											<xsl:value-of select="&quot;false&quot;"/>
										</ns1:Active>
									</xsl:when>
									<xsl:otherwise>
										<ns1:Active>
											<xsl:value-of select="&quot;true&quot;"/>
										</ns1:Active>
									</xsl:otherwise>
								</xsl:choose>
								<ns1:AccountName>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name"/>
								</ns1:AccountName>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor=&quot;true&quot; or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer=&quot;true&quot;" >
										<ns1:AccountType>
											<xsl:value-of select="&quot;Dsitributor&quot;"/>
										</ns1:AccountType>
									</xsl:when>
									<xsl:otherwise>
										<ns1:AccountType>
											<xsl:value-of select="&quot;Reseller&quot;"/>
										</ns1:AccountType>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller=&quot;true&quot; and ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor=&quot;true&quot; and ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser =&quot;false&quot; and ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer =&quot;false&quot;">
										<ns1:AccountOtherType>
											<xsl:value-of select="&quot;Reseller&quot;"/>
										</ns1:AccountOtherType>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor=&quot;true&quot;">
												<xsl:choose>
													<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller=&quot;true&quot; and  (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser =&quot;true&quot; or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer =&quot;true&quot;)">
														<xsl:choose>
															<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:segment = 0 or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:segment = 1">
																<ns1:AccountOtherType>
																	<xsl:value-of select="&quot;Reseller;SMB End Customer&quot;"/>
																</ns1:AccountOtherType>
															</xsl:when>
															<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:segment = 2">
																<ns1:AccountOtherType>
																	<xsl:value-of select="&quot;Reseller;Enterprise End Customer&quot;"/>
																</ns1:AccountOtherType>
															</xsl:when>
															<xsl:otherwise>
																<ns1:AccountOtherType>
																	<xsl:value-of select="&quot;Reseller;SMB End Customer&quot;"/>
																</ns1:AccountOtherType>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:when>
													<xsl:otherwise>
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;&quot;"/>
														</ns1:AccountOtherType>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<xsl:choose>
													<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller=&quot;true&quot; and  (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser =&quot;true&quot;  or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer =&quot;true&quot;)">
														<xsl:choose>
															<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:segment = 0 or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:segment = 1">
																<ns1:AccountOtherType>
																	<xsl:value-of select="&quot;SMB End Customer&quot;"/>
																</ns1:AccountOtherType>
															</xsl:when>
															<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:segment = 2">
																<ns1:AccountOtherType>
																	<xsl:value-of select="&quot;Enterprise End Customer&quot;"/>
																</ns1:AccountOtherType>
															</xsl:when>
															<xsl:otherwise>
																<ns1:AccountOtherType>
																	<xsl:value-of select="&quot;SMB End Customer&quot;"/>
																</ns1:AccountOtherType>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:when>
													<xsl:otherwise>
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;&quot;"/>
														</ns1:AccountOtherType>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status='2' or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status='3'">
										<ns1:AccountStatus>
											<xsl:value-of select="&quot;Inactive&quot;"/>
										</ns1:AccountStatus>
									</xsl:when>
									<xsl:otherwise>
										<ns1:AccountStatus>
											<xsl:value-of select="&quot;Active&quot;"/>
										</ns1:AccountStatus>
									</xsl:otherwise>
								</xsl:choose>
								<ns1:AKA>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:aka"/>
								</ns1:AKA>
								<ns1:VatNumber>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:vat_number"/>
								</ns1:VatNumber>
								<xsl:if test="not((ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no/@xsi:nil=(&quot;true&quot;)) or (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no/@xsi:nil=(&quot;1&quot;)))">
									<ns1:MainPhoneNumber>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no"/>
									</ns1:MainPhoneNumber>
								</xsl:if>
								<xsl:if test="not((ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no/@xsi:nil=(&quot;true&quot;)) or (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no/@xsi:nil=(&quot;1&quot;)))">
									<ns1:Fax>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no"/>
									</ns1:Fax>
								</xsl:if>
								<ns1:Country>
									<xsl:value-of select="$ExternalParam/root/Country"/>
								</ns1:Country>
								<ns1:Website>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_website"/>
								</ns1:Website>
								<ns1:EmailDomain>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email"/>
								</ns1:EmailDomain>
								<ns1:NavisionID>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:nav_id"/>
								</ns1:NavisionID>
								<ns1:DUNS>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:duns"/>
								</ns1:DUNS>
								<ns1:BillingCity>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city"/>
								</ns1:BillingCity>
								<ns1:BillingCountry>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country"/>
								</ns1:BillingCountry>
								<ns1:BillingPostalCode>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code"/>
								</ns1:BillingPostalCode>
								<ns1:BillingState>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county"/>
								</ns1:BillingState>
								<ns1:BillingStreet>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address"/>
								</ns1:BillingStreet>
								<ns1:PartnerTier>
									<xsl:value-of select="$ExternalParam/root/Description"/>
								</ns1:PartnerTier>
								<ns1:recordType>
									<xsl:value-of select="$AccountRecordType"/>
								</ns1:recordType>
							</ns0:Customer>
						</ns0:SFDC>
					</xsl:otherwise>
				</xsl:choose>
			</ns0:SMFBody>
		</ns0:SMF>

	</xsl:template>
</xsl:stylesheet>