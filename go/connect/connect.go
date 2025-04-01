// Package connect implements a naive function to
// calculate a winner of a given Hex board representation.
package connect

import (
	"fmt"
	"strings"
)

type cell struct {
	value     rune
	row       int
	col       int
	tl        *cell
	tr        *cell
	l         *cell
	r         *cell
	bl        *cell
	br        *cell
	isVisited bool
	isStart   bool // Top row is start for O, left col for X
	isEnd     bool // Bottom row is end for O, right col for X
}

func (c *cell) String() string {
	return fmt.Sprintf("{ value: %c, row: %d, col: %d, isStart: %v, isEnd: %v}", c.value, c.row, c.col, c.isStart, c.isEnd)
}

// findValidChain takes an unvisited cell and
//   - marks it visited and
//   - checks if it is the end of a winning chain or
//   - else goes exploring the neighbors
func (c *cell) findValidChain(winner chan<- rune) {
	if c.isVisited {
		return
	} else {
		c.isVisited = true
	}

	if c.isEnd {
		winner <- c.value
		return
	}

	for _, n := range []*cell{c.tl, c.tr, c.l, c.r, c.bl, c.br} {
		if n != nil && n.value == c.value {
			n.findValidChain(winner)
		}
	}
}

// deconstructBoard takes in a slice of strings representing a board,
// and returns a slice of connected cells for that board.
func deconstructBoard(board []string) []*cell {
	cells := []*cell{}
	maxCol := len(board[0])
	maxRow := len(board) * maxCol

	for row, rank := range board {
		trimmedRank := strings.Replace(rank, " ", "", -1)
		for col, value := range trimmedRank {
			cells = append(cells, &cell{value: value, row: row, col: col})
		}
	}

	for _, cell := range cells {
		if cell.value == 'O' {
			if cell.row == 0 {
				cell.isStart = true
			}
			if cell.row == len(board)-1 {
				cell.isEnd = true
			}
		} else if cell.value == 'X' {
			if cell.col == 0 {
				cell.isStart = true
			}
			if cell.col == len(board[0])-1 {
				cell.isEnd = true
			}
		}

		offset := cell.row * maxCol
		prevRow := offset - maxCol
		nextRow := offset + maxCol

		if prevRow >= 0 {
			cell.tl = cells[prevRow+cell.col]
			if cell.col < maxCol-1 {
				cell.tr = cells[prevRow+(cell.col+1)]
			}
		}

		if cell.col > 0 {
			cell.l = cells[offset+cell.col-1]
		}

		if cell.col < maxCol-1 {
			cell.r = cells[offset+(cell.col+1)]
		}

		if nextRow < maxRow-1 {
			if cell.col > 0 {
				cell.bl = cells[nextRow+cell.col-1]
			}
			if cell.col < maxCol-1 {
				cell.br = cells[nextRow+(cell.col)]
			}
		}
	}

	return cells
}

func ResultOf(lines []string) (string, error) {
	winner := make(chan rune, 1)

	for _, cell := range deconstructBoard(lines) {
		if cell.isStart {
			cell.findValidChain(winner)
		}
	}

	if len(winner) > 0 {
		return string(<-winner), nil
	} else {
		return "", nil
	}
}
