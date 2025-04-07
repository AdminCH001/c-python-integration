import subprocess

def test_add():
    result = subprocess.run(["./main"], capture_output=True, text=True)
    print("result.stdout", result.stdout)
    assert "The sum of 5 and 7 is: 12" in result.stdout

def test_mul():
    result = subprocess.run(["./main"], capture_output=True, text=True)
    print("result.stdout", result.stdout)
    assert "The mul of 5 and 7 is: 35" in result.stdout


if __name__ == "__main__":
    #test_add()
    test_mul()
    print("Test passed!")
