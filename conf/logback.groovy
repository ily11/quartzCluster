import ch.qos.logback.core.filter.EvaluatorFilter
import ch.qos.logback.classic.boolex.GEventEvaluator
import ch.qos.logback.core.util.FileSize
import static ch.qos.logback.classic.Level.INFO
import static ch.qos.logback.core.spi.FilterReply.DENY
import static ch.qos.logback.core.spi.FilterReply.NEUTRAL


def userDir = System.getProperty("user.dir")

appender("FILE", RollingFileAppender) {
    append =true
    rollingPolicy(TimeBasedRollingPolicy) {
        fileNamePattern = userDir+"/logs/%d{yyyy-MM-dd}_info.log"
        maxHistory = 30 // controls the maximum number of archive files to keep, asynchronously deleting older files
        totalSizeCap = FileSize.valueOf("3 gb")
    }
    encoder(PatternLayoutEncoder) {
        pattern = '%d{yyyy-MM-dd HH:mm:ss} [%thread] %-5level  %logger - %msg%n'
    }
    filter(EvaluatorFilter) {
        evaluator(GEventEvaluator) {
            expression = 'e.level.toInt() <= INFO.toInt()'
        }
        onMatch = NEUTRAL
        onMismatch = DENY
    }
}

appender("ERROR_FILE", RollingFileAppender) {
    append =true
    rollingPolicy(TimeBasedRollingPolicy) {
        fileNamePattern =  userDir+"/logs/%d{yyyy-MM-dd}_error.log"
        maxHistory = 30 // controls the maximum number of archive files to keep, asynchronously deleting older files
        totalSizeCap = FileSize.valueOf("3 gb")
    }
    encoder(PatternLayoutEncoder) {
        pattern = '%d{yyyy-MM-dd HH:mm:ss} [%thread] %-5level  %logger - %msg%n'
    }
    filter(EvaluatorFilter) {
        evaluator(GEventEvaluator) {
            expression = 'e.level.toInt() > INFO.toInt()'
        }
        onMatch = NEUTRAL
        onMismatch = DENY
    }
}

appender("CONSOLE", ConsoleAppender) {
    encoder(PatternLayoutEncoder) {
        pattern = '%d{yyyy-MM-dd HH:mm:ss} [%thread] %-5level  %logger - %msg%n'
    }
    filter(EvaluatorFilter) {
        evaluator(GEventEvaluator) {
            expression = 'e.level.toInt() >= INFO.toInt()'
        }
        onMatch = NEUTRAL
        onMismatch = DENY
    }
}

root(INFO, ["CONSOLE", "ERROR_FILE", "FILE"])
