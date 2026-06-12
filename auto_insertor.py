import sys
import os
import re

def to_lower_camel_case(text):
    # Splits "Your Balance" or "your balance" into words, cleans punctuation
    words = re.sub(r'[^a-zA-Z0-9\s]', '', text).split()
    if not words:
        return ""
    # Forces first letter of first word to be lowercase, capitalizes the rest, removes spaces
    return words[0].lower() + "".join(word.capitalize() for word in words[1:])

def to_snake_case(text):
    # Converts "Your Balance" to "your_balance"
    cleaned = re.sub(r'[^a-zA-Z0-9\s]', '', text).lower()
    return "_".join(cleaned.split())

def insert_app_text(file_path, original_input):
    if not os.path.exists(file_path):
        print(f"Error: {file_path} not found.")
        return False

    variable_name = to_lower_camel_case(original_input)  # "yourBalance"
    snake_value = to_snake_case(original_input)        # "your_balance"
    
    new_line = f'  static const String {variable_name} = "{snake_value}";\n'

    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    if f"String {variable_name} =" in content:
        print(f"[{file_path}] Skip: Variable '{variable_name}' already exists.")
        return True

    pattern = r'(class\s+AppText\s*\{[\s\S]*?)(\s*\})'
    if not re.search(pattern, content):
        print(f"Error: Could not locate 'class AppText' block in {file_path}")
        return False

    updated_content = re.sub(pattern, r'\1' + new_line + r'\2', content)

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(updated_content)
        
    print(f"[{file_path}] Success: Inserted '{variable_name}'")
    return True

def insert_translation(file_path, original_input):
    if not os.path.exists(file_path):
        print(f"Error: {file_path} not found.")
        return False

    snake_key = to_snake_case(original_input)  # "your_balance"
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    if f'"{snake_key}":' in content:
        print(f"[{file_path}] Skip: Key '{snake_key}' already exists.")
        return True

    # Keeps original text exactly as entered for the translation value
    new_translation = f',\n      "{snake_key}": "{original_input}"'
    pattern = r'("en_US"\s*:\s*\{[\s\S]*?)(\s*\})'

    if not re.search(pattern, content):
        print(f"Error: Could not locate '\"en_US\": {{' block in {file_path}")
        return False

    updated_content = re.sub(pattern, r'\1' + new_translation + r'\2', content)

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(updated_content)

    print(f"[{file_path}] Success: Inserted key '{snake_key}' under en_US")
    return True

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python auto_insertor.py \"Your Text Here\"")
        sys.exit(1)

    user_param = sys.argv[1].strip()
    
    app_text_path = "lib/constants/app_text.data.dart"
    translation_path = "lib/constants/translation.data.dart"

    print(f"Processing target input: \"{user_param}\"...")
    
    success1 = insert_app_text(app_text_path, user_param)
    success2 = insert_translation(translation_path, user_param)
    
    if success1 and success2:
        print("Done!")