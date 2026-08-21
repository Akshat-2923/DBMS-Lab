# WAP to print degits(0-9) in words using dictionary to store digits and print the word based on user input.

def main():
    digits = {
        0: "Zero",
        1: "One",
        2: "Two",
        3: "Three",
        4: "Four",
        5: "Five",
        6: "Six",
        7: "Seven",
        8: "Eight",
        9: "Nine"
    }

    digit_number = int(input("Enter a digit (0-9) to get the corresponding word: "))
    
    if digit_number in digits:
        print(f"The word corresponding to {digit_number} is {digits[digit_number]}.")
    else:
        print("Invalid input. Please enter a digit between 0 and 9.")   