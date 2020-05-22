package com.ilstoo.echo;

import brave.sampler.Sampler;
import com.ilstoo.echo.channel.MyProcessor;
import org.springframework.amqp.support.AmqpHeaders;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.context.annotation.Bean;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Payload;

@SpringBootApplication
@EnableDiscoveryClient
@EnableBinding({ MyProcessor.class }) // 1
public class EchoApplication {

	public static void main(String[] args) {
		SpringApplication.run(EchoApplication.class, args);
	}

	@StreamListener(MyProcessor.INPUT)
	public void listen(@Payload String in, @Header(AmqpHeaders.CONSUMER_QUEUE) String queue) {
		System.out.println(MyProcessor.INPUT + "===>" + in + " received from queue " + queue);
	}

	@StreamListener(MyProcessor.INPUT1)
	public void listen1(@Payload String in, @Header(AmqpHeaders.CONSUMER_QUEUE) String queue) {
		System.out.println(MyProcessor.INPUT1 + "===>" + in + " received from queue " + queue);
	}

	@Bean
	public Sampler defaultSampler() { return Sampler.ALWAYS_SAMPLE;}
}