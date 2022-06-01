package com.temportal;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
class TemportalApplicationTests {

    private static final Logger log = LoggerFactory.getLogger(TemportalApplicationTests.class);

    @Test
    void hashPassword() {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String raw = "Pa$5VV4rD";
        String hash = encoder.encode("password");
        log.info("ハッシュ前：{}", raw);
        log.info("ハッシュ後：{}", hash);
    }
}
