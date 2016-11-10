package reports.rest;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import org.glassfish.jersey.server.ResourceConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import reports.commons.ReportFront;
import reports.service.ReportService;

@ApplicationPath("/api/rest/report")
@Path("/")
@Consumes({ MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN })
public class ReportResource extends ResourceConfig {
  
  private static final Logger log = LoggerFactory.getLogger(ReportResource.class);
  
  private final ReportService reportService;
  
  public ReportResource() {
    super.packages("reports.rest");
    this.reportService = new ReportService();
  }
  
  @GET
  @Path("{reportName}")
  @Produces(MediaType.APPLICATION_JSON)
  public ReportFront getReport(@PathParam("reportName") String reportName) {
    log.debug("Find report [" + reportName + "].");
    return this.reportService.getReport(reportName);
  }
  
  @POST
  @Path("pdf")
  @Produces(MediaType.MULTIPART_FORM_DATA)
  public byte[] getPDF(ReportFront reportFront) {
    log.debug("Print report [" + reportFront.getReportName() + "]");
    return this.reportService.getPDF(reportFront);
  }
  
}
