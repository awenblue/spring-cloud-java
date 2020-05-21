package com.ilstoo.echo.channel;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.SubscribableChannel;

public interface MyProcessor {

    String OUTPUT = "my_topic_output";

    String INPUT = "my_topic_input";

    String INPUT1 = "my_topic1_input";


    @Output(OUTPUT)
    MessageChannel output();

    @Input(INPUT)
    SubscribableChannel input();

    @Input(INPUT1)
    SubscribableChannel input1();
}
