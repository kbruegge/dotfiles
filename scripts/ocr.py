#!/usr/bin/env python
import pathlib
import argparse
import subprocess


def dir_path(path):
    try:
        path = pathlib.Path(path)
        if path.exists():
            return path
        else:
            raise argparse.ArgumentTypeError(f"{path} does not seem to exist")
    except:
        raise argparse.ArgumentTypeError(f"{path} is not a valid path")


def parse_arguments():
    parser = argparse.ArgumentParser(description='Process some PDF files')
    parser.add_argument('path', type=dir_path)
    return parser.parse_args()


def main():
    parsed_args = parse_arguments()
    input_path = parsed_args.path

    if input_path.is_dir():
        pdf_files = list(input_path.glob("**/*.pdf"))
        print(f"Found {len(pdf_files)} pdf documents in {input_path}.")
        for pdf_file in pdf_files:
            print(f"Performing OCR for file {pdf_file}")
            perform_ocr(pdf_file)

    else:
        print(f"Found single file {input_path}.")
        perform_ocr(input_path)


def perform_ocr(file_path):
    return_code = subprocess.call(['ocrmypdf', '--skip-text', "-r", "-d", "-q", file_path, file_path])

    if return_code != 0:
        subprocess.check_call(['qpdf', "--decrypt", "--replace-input", file_path])
        subprocess.check_call(['ocrmypdf', '--skip-text', "-r", "-d", "-q", file_path, file_path])
        

if __name__ == "__main__":
    main()