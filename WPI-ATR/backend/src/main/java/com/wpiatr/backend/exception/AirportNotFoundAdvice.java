package com.wpiatr.backend.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@ControllerAdvice
public class AirportNotFoundAdvice {
    @ResponseBody
    @ExceptionHandler(AirportNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public Map<String, String> exceptionHandler(AirportNotFoundException exception){
        Map<String, String> errorMap = new HashMap<>();
        errorMap.put("Error Message", exception.getMessage());
        return errorMap;
    }
}
