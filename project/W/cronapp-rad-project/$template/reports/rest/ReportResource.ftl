package reports.rest;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import reports.commons.ReportFront;
import reports.service.ReportService;

@RestController
@RequestMapping("/api/rest")
public class ReportResource {
  
  private static final Logger log = LoggerFactory.getLogger(ReportResource.class);
  
  @Autowired
  private ReportService reportService;
  
  @RequestMapping(value = "/report", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<ReportFront> getReport(@RequestBody ReportFront reportFront) {
    if(reportFront == null)
      return ResponseEntity.badRequest().header("Error", "Report is null").body(new ReportFront());
    log.debug("Get report [" + reportFront + "].");
    ReportFront reportResult = reportService.getReport(reportFront.getReportName());
    return ResponseEntity.ok().body(reportResult);
  }
  
  @RequestMapping(value = "/report/pdf", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
  public ResponseEntity<byte[]> getPDF(@RequestBody ReportFront reportFront, HttpServletResponse response) {
    if(reportFront == null)
      return ResponseEntity.badRequest().header("Error", "Report is null").body(new byte[0]);
    String reportName = reportFront.getReportName();
    log.debug("Print report [" + reportName + "]");
    response.setHeader("Content-Disposition", "inline; filename=" + reportName + ".pdf");
    response.setContentType("application/pdf");
    byte[] reportResult = reportService.getPDF(reportFront);
    return ResponseEntity.ok().body(reportResult);
  }
  
}
