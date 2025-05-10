import sys

def process_file(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            if line.strip().startswith('mean return'):
                # Find the position of the first ']'
                bracket_pos = line.find(']')
                if bracket_pos != -1:
                    # Keep only up to and including the first ']'
                    modified_line = line[:bracket_pos + 1] + '\n'
                    outfile.write(modified_line)
                else:
                    # If no ']' found, keep the whole line
                    outfile.write(line)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file> <output_file>")
        sys.exit(1)
    
    input_filename = sys.argv[1]
    output_filename = sys.argv[2]
    
    process_file(input_filename, output_filename)
    print(f"File processed. Results saved to {output_filename}")