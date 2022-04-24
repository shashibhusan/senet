<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
	String countries[] = { 	"Introduction",
							"Organisation",
						 	"Services",
							"Development Commissioner (Micro, Small & Medium Enterprises) Headquarter.",
							"Address of Field Offices working under DC-MSME",
							"MSME-DI / BR. MSME-DI / MSME-TCs / MSME-TSs",
							"Autonomous Bodies",
							"Entrepreneurs Memorandum (Part-II) Data on MSME Sector",
							"Data & StatisticsData & Statistics",
							"Final Report Fourth all India Census of MSME 2006-2007 Book",
							"Quick Results Fourth All India Census Of MSME 2006-2007",
							"Field verification and updation of enterprises for data collection on items included in the commodity basket selected for IIP-MSME. CD Download",
							"ANNUAL REPORT - Ministry of Micro, Small and Medium Enterprises",
							"ANNUAL REPORT - MSME-DIs 2011-12",
							"ANNUAL REPORT - MSME-DIs 2012-13",
							"DISTRICTS INDUSTRIAL PROFILES ",
							"Budget",
							"Outcome Budget",
							"Demand for Grants: 2013-2014",
							"Demand for Grants: 2013-201",
							"Statement of Budget Estimates",
							"Allocation of funds to MSME - DIs. (Sanction Order)",
							"Allocation and Sanction of funds for conducting National and State Level Vendor Development Programmes by MSME-Dls during 2013-14.",
							"Online Application",
							"Hindi Sanskaran",
							"Innovation Action Plan",
							"Public Procurement",
							"Package For Promotion",
							"MSME Publications",
							"MSME in India",
							"Overview of MSME in India (In English)",
							"Definition of MSME",
							"National Portal",
							"Useful Links",
							"Addresses of DICs",
							"MSME Ministry",
							"GOI Websites ",
							};
	
	String query = (String)request.getParameter("q");
	//System.out.println("1"+request.getParameterNames().nextElement());
	response.setHeader("Content-Type", "text/html");
	int cnt=1;
	for(int i=0;i<countries.length;i++)
	{
		if(countries[i].toUpperCase().startsWith(query.toUpperCase()))
		{
			out.print(countries[i]+"\n");
			if(cnt>=10)
				break;
			cnt++;
		}
	}
%>