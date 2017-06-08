package com.zhukovsd.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.awt.*;

/**
 * Created by zhukovsd on 01.06.2017.
 */

@RestController
public class TestController {
    @RequestMapping(value = "/hello/{name}", method = RequestMethod.GET)
    public Message message(@PathVariable("name") String name) throws Exception {
        Message msg = new Message(name, "Hello " + name);

        if (!name.equals("mate")) {
            throw new Exception("you are not my mate");
        }

        return msg;
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity onException(Exception ex) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
                new ErrorMessage(ex.getClass().getSimpleName(), ex.getMessage())
        );
    }


    @GetMapping("/test")
    public String test() {
        return "test";
    }
}
