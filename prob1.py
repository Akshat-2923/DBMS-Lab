# write a program to check a entered charcter in vovel or consonent

def main():
    char = input("Enter a character: ").lower()

    if char in 'aeiou':
        print(f"{char} is a vowel.")
    else:
        print(f"{char} is a consonant.")
