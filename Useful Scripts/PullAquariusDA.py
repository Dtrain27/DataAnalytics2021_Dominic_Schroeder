from bs4 import BeautifulSoup 
import requests
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

AQUARIUS_DATA = "http://aquarius.tw.rpi.edu/html/DA"

# lists 
urls=[] 

# function created 
def scrape(site): 
       
    # getting the request from url 
    r = requests.get(site, verify=False) 
       
    # converting the text 
    s = BeautifulSoup(r.text,"html.parser") 
       
    for i in s.find_all("a"): 
          
        href = i.attrs['href']

        if href.startswith("/"): 
            site = site+href 
               
            if site not in  urls: 
                urls.append(site)  
                print(site) 
                # calling it self 
                #scrape(site)
        elif href.endswith("/"):
            site = "/" + site + href
            


# main function 
if __name__ =="__main__": 
   
    # calling function 
    scrape(AQUARIUS_DATA) 