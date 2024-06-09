from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def helloWorld(self):
        print("Hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        i = 1
        productsTitles = self.selLib.get_webelements("xpath://h4[@class='card-title']")

        for productTitle in productsTitles:
            if productTitle.text in productsList:
                self.selLib.click_button("xpath:(//div[@class='card-footer'])[" + str(i) + "]/button")

            i = i + 1

        self.selLib.click_link("xpath://a[@class='nav-link btn btn-primary']")
