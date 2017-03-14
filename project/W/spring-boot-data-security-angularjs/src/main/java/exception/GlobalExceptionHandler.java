package exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.*;

import org.apache.commons.lang3.exception.ExceptionUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@ControllerAdvice
@RestController
public class GlobalExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(TransactionSystemException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    public ExceptionResponse handleTransactionSystemException(TransactionSystemException e) {
        log.error(e.getMessage());
        return new ExceptionResponse( extractRootCauseMessage(e) );
    }

    private String extractRootCauseMessage(Exception ex){
        String rootCauseMessage = ExceptionUtils.getRootCauseMessage(ex);
        int indexLabelException = rootCauseMessage.indexOf(":");
        if(indexLabelException != -1)
            rootCauseMessage = rootCauseMessage.substring(indexLabelException+1);
        return rootCauseMessage;
    }

}