
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JRResultSetDataSource"%>
<%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="java.io.InputStream"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>

<%@page
	import="net.sf.jasperreports.engine.data.JRBeanCollectionDataSource"%>
<%@page import="net.sf.jasperreports.engine.JRDataSource"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>
<body>
	<%
		try {
		List<Map<String, ?>> datasource;
		datasource = (List<Map<String, ?>>) request.getAttribute("products");

			// 			JRDataSource jrDatasource = new JRBeanCollectionDataSource(datasource);
			// 			String jrxmlFile = session.getServletContext().getRealPath("/report/productreport.jrxml");
			// 			InputStream inputStream = new FileInputStream(new File(jrxmlFile));
			// 			JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
			// 			JasperPrint jasperPrint = JasperFillManager.fillReport(inputStream, null, jrDatasource);
			// 			JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
			// 			response.getOutputStream().flush();
			// 			response.getOutputStream().close();

			InputStream reportStream = getServletConfig().getServletContext()
					.getResourceAsStream("/report/productreport.jrxml");
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			response.setContentType("application/pdf");
			JasperDesign design = JRXmlLoader.load(reportStream);
			JasperReport report = JasperCompileManager.compileReport(design);
			JRDataSource jrDatasource = new JRBeanCollectionDataSource(datasource);
			JasperPrint print = JasperFillManager.fillReport(report, null, jrDatasource);
			net.sf.jasperreports.engine.JasperExportManager.exportReportToPdfStream(print, baos);
			response.setContentLength(baos.size());
			ServletOutputStream out1 = response.getOutputStream();
			baos.writeTo(out1);
			out1.flush();
		} catch (Exception ex) {
			out.println(ex);
		}
	%>
</body>
</html>