<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ns="http://www.trendmicro.com/ESB/schemas/MDM/EMEA_ERP/Customer" xmlns:ns0="http://www.trendmicro.com/ESB/schemas/SMF" xmlns:ns1="http://www.trendmicro.com/ESB/schemas/MDM/SFDC/Customer" xmlns:ns2="http://www.trendmicro.com/ESB/schemas/MDM/MDMServer" xmlns:ns4="http://www.trendmicro.com/ESB/schemas/Common" xmlns:tib="http://www.tibco.com/bw/xslt/custom-functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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
					<xsl:value-of select="&quot;UpdateNavCust&quot;"/>
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
				<ns0:Navision>
					<ns0:Customer>
						<ns:Customer>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id/@xsi:nil">
									<ns:MDMCustID>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:MDMCustID"/>
									</ns:MDMCustID>
								</xsl:when>
								<xsl:otherwise>
									<ns:MDMCustID>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id"/>
									</ns:MDMCustID>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:DnBNum">
								<ns:DnBNum>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:DnBNum"/>
								</ns:DnBNum>
							</xsl:if>
							<xsl:if test="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:ParentDnBNum">
								<ns:ParentDnBNum>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:ParentDnBNum"/>
								</ns:ParentDnBNum>
							</xsl:if>
							<ns:SiebelID>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:SiebelID"/>
							</ns:SiebelID>
							<ns:SalesForceID>
								<xsl:value-of select="tib:if-absent(ns0:SMFBody/ns0:SFDC/ns0:Customer/ns1:SfdcPartnerId,$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:SalesForceID)"/>
							</ns:SalesForceID>
							<ns:NavDistiID>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:NavDistiID"/>
							</ns:NavDistiID>
							<ns:NAVID>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:NAVID"/>
							</ns:NAVID>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name/@xsi:nil">
									<ns:CustomerName>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:CustomerName"/>
									</ns:CustomerName>
								</xsl:when>
								<xsl:otherwise>
									<ns:CustomerName>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name"/>
									</ns:CustomerName>
								</xsl:otherwise>
							</xsl:choose>
							<ns:CustomerName2>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:CustomerName2"/>
							</ns:CustomerName2>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address/@xsi:nil">
									<ns:Address>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:Address"/>
									</ns:Address>
								</xsl:when>
								<xsl:otherwise>
									<ns:Address>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address"/>
									</ns:Address>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address_line2/@xsi:nil">
									<ns:Address2>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:Address2"/>
									</ns:Address2>
								</xsl:when>
								<xsl:otherwise>
									<ns:Address2>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address_line2"/>
									</ns:Address2>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city/@xsi:nil">
									<ns:City>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:City"/>
									</ns:City>
								</xsl:when>
								<xsl:otherwise>
									<ns:City>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city"/>
									</ns:City>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county/@xsi:nil">
									<ns:County>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:County"/>
									</ns:County>
								</xsl:when>
								<xsl:otherwise>
									<ns:County>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county"/>
									</ns:County>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code/@xsi:nil">
									<ns:PostCode>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:PostCode"/>
									</ns:PostCode>
								</xsl:when>
								<xsl:otherwise>
									<ns:PostCode>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code"/>
									</ns:PostCode>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country/@xsi:nil">
									<ns:CountryCode>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:CountryCode"/>
									</ns:CountryCode>
								</xsl:when>
								<xsl:otherwise>
									<ns:CountryCode>
										<xsl:value-of select="tib:if-absent($ExternalParam/root/Country,ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country)"/>
									</ns:CountryCode>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no/@xsi:nil">
									<ns:Phone>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:Phone"/>
									</ns:Phone>
								</xsl:when>
								<xsl:otherwise>
									<ns:Phone>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no"/>
									</ns:Phone>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no/@xsi:nil">
									<ns:Fax>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:Fax"/>
									</ns:Fax>
								</xsl:when>
								<xsl:otherwise>
									<ns:Fax>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no"/>
									</ns:Fax>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email/@xsi:nil">
									<ns:Email>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:Email"/>
									</ns:Email>
								</xsl:when>
								<xsl:otherwise>
									<ns:Email>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email"/>
									</ns:Email>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:language_code/@xsi:nil">
									<ns:LanguageCode>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:LanguageCode"/>
									</ns:LanguageCode>
								</xsl:when>
								<xsl:otherwise>
									<ns:LanguageCode>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:language_code"/>
									</ns:LanguageCode>
								</xsl:otherwise>
							</xsl:choose>
							<ns:LegalEntity>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:LegalEntity"/>
							</ns:LegalEntity>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser/@xsi:nil">
									<ns:EndCustomer>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:EndCustomer"/>
									</ns:EndCustomer>
								</xsl:when>
								<xsl:otherwise>
									<ns:EndCustomer>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser"/>
									</ns:EndCustomer>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller/@xsi:nil">
									<ns:Reseller>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:Reseller"/>
									</ns:Reseller>
								</xsl:when>
								<xsl:otherwise>
									<ns:Reseller>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller"/>
									</ns:Reseller>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor=&quot;true&quot;">
									<ns:TransactionProfile>
										<xsl:value-of select="1"/>
									</ns:TransactionProfile>
								</xsl:when>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer=&quot;true&quot;">
									<ns:TransactionProfile>
										<xsl:value-of select="2"/>
									</ns:TransactionProfile>
								</xsl:when>
								<xsl:otherwise>
									<ns:TransactionProfile>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:TransactionProfile"/>
									</ns:TransactionProfile>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:segment/@xsi:nil or tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:segment)=''">
									<ns:Segment>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:Segment"/>
									</ns:Segment>
								</xsl:when>
								<xsl:otherwise>
									<ns:Segment>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:segment"/>
									</ns:Segment>
								</xsl:otherwise>
							</xsl:choose>
							<ns:MasterNAVID>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:MasterNAVID"/>
							</ns:MasterNAVID>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status/@xsi:nil">
									<ns:Blocked>
										<xsl:value-of select="SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:Blocked"/>
									</ns:Blocked>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status=&quot;Inactive&quot; or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status=&quot;Rejected&quot;">
											<ns:Blocked>
												<xsl:value-of select="3"/>
											</ns:Blocked>
										</xsl:when>
										<xsl:when test="tib:trim(number(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status)) !=&quot;NaN&quot;">
											<ns:Blocked>
												<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status"/>
											</ns:Blocked>
										</xsl:when>
										<xsl:otherwise>
											<ns:Blocked>
												<xsl:value-of select="0"/>
											</ns:Blocked>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_tier/@xsi:nil">
									<ns:PartnerTier>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:PartnerTier"/>
									</ns:PartnerTier>
								</xsl:when>
								<xsl:otherwise>
									<ns:PartnerTier>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_tier"/>
									</ns:PartnerTier>
								</xsl:otherwise>
							</xsl:choose>
							<ns:VATRegNo>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:VATRegNo"/>
							</ns:VATRegNo>
							<xsl:if test="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:DefaultContactID">
								<ns:DefaultContactID>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:DefaultContactID"/>
								</ns:DefaultContactID>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="tib:trim($SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:SourceSystemID)=''">
									<ns:SourceSystemID>
										<xsl:value-of select="ns0:SMFHeader/ns4:SourceID"/>
									</ns:SourceSystemID>
								</xsl:when>
								<xsl:otherwise>
									<ns:SourceSystemID>
										<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:SourceSystemID"/>
									</ns:SourceSystemID>
								</xsl:otherwise>
							</xsl:choose>
							<ns:ContractTypeVAD>
								<xsl:value-of select="tib:if-absent($SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:ContractTypeVAD,0)"/>
							</ns:ContractTypeVAD>
							<ns:ContractTypeBroadline>
								<xsl:value-of select="tib:if-absent($SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:ContractTypeBroadline,0)"/>
							</ns:ContractTypeBroadline>
							<xsl:if test="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:Currency">
								<ns:Currency>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:Currency"/>
								</ns:Currency>
							</xsl:if>
						</ns:Customer>
					</ns0:Customer>
				</ns0:Navision>
			</ns0:SMFBody>
		</ns0:SMF>
	</xsl:template>
</xsl:stylesheet>