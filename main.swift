/*
Intuition
Use a stack to check bracket balance.

Approach
It is unnecessary to push closing brackets onto the stack. Our stack will only store opening brackets.

Use a Dictionary to store closing brackets as keys and opening brackets as values. We will use this to match brackets.

If the stack is empty and if the character is an opening bracket, append it to the stack.

If the character is a closing bracket, and it is a match for the opening bracket on the top of the stack, remove the bracket from the top of the stack.

If the character is a closing bracket, and it is not a match for an opening bracket on the top of the stack, return false. Logic: A corresponding opening bracket does not exisit and it is therefore invalid.

Else, append the opening bracket to the stack.

At the end, we return true if there are no opening brackets left on the stack.

Complexity
Time complexity:
O(n)

Space complexity:
O(n)
*/

func isValid(_ s: String) -> Bool {
    var stack: [Character] = []
    var bracketMatch: [Character: Character] = [")": "(", "}": "{", "]": "["]
    for char in s {
        if let last = stack.last, last == bracketMatch[char] {
            stack.removeLast()
        } else {
            switch char {
                case ")", "}", "]":
                    return false
                default:
                    stack.append(char)
            }
        }
    }
    return stack.count == 0
}