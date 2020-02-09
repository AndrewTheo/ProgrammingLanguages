package triangle

import "testing"

func TestGetTriangleType(t *testing.T) {
	tests := []struct {
		a, b, c  int
		expected triangleType
	}{
		{1001, 5, 6, UnknownTriangle},
		{5, 2001, 6, UnknownTriangle},
		{5,6,3001, UnknownTriangle},
		{-1,5,6,UnknownTriangle},
		{5,-1,6,UnknownTriangle},
		{5,6,-1,UnknownTriangle},
		{5,5,15,InvalidTriangle},
		{3,4,5,RightTriangle},
		{4,4,7,AcuteTriangle},
		{1,1,1,ObtuseTriangle},
		// TODO add more tests for 100% test coverage
	}

	for _, test := range tests {
		actual := getTriangleType(test.a, test.b, test.c)
		if actual != test.expected {
			t.Errorf("getTriangleType(%d, %d, %d)=%v; want %v", test.a, test.b, test.c, actual, test.expected)
		}
	}
}
