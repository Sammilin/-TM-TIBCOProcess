<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ns="http://www.trendmicro.com/ESB/schemas/MDM/EMEA_ERP/Customer" xmlns:ns0="http://www.trendmicro.com/ESB/schemas/SMF" xmlns:ns2="http://www.trendmicro.com/ESB/schemas/MDM/MDMServer" xmlns:ns4="http://www.trendmicro.com/ESB/schemas/Common" xmlns:ns6="http://www.trendmicro.com/ESB/schemas/MDM/TeO/Customer" xmlns:tib="http://www.tibco.com/bw/xslt/custom-functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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
					<xsl:value-of select="&quot;UpdateTeOCust&quot;"/>
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
				<ns0:TeO>
					<ns0:Customer>
						<ns6:Customer>
							<ns6:Command>
							<xsl:value-of select="$ServiceName"/>
							</ns6:Command>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:nav_id/@xsi:nil or tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:nav_id)=''">
									<ns6:NavisionID>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:NAVID"/>
									</ns6:NavisionID>
								</xsl:when>
								<xsl:otherwise>
									<ns6:NavisionID>
										<xsl:value-of select=" ns0:SMFBody/ns0:MDM/ns0:Company/ns2:nav_id"/>
									</ns6:NavisionID>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id/@xsi:nil">
									<ns6:MDMID>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:MDMCustID"/>
									</ns6:MDMID>
								</xsl:when>
								<xsl:otherwise>
									<ns6:MDMID>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id"/>
									</ns6:MDMID>
								</xsl:otherwise>
							</xsl:choose>
							<ns6:SFID>
								<xsl:value-of select="tib:if-absent(ns0:SMFBody/ns0:MDM/ns0:SourceIDMapping/ns2:SfId,ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:SalesForceID)"/>
							</ns6:SFID>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:duns/@xsi:nil">
									<ns6:DUNSID>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:DnBNum"/>
									</ns6:DUNSID>
								</xsl:when>
								<xsl:otherwise>
									<ns6:DUNSID>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:duns"/>
									</ns6:DUNSID>
								</xsl:otherwise>
							</xsl:choose>
							
							<xsl:choose>
								<xsl:when test="exists(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:B2BCustID)">
								<ns6:B2BID>
								<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:B2BCustID"/>
								</ns6:B2BID>
								</xsl:when>	
								<xsl:otherwise>
								<ns6:B2BID>
								<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:B2BCustID"/>
							</ns6:B2BID>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor=(&quot;true&quot;) or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer=(&quot;true&quot;)">
									<ns6:IsDisti>
										<xsl:value-of select="&quot;true&quot;"/>
									</ns6:IsDisti>
								</xsl:when>
								<xsl:otherwise>
									<ns6:IsDisti>
										<xsl:value-of select="&quot;false&quot;"/>
									</ns6:IsDisti>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller/@xsi:nil">
									<ns6:IsReseller>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Reseller"/>
									</ns6:IsReseller>
								</xsl:when>
								<xsl:otherwise>
									<ns6:IsReseller>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller"/>
									</ns6:IsReseller>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser/@xsi:nil">
									<ns6:IsEndUser>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:EndCustomer"/>
									</ns6:IsEndUser>
								</xsl:when>
								<xsl:otherwise>
									<ns6:IsEndUser>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser"/>
									</ns6:IsEndUser>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country/@xsi:nil">
									<ns6:CountryID>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:CountryCode"/>
									</ns6:CountryID>
								</xsl:when>
								<xsl:otherwise>
									<ns6:CountryID>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country"/>
									</ns6:CountryID>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name/@xsi:nil">
									<ns6:Name>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:CustomerName"/>
									</ns6:Name>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Name>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name"/>
									</ns6:Name>
								</xsl:otherwise>
							</xsl:choose>
							<ns6:Name2>
								<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:CustomerName2"/>
							</ns6:Name2>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address/@xsi:nil">
									<ns6:Address>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Address"/>
									</ns6:Address>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Address>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address"/>
									</ns6:Address>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address_line2/@xsi:nil">
									<ns6:Address2>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Address2"/>
									</ns6:Address2>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Address2>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address_line2"/>
									</ns6:Address2>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city/@xsi:nil">
									<ns6:City>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:City"/>
									</ns6:City>
								</xsl:when>
								<xsl:otherwise>
									<ns6:City>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city"/>
									</ns6:City>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county/@xsi:nil">
									<ns6:County>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:County"/>
									</ns6:County>
								</xsl:when>
								<xsl:otherwise>
									<ns6:County>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county"/>
									</ns6:County>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email/@xsi:nil">
									<ns6:Email>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Email"/>
									</ns6:Email>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Email>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email"/>
									</ns6:Email>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no/@xsi:nil">
									<ns6:Fax>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Fax"/>
									</ns6:Fax>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Fax>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no"/>
									</ns6:Fax>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no/@xsi:nil">
									<ns6:Phone>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Phone"/>
									</ns6:Phone>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Phone>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no"/>
									</ns6:Phone>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="not(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_website/@xsi:nil)">
								<ns6:Website>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_website"/>
								</ns6:Website>
							</xsl:if>
							<xsl:if test="not((ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code/@xsi:nil=(&quot;true&quot;)) or (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code/@xsi:nil=(&quot;1&quot;)))">
								<ns6:Zip>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code"/>
								</ns6:Zip>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:language_code/@xsi:nil">
									<ns6:LanguageCode>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:LanguageCode"/>
									</ns6:LanguageCode>
								</xsl:when>
								<xsl:otherwise>
									<ns6:LanguageCode>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:language_code"/>
									</ns6:LanguageCode>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status/@xsi:nil  or ns0:SMFHeader/ns4:ServiceName='UpdateNavCust'">
									<xsl:choose>
										<xsl:when test="tib:trim($SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:TEO_IsBlocked)=&quot;true&quot; or tib:trim($SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:TEO_IsBlocked)=1">
											<ns6:Blocked>
												<xsl:value-of select="1"/>
											</ns6:Blocked>
										</xsl:when>
										<xsl:otherwise>
											<ns6:Blocked>
												<xsl:value-of select="0"/>
											</ns6:Blocked>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status=&quot;Inactive&quot; or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status=&quot;Rejected&quot;">
											<ns6:Blocked>
												<xsl:value-of select="3"/>
											</ns6:Blocked>
										</xsl:when>
										<xsl:when test="tib:trim(number(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status)) !=&quot;NaN&quot;">
											<ns6:Blocked>
												<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status"/>
											</ns6:Blocked>
										</xsl:when>
										<xsl:otherwise>
											<ns6:Blocked>
												<xsl:value-of select="0"/>
											</ns6:Blocked>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
							<!--Remove From Navision January 12, 2015-->
							<!--
							<ns6:IsVad>
								<xsl:value-of select="tib:if-absent($SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:ContractTypeVAD,0)"/>
							</ns6:IsVad>
							<ns6:IsBroadliner>
								<xsl:value-of select="tib:if-absent($SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:ContractTypeBroadline,0)"/>
							</ns6:IsBroadliner>
							-->
							<ns6:DistributorType>
								<xsl:value-of select="tib:if-absent($SelectSourceCustomerData/ns0:Navision/ns0:Customer/ns:Customer/ns:DistributorType,0)"/>
							</ns6:DistributorType>
							<!--Update Company data from Navision-->
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:Company/@xsi:nil">
									<ns6:Company>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:Company"/>
									</ns6:Company>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Company>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:Company"/>
									</ns6:Company>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="not(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:currency_code/@xsi:nil)">
								<ns6:Currency>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:currency_code"/>
								</ns6:Currency>
							</xsl:if>
							<ns6:Category>
								<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:PartnerTier"/>
							</ns6:Category>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:DefaultAccred/@xsi:nil">
									<ns6:DefaultAccred>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:DefaultAccred"/>
									</ns6:DefaultAccred>
								</xsl:when>
								<xsl:otherwise>
									<ns6:DefaultAccred>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:DefaultAccred"/>
									</ns6:DefaultAccred>
								</xsl:otherwise>
							</xsl:choose>
							<ns6:DefaultContactID>
								<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:DefaultContactID"/>
							</ns6:DefaultContactID>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:MSP/@xsi:nil or tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:MSP)=''">
									<ns6:IsXSP>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:MSP"/>
									</ns6:IsXSP>
								</xsl:when>
								<xsl:otherwise>
									<ns6:IsXSP>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:MSP"/>
									</ns6:IsXSP>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:MarketPlace/@xsi:nil or tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:MarketPlace)='' ">
									<ns6:IsMarketPlace>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:MarketPlace"/>
									</ns6:IsMarketPlace>
								</xsl:when>
								<xsl:otherwise>
									<ns6:IsMarketPlace>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:MarketPlace"/>
									</ns6:IsMarketPlace>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:MSPContractSigned/@xsi:nil or tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:MSPContractSigned)='' ">
									<ns6:ContractFlag>
										<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:MSPContractSigned"/>
									</ns6:ContractFlag>
								</xsl:when>
								<xsl:otherwise>
									<ns6:ContractFlag>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:MSPContractSigned"/>
									</ns6:ContractFlag>
								</xsl:otherwise>
							</xsl:choose>
						</ns6:Customer>
					</ns0:Customer>
				</ns0:TeO>
			</ns0:SMFBody>
		</ns0:SMF>
	</xsl:template>
</xsl:stylesheet>