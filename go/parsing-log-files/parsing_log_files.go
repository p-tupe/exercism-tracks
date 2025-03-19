package parsinglogfiles

import (
	"regexp"
)

func IsValidLine(text string) bool {
	return regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)\]`).MatchString(text)
}

func SplitLogLine(text string) []string {
	return regexp.MustCompile(`<(~|\*|=|-)*?>`).Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	exp := regexp.MustCompile(`(?is)".*password.*"`)
	count := 0
	for _, line := range lines {
		if exp.MatchString(line) {
			count++
		}
	}
	return count
}

func RemoveEndOfLineText(text string) string {
	return regexp.MustCompile(`end-of-line\d+`).ReplaceAllString(text, "")
}

func TagWithUserName(lines []string) []string {
	exp := regexp.MustCompile(`User\s+(\w+)`)
	for i, line := range lines {
		name := exp.FindStringSubmatch(line)
		if len(name) > 0 {
			lines[i] = "[USR] " + name[1] + " " + line
		}
	}
	return lines
}
