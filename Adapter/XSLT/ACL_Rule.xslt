<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"  xmlns:ns2="http://www.tibco.com/pe/EngineTypes" xmlns:pd="http://xmlns.tibco.com/bw/process/2003" xmlns:ns1="http://www.tibco.com/pe/DeployedVarsType" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="http://www.trendmicro.com/ESB/schemas/AuthConfig" xmlns:ns0="http://www.tibco.com/schemas/PLSService/XSD/Common/Schema.xsd" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tib="http://www.tibco.com/bw/xslt/custom-functions" xmlns:pfx3="http://www.trendmicro.com/ESB/schemas/error" xmlns:TM="java://com.trendmicro.TMBWUtilities" xmlns:pfx2="http://www.trendmicro.com/ESB/schemas/errorReport" xmlns:pfx="http://www.tibco.com/pe/GenerateErrorActivity/InputSchema">
  <xsl:output method="xml" indent="no"/>

<xsl:template match="/">
  <xsl:choose>
  	<xsl:when test="exists(root/ns0:ACLConfig/ns0:ACL[lower-case(ns0:URI)=lower-case(//URI) and lower-case(ns0:SOAPAction)=lower-case(//SoapAction) and ns0:SourceIP = //SourceIP])">
  	<xsl:element name="Allow">
      <xsl:value-of select="root/ns0:ACLConfig/ns0:ACL[lower-case(ns0:URI)=lower-case(//URI) and lower-case(ns0:SOAPAction)=lower-case(//SoapAction) and ns0:SourceIP = //SourceIP]/ns0:Allow" />
    </xsl:element>
  	</xsl:when>
  	<xsl:when test="exists(root/ns0:ACLConfig/ns0:ACL[lower-case(ns0:URI)=lower-case(//URI) and lower-case(ns0:SOAPAction)=lower-case(//SoapAction) and ns0:SourceIP = '*'])">
  	<xsl:element name="Allow">
      <xsl:value-of select="root/ns0:ACLConfig/ns0:ACL[lower-case(ns0:URI)=lower-case(//URI) and lower-case(ns0:SOAPAction)=lower-case(//SoapAction) and ns0:SourceIP = '*']/ns0:Allow" />
    </xsl:element>
  	</xsl:when>
  	
  	<xsl:when test="exists(root/ns0:ACLConfig/ns0:ACL[lower-case(ns0:URI)=* and lower-case(ns0:SOAPAction)=* and ns0:SourceIP =  //SourceIP])">
  	<xsl:element name="Allow">
      <xsl:value-of select="root/ns0:ACLConfig/ns0:ACL[lower-case(ns0:URI)=* and lower-case(ns0:SOAPAction)=* and ns0:SourceIP =  //SourceIP]/ns0:Allow" />
    </xsl:element>
  	</xsl:when>
  		
	<xsl:when test="exists(root/ns0:ACLConfig/ns0:ACL[lower-case(ns0:URI)=lower-case(//URI) and lower-case(ns0:SOAPAction)=lower-case(//SoapAction) and tib:substring-before-last(ns0:SourceIP, '.')=//ipFront and //ipLast >= number((tib:tokenize(tib:substring-after-last(ns0:SourceIP,'.'), '-'))[1]) and //ipLast &lt;= number((tib:tokenize(tib:substring-after-last(ns0:SourceIP,'.'), '-'))[2])])">
  	<xsl:element name="Allow">
      <xsl:value-of select="root/ns0:ACLConfig/ns0:ACL[lower-case(ns0:URI)=lower-case(//URI) and lower-case(ns0:SOAPAction)=lower-case(//SoapAction) and tib:substring-before-last(ns0:SourceIP, '.')=//ipFront and (//ipLast >= number((tib:tokenize(tib:substring-after-last(ns0:SourceIP,'.'), '-'))[1]) and //ipLast &lt;= number((tib:tokenize(tib:substring-after-last(ns0:SourceIP,'.'), '-'))[2])) ]/ns0:Allow" />
    </xsl:element>
  	</xsl:when>
  	
  	<xsl:when test="exists(root/ns0:ACLConfig/ns0:ACL[lower-case(ns0:URI)='*' and lower-case(ns0:SOAPAction)='*' and tib:substring-before-last(ns0:SourceIP, '.')=//ipFront and //ipLast >= number((tib:tokenize(tib:substring-after-last(ns0:SourceIP,'.'), '-'))[1]) and //ipLast &lt;= number((tib:tokenize(tib:substring-after-last(ns0:SourceIP,'.'), '-'))[2])])">
  	<xsl:element name="Allow">
      <xsl:value-of select="root/ns0:ACLConfig/ns0:ACL[lower-case(ns0:URI)='*' and lower-case(ns0:SOAPAction)='*' and tib:substring-before-last(ns0:SourceIP, '.')=//ipFront and (//ipLast >= number((tib:tokenize(tib:substring-after-last(ns0:SourceIP,'.'), '-'))[1]) and //ipLast &lt;= number((tib:tokenize(tib:substring-after-last(ns0:SourceIP,'.'), '-'))[2])) ]/ns0:Allow" />
    </xsl:element>
  	</xsl:when>
  	
  	<xsl:otherwise>
        <xsl:element name="Allow"><xsl:value-of select="false()"/></xsl:element>
    </xsl:otherwise>
  </xsl:choose>
 </xsl:template>
	
  <xsl:template match="/|comment()|processing-instruction()">
    <xsl:copy>
      <!-- go process children (applies to root node only) -->
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*">
    <xsl:element name="{local-name()}">
      <!-- go process attributes and children -->
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*">
    <xsl:attribute name="{local-name()}">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  
 

</xsl:stylesheet>

