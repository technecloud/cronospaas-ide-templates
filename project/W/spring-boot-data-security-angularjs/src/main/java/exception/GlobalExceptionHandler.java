package exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.*;

import org.apache.commons.lang3.exception.ExceptionUtils;

@ControllerAdvice
@RestController
public class GlobalExceptionHandler {

    @ExceptionHandler(TransactionSystemException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    public ExceptionResponse handleTransactionSystemException(TransactionSystemException ex) {
        return new ExceptionResponse( extractRootCauseMessage(ex) );
    }

    private String extractRootCauseMessage(Exception ex){
        String rootCauseMessage = ExceptionUtils.getRootCauseMessage(ex);
        int indexLabelException = rootCauseMessage.indexOf(":");
        if(indexLabelException != -1)
            rootCauseMessage = rootCauseMessage.substring(indexLabelException+1);
        return rootCauseMessage;
    }


}