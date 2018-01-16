/**
 * ${generatedCodeWarning?replace("\n", "\n * ")}
 */
package app.jobs;

import cronapp.framework.scheduler.SchedulerConfigurer;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.stereotype.Component;

import cronapi.Var;

/**
 * ${task.message} ${task.name}
 *
 * ${task.description?replace("\n", "\n * ")}
 */
@Component
@DisallowConcurrentExecution
public class ${task.class} implements Job {

  @Override
  public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
    try {
<#list actions as action>
      //${action.name}
      ${action.code}
</#list>
    } catch (Exception e) {
      throw new JobExecutionException(e);
    }
  }

  @Bean(name = "${task.bean}")
  public JobDetailFactoryBean ${task.bean}() {
    return SchedulerConfigurer.createJobDetail(this.getClass());
  }

<#list triggers as trigger>
  /**
   * ${trigger.name}
   * ${trigger.description}
   */
  @Bean(name = "${trigger.bean}")
  public CronTriggerFactoryBean ${trigger.bean}(@Qualifier("${task.bean}") JobDetail jobDetail) {

    return SchedulerConfigurer.createCronTrigger(jobDetail, "${trigger.cronExpression}");
  }
</#list>
}