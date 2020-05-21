package com.ilstoo.echo.controller;

import com.ilstoo.echo.channel.MyProcessor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Processor;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.context.annotation.Bean;
import org.springframework.integration.annotation.InboundChannelAdapter;
import org.springframework.integration.annotation.Poller;
import org.springframework.integration.core.MessageSource;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Random;

/**
 * @author yihaowen
 * @create 2020-05-05 19:45
 */
@RestController
@RefreshScope
@Slf4j
public class TestController {

    private static final Random RANDOM = new Random(System.currentTimeMillis());

    private static final String[] data = new String[] {
            "abc1", "def1", "qux1",
            "abc2", "def2", "qux2",
            "abc3", "def3", "qux3",
            "abc4", "def4", "qux4",
    };

    @Value("${echo.account}")
    private String account;

    @Resource
    private MyProcessor processor;

    @GetMapping("/echo")
    @ResponseBody
    public String echo() {

        Message<?> message = generate();
        processor.output().send(message);

        return account;
    }

    public Message<?> generate() {
        String value = data[RANDOM.nextInt(data.length)];
        log.info("Sending: " + value);
        return MessageBuilder.withPayload(value)
                .setHeader("amqp_consumerQueue", value)
                .build();
    }
}
