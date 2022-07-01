import subprocess

from argparse import ArgumentParser


def update_file(version_code: str, checksum: str):
    original_file = open("Package.swift", "r")
    list_of_lines = original_file.readlines()

    list_of_lines[22] = f"            url: \"https://github.com/ShamSundar17/iOSTestDRSPM/releases/download/" \
                        f"{version_code}/SDK_{version_code}.zip\",\n"
    list_of_lines[23] = f"            checksum: \"{checksum}\"\n"

    a_file = open("Package.swift", "w")
    a_file.writelines(list_of_lines)
    a_file.close()

    print("file overwritten")


def git_push(message: str, tag_name: str):
    #sh ../SDKiOS-SP/git_commands.sh -v="x.x.x" -m="commit message"
    command = f"sh git_commands.sh -v=\"{tag_name}\" -m=\"{message}\""
    output = subprocess.run(command, capture_output=True, shell=True)

    print("files pushed to git and tagged")


def calculate_checksum(version_name: str):

    command = f"swift package compute-checksum ../Digita1Reef/DigitalReefiOS/build/SDK_{version_name}.zip"
    output = subprocess.run(command, capture_output=True, shell=True)
    output = output.stdout.decode("utf-8").strip()

    print(f"checksum:{output}")

    return output


def zip_xcframework(version_name: str):
    # ditto -c -k --sequesterRsrc --keepParent ../SDKFlowsenseiOS/build/FlowsenseSDK.xcframework \
    # ../SDKiOS-SP/frameworks/version_name.zip
    command = f"ditto -c -k --sequesterRsrc --keepParent ../Digita1Reef/DigitalReefiOS/build/FlowsenseSDK.xcframework " \
              f"../Digita1Reef/DigitalReefiOS/build/SDK_{version_name}.zip"
    subprocess.run(command, capture_output=True, shell=True)

    print("xcframework zipped")


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("-v", "--version", dest="version_code",
                        help="the version code for this release")

    args = parser.parse_args()
    version_code = args.version_code

    zip_xcframework(version_code)
    checksum = calculate_checksum(version_code)
    update_file(version_code, checksum)

    git_push(f'Update the SDK for version: {version_code}', version_code)
    print("end")
