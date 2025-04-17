#include <iostream>
#include <string>
#include <cctype>

using namespace std;

class Parser {
private:
    string input;
    int index;
    char currentChar;

    // Production rules:
    // S -> id = E
    // E -> num - num
    
    void advance() {
        if (index < input.length()) {
            currentChar = input[index++];
        } else {
            currentChar = '\0';
        }
    }

    bool match(char expected) {
        if (currentChar == expected) {
            advance();
            return true;
        }
        return false;
    }

    bool isSpace(char c) {
        return c == ' ' || c == '\t';
    }

    void skipWhitespace() {
        while (isSpace(currentChar)) {
            advance();
        }
    }

    bool parseId() {
        skipWhitespace();
        if (currentChar == 'i') {
            advance();
            if (currentChar == 'd') {
                advance();
                return true;
            }
        }
        return false;
    }

    bool parseNum() {
        skipWhitespace();
        string num;
        while (isdigit(currentChar)) {
            num += currentChar;
            advance();
        }
        return !num.empty();
    }

    bool parseE() {
        // E -> num - num
        if (!parseNum()) {
            cout << "Error: Expected first number" << endl;
            return false;
        }
        
        skipWhitespace();
        if (!match('-')) {
            cout << "Error: Expected '-'" << endl;
            return false;
        }
        
        skipWhitespace();
        if (!parseNum()) {
            cout << "Error: Expected second number" << endl;
            return false;
        }
        
        return true;
    }

public:
    Parser(const string& input) : input(input), index(0) {
        advance();
    }

    bool parse() {
        // S -> id = E
        if (!parseId()) {
            cout << "Error: Expected 'id'" << endl;
            return false;
        }

        skipWhitespace();
        if (!match('=')) {
            cout << "Error: Expected '='" << endl;
            return false;
        }

        if (!parseE()) {
            return false;
        }

        skipWhitespace();
        if (currentChar != '\0') {
            cout << "Error: Unexpected characters at end" << endl;
            return false;
        }

        return true;
    }
};

int main() {
    string testCases[] = {
        "id = 123-456",
        "id=42-17",
        "id = 10 - 5",
        "id=10-",         // Invalid
        "id = abc-123",   // Invalid
        "identifier = 1-2", // Invalid
        "id = 1 - 2 - 3"  // Invalid
    };

    for (const string& test : testCases) {
        Parser parser(test);
        cout << "Testing: \"" << test << "\" -> ";
        if (parser.parse()) {
            cout << "Valid" << endl;
        } else {
            cout << "Invalid" << endl;
        }
    }

    return 0;
}
