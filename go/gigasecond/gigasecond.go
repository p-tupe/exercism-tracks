// Package gigasecond implements utility methods for measuring metric seconds
package gigasecond

import "time"

const giga_second = 1e9 * time.Second

// AddGigasecond returns the date and time after adding one giga-second to t
func AddGigasecond(t time.Time) time.Time { return t.Add(giga_second) }
