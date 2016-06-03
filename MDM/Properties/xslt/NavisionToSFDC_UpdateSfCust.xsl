<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"  xmlns:TM="java://com.trendmicro.TMBWUtilities" xmlns:ns="http://www.trendmicro.com/ESB/schemas/MDM/EMEA_ERP/Customer" xmlns:ns0="http://www.trendmicro.com/ESB/schemas/SMF" xmlns:ns1="http://www.trendmicro.com/ESB/schemas/MDM/SFDC/Customer" xmlns:ns2="http://www.trendmicro.com/ESB/schemas/MDM/MDMServer" xmlns:ns4="http://www.trendmicro.com/ESB/schemas/Common" xmlns:ns5="http://www.trendmicro.com/ESB/schemas/MDM/Rallying/Partner" xmlns:tib="http://www.tibco.com/bw/xslt/custom-functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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
					<xsl:value-of select="&quot;UpdateSfCust&quot;"/>
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
				<ns0:SFDC>
					<ns0:Customer>
						<ns1:SfdcPartnerId>
							<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:SfdcPartnerId"/>
						</ns1:SfdcPartnerId>
						<ns1:MdmPartnerId>
							<xsl:copy-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:MdmPartnerId/@xsi:nil"/>
							<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:MdmPartnerId"/>
						</ns1:MdmPartnerId>
						<ns1:Active>
							<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:Active"/>
						</ns1:Active>
						<xsl:choose>
							<xsl:when test="tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name)!=''">
								<ns1:AccountName>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name"/>
								</ns1:AccountName>
							</xsl:when>
							<xsl:otherwise>
								<ns1:AccountName>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:AccountName"/>
								</ns1:AccountName>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller/@xsi:nil">
								<ns1:AccountType>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:AccountType"/>
								</ns1:AccountType>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor=&quot;true&quot; or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer=&quot;true&quot;">
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
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller/@xsi:nil and &#xA;ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser/@xsi:nil and&#xA;ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer/@xsi:nil">
								<ns1:AccountOtherType>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:AccountOtherType"/>
								</ns1:AccountOtherType>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:TransactionProfile='1' or &#xA;ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:TransactionProfile='2'">
										<xsl:choose>
											<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Reseller=&quot;true&quot; and&#xA;ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:EndCustomer=&quot;false&quot;">
												<ns1:AccountOtherType>
													<xsl:value-of select="&quot;Reseller&quot;"/>
												</ns1:AccountOtherType>
											</xsl:when>
											<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Reseller=&quot;true&quot; and&#xA;ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:EndCustomer=&quot;true&quot;">
												<xsl:choose>
													<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment=0 or&#xA;ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment=1">
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;Reseller;SMB End Customer&quot;"/>
														</ns1:AccountOtherType>
													</xsl:when>
													<xsl:otherwise>
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;Reseller;Enterprise End Customer&quot;"/>
														</ns1:AccountOtherType>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Reseller=&quot;false&quot; and&#xA;ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:EndCustomer=&quot;true&quot;">
												<xsl:choose>
													<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment=0 or&#xA;ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment=1">
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;SMB End Customer&quot;"/>
														</ns1:AccountOtherType>
													</xsl:when>
													<xsl:otherwise>
														<ns1:AccountOtherType>
															<xsl:value-of select="&quot;Enterprise End Customer&quot;"/>
														</ns1:AccountOtherType>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise/>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment=0 or&#xA;ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment=1">
												<ns1:AccountOtherType>
													<xsl:value-of select="&quot;SMB End Customer&quot;"/>
												</ns1:AccountOtherType>
											</xsl:when>
											<xsl:otherwise>
												<ns1:AccountOtherType>
													<xsl:value-of select="&quot;Enterprise End Customer&quot;"/>
												</ns1:AccountOtherType>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status/@xsi:nil">
								<ns1:AccountStatus>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:AccountStatus"/>
								</ns1:AccountStatus>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:AccountStatus=&quot;Rejected&quot;">
										<ns1:AccountStatus>
											<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:AccountStatus"/>
										</ns1:AccountStatus>
									</xsl:when>
									<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status='0' or&#xA;ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status='1'">
										<ns1:AccountStatus>
											<xsl:value-of select="&quot;Active&quot;"/>
										</ns1:AccountStatus>
									</xsl:when>
									<xsl:otherwise>
										<ns1:AccountStatus>
											<xsl:value-of select="&quot;Inactive&quot;"/>
										</ns1:AccountStatus>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<ns1:AKA>
							<xsl:value-of select="tib:if-absent(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:aka,$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:AKA)"/>
						</ns1:AKA>
						<ns1:VatNumber>
							<xsl:value-of select="tib:if-absent(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:vat_number,$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:VatNumber)"/>
						</ns1:VatNumber>
						<ns1:MainPhoneNumber>
							<xsl:value-of select="tib:if-absent(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no,$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:MainPhoneNumber)"/>
						</ns1:MainPhoneNumber>
						<ns1:Fax>
							<xsl:value-of select="tib:if-absent(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no,$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:Fax)"/>
						</ns1:Fax>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country/@xsi:nil">
								<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:Country">
									<ns1:Country>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:Country"/>
									</ns1:Country>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<ns1:Country>
									<xsl:value-of select="$ExternalParam/root/Country"/>
								</ns1:Country>
							</xsl:otherwise>
						</xsl:choose>



						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_website/@xsi:nil">
								<ns1:Website>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:Website"/>
								</ns1:Website>
							</xsl:when>
							<xsl:otherwise>
								<ns1:Website>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_website"/>
								</ns1:Website>
							</xsl:otherwise>
						</xsl:choose>
						<!--<ns1:Website>
							<xsl:value-of select="tib:if-absent(tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_website),$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:Website)"/>
						</ns1:Website>-->
						
						
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email/@xsi:nil">
								<ns1:EmailDomain>
							<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:EmailDomain"/>
						</ns1:EmailDomain>
							</xsl:when>
							<xsl:otherwise>
								<ns1:EmailDomain>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email"/>
						</ns1:EmailDomain>
							</xsl:otherwise>
						</xsl:choose>
						<!--
						<ns1:EmailDomain>
							<xsl:value-of select="tib:if-absent(tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email),$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:EmailDomain)"/>
						</ns1:EmailDomain>-->
						<ns1:NavisionID>
							<xsl:value-of select="tib:if-absent(ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:NAVID,$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:NavisionID)"/>
						</ns1:NavisionID>
						<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:DUNSName">
							<ns1:DUNSName>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:DUNSName"/>
							</ns1:DUNSName>
						</xsl:if>
						<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:DUNS">
							<ns1:DUNS>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:DUNS"/>
							</ns1:DUNS>
						</xsl:if>
						<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:DUNSDirectParent">
							<ns1:DUNSDirectParent>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:DUNSDirectParent"/>
							</ns1:DUNSDirectParent>
						</xsl:if>
						<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:DUNSGlobalParent">
							<ns1:DUNSGlobalParent>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:DUNSGlobalParent"/>
							</ns1:DUNSGlobalParent>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city/@xsi:nil">
								<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:BillingCity">
									<ns1:BillingCity>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:BillingCity"/>
									</ns1:BillingCity>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="not((ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city/@xsi:nil=(&quot;true&quot;)) or (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city/@xsi:nil=(&quot;1&quot;)))">
									<ns1:BillingCity>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city"/>
									</ns1:BillingCity>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country/@xsi:nil">
								<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:BillingCountry">
									<ns1:BillingCountry>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:BillingCountry"/>
									</ns1:BillingCountry>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="not((ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country/@xsi:nil=(&quot;true&quot;)) or (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country/@xsi:nil=(&quot;1&quot;)))">
									<ns1:BillingCountry>
										<xsl:value-of select="$ExternalParam/root/Country"/>
									</ns1:BillingCountry>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code/@xsi:nil">
								<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:BillingPostalCode">
									<ns1:BillingPostalCode>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:BillingPostalCode"/>
									</ns1:BillingPostalCode>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="not((ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code/@xsi:nil=(&quot;true&quot;)) or (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code/@xsi:nil=(&quot;1&quot;)))">
									<ns1:BillingPostalCode>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code"/>
									</ns1:BillingPostalCode>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county/@xsi:nil">
								<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:BillingState">
									<ns1:BillingState>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:BillingState"/>
									</ns1:BillingState>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="not((ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county/@xsi:nil=(&quot;true&quot;)) or (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county/@xsi:nil=(&quot;1&quot;)))">
									<ns1:BillingState>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county"/>
									</ns1:BillingState>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address/@xsi:nil">
								<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:BillingStreet">
									<ns1:BillingStreet>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:BillingStreet"/>
									</ns1:BillingStreet>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="not((ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address/@xsi:nil=(&quot;true&quot;)) or (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address/@xsi:nil=(&quot;1&quot;)))">
									<ns1:BillingStreet>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address"/>
									</ns1:BillingStreet>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:ParentAccount">
							<ns1:ParentAccount>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:ParentAccount"/>
							</ns1:ParentAccount>
						</xsl:if>

						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_tier/@xsi:nil">
								<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:PartnerTier">
									<ns1:PartnerTier>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:PartnerTier"/>
									</ns1:PartnerTier>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<ns1:PartnerTier>
									<xsl:value-of select="$ExternalParam/root/Description"/>
								</ns1:PartnerTier>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFHeader/ns4:ServiceName=$MergeNavCust">
								<ns1:MergedToSfdcPartnerId>
									<xsl:value-of select="$ExternalParam/root/sfdc_partner_id"/>
								</ns1:MergedToSfdcPartnerId>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:MergedToSfdcPartnerId">
									<ns1:MergedToSfdcPartnerId>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:MergedToSfdcPartnerId"/>
									</ns1:MergedToSfdcPartnerId>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						<ns1:recordType>
							<xsl:value-of select="tib:if-absent($AccountRecordType,$SelectSourceCustomerData/ns0:SFDC/ns0:Customer[1]/ns1:recordType)"/>
						</ns1:recordType>
					</ns0:Customer>
				</ns0:SFDC>
			</ns0:SMFBody>
		</ns0:SMF>
	</xsl:template>
</xsl:stylesheet>