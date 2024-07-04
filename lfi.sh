#!/bin/bash

# Function to perform LFI testing for given URLs
lfi_testing() {
    local input_file=$1
    local base_dir=$(dirname "${input_file}")
    local exploit_dir="${base_dir}/exploit"
    local original_dir=$(pwd)
    
    # Check if input file exists
    if [[ ! -f "${input_file}" ]]; then
        echo "Error: ${input_file} not found!"
        exit 1
    fi

    # Create exploit directory if it doesn't exist
    mkdir -p "${exploit_dir}"

    echo "Performing LFI testing on URLs in ${input_file}..."

    # # Perform Directory traversal testing and save the results
    # cd /root/tool/dotdotpwn
    # while read -r url; do
    #     dotdotpwn -m http -h "$url" -o "${exploit_dir}/directory_traversal_results.txt"
    # done < "${input_file}"
    # cd "${original_dir}"
    # echo "Directory traversal testing completed. Results saved to ${exploit_dir}/directory_traversal_results.txt"

    # Perform LFI testing and save the results
    # cd /root/tool/liffy
    # python3 -m venv liffy
    # source liffy/bin/activate
    # while read -r url; do
    #     python3 liffy.py "$url"  > "${exploit_dir}/lfi_results.txt"
    # done < "${input_file}"
    # deactivate
    # cd "${original_dir}"
    # echo "LFI testing completed. Results saved to ${exploit_dir}/lfi_results.txt"

    cat "${input_file}" | uro | sed 's/=.*/=/' | gf lfi | nuclei -tags lfi

    echo "Script execution completed."
}

# Check if input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

# Run the LFI testing function with the provided input file
lfi_testing "$1"
