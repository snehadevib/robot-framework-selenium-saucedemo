# Robot Framework + Selenium Test Automation — SauceDemo

Test automation framework built with Robot Framework and Python — UI testing for [saucedemo.com](https://www.saucedemo.com/) with SeleniumLibrary, and API testing for [Restful-Booker](https://restful-booker.herokuapp.com/) with RequestsLibrary.

## Tech Stack

- Python 3.14
- Robot Framework 7.4.2
- SeleniumLibrary 6.9.0 (Selenium 4.48.0)
- VS Code + RobotCode extension

## Project Structure
├── resources/
│ ├── common/
│ │ └── browser_setup.resource # Browser open/close keywords
│ ├── pages/
│ │ ├── login_page.resource # Login page locators & keywords
│ │ ├── inventory_page.resource # Product listing & cart keywords
│ │ └── checkout_page.resource # Checkout flow keywords
│ └── libraries/
│ └── price_utils.py # Custom Python keyword (price validation)
├── tests/
│ ├── smoke_test.robot
│ ├── login_tests.robot
│ ├── cart_tests.robot
│ ├── checkout_tests.robot
│ └── checkout_data_driven_tests.robot
├── results/ # Generated reports (gitignored)
└── requirements.txt


## Setup

```bash
# Clone the repo
git clone https://github.com/snehadevib/robot-framework-selenium-saucedemo.git
cd robot-framework-selenium-saucedemo

# Create and activate a virtual environment
python -m venv venv
source venv/Scripts/activate      # Windows (Git Bash)
# source venv/bin/activate        # macOS/Linux

# Install dependencies
pip install -r requirements.txt
```

## Running Tests

Run the full suite:
```bash
robot --outputdir results tests/
```

Run a specific test file:
```bash
robot --outputdir results tests/login_tests.robot
```

Run by tag:
```bash
robot --outputdir results --include smoke tests/        # Smoke suite only
robot --outputdir results --include regression tests/   # Regression suite only
robot --outputdir results --include login tests/         # Feature-specific
```

Run a single test case:
```bash
robot --outputdir results --test "Valid Login Should Succeed" tests/
```

## Test Coverage

| Suite | Tests | Covers |
|---|---|---|
| Smoke | 1 | Site loads correctly |
| Login | 4 | Valid login, locked-out user, empty field validation |
| Cart | 4 | Add/remove items, cart badge count, cart navigation |
| Checkout | 5 | Full checkout flow, field validation, price total verification |
| Checkout (data-driven) | 4 | Checkout with multiple valid input combinations |

**Total: 18 test cases**

## Reports

After each run, view results at:
- `results/report.html` — summary dashboard
- `results/log.html` — detailed step-by-step execution log
