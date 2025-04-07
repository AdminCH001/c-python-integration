import subprocess

def test_add():
    result = subprocess.run(["./main"], capture_output=True, text=True)
    assert "The sum of 5 and 7 is: 12" in result.stdout

if __name__ == "__main__":
    test_add()
    print("Test passed!")
